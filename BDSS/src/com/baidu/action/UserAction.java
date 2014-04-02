package com.baidu.action;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import md5.DegistUtil;

import org.apache.struts2.interceptor.SessionAware;

import com.baidu.ConnFactory.IbatisConnectionFactory;
import com.baidu.imp.UserImp;
import com.baidu.vo.User;
import com.baidu.vo.User3;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User>,
		SessionAware {
	private User user = new User();
	private UserImp userImp = new UserImp();
	private int u_id;
	private String oldPWD;
	private String newPWD;
	private String icode;
	private HashMap<String,String> modifyPWDMap=null;
	private HashMap<String,Object> userInfoMap=null;
	private HashMap<String,Object> resultMap=null;
	private Map<String, Object> session;
	/**
	 * 检查用户名是否已存在
	 * 
	 * @return
	 */
	public String checkUsername() {
		boolean bl = userImp.checkUsername(user.getUsername());
		if (!bl) {
			return SUCCESS;
		} else {
			return ERROR;
		}
	}

	/**
	 * 新用户注册
	 * 
	 * @return
	 */
	public String addUser() {
		// System.out.println("user--"+user.toString());
		boolean bl = userImp.addUser(user);
		if (bl) {
			return SUCCESS;
		}
		return ERROR;
	}

	/**
	 * 用户登陆
	 * 
	 * @return
	 */
	public String login() {
		Date d=new Date();
		System.out.println("用户登陆--" + user.getUsername()+"--时间--"+d);
		String flag = "";
		User u = userImp.Login(user.getUsername(), user.getPassword());
		
		if(!icode.equals(session.get("rand"))){
			this.addFieldError("imagefail", "验证码错误！");
			return ERROR;
		}
		
		if (u != null) {
			System.out.println(u.toString());
			if (u.getActivation() == 0) {
				flag = "NoAct";// 没有激活
			} else {
				flag = SUCCESS;
			}
			session.put("id", u.getId());
			session.put("realname", u.getRealname());
			session.put("permission", u.getPermission());
			session.put("company", u.getCompany());
		} else {
			flag = ERROR;
			this.addFieldError("loginfail", "用户名或密码错误");
		}
		return flag;
	}
	public String modifyPWD(){
		modifyPWDMap=new HashMap<String,String>();
	   String s=userImp.modifyPassword(DegistUtil.produceDegistCode(newPWD),DegistUtil.produceDegistCode(oldPWD) , u_id);
	   modifyPWDMap.put("result", s);
		return SUCCESS;
	}
	
	
	public String modifyPWD2(){
		modifyPWDMap=new HashMap<String,String>();
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("newpwd", DegistUtil.produceDegistCode(newPWD));
		map.put("u_id", u_id);
		try {
			int i=IbatisConnectionFactory.getSqlMapClient().update("modifyPwd", map);
			if(i>0){
				 modifyPWDMap.put("result", "success");
			}else{
				modifyPWDMap.put("result", "error");
			}
		} catch (SQLException e) {
			modifyPWDMap.put("result", "error");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String getUserInfo(){
		userInfoMap=new HashMap<String,Object>();
		User3 u= userImp.checkInfo(u_id);
		if(u!=null){
			userInfoMap.put("result", "success");
			userInfoMap.put("info", u);
		}else{
			userInfoMap.put("result", "error");
		}
		return SUCCESS;
	}
	
	public String getNeedNote(){
		resultMap=new HashMap<String,Object>();
		try {
			int count= (Integer) IbatisConnectionFactory.getSqlMapClient().queryForObject("getneednote", u_id);
			resultMap.put("result", "success");
			resultMap.put("count",count);
			System.out.println("---"+count);
		} catch (SQLException e) {
			resultMap.put("result", "error");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	public HashMap<String, Object> getUserInfoMap() {
		return userInfoMap;
	}
	public HashMap<String, Object> getResultMap() {
		return resultMap;
	}

	public void setUser(User user) {
		this.user = user;
	}
	public void setUserImp(UserImp userImp) {
		this.userImp = userImp;
	}
	public User getModel() {
		return user;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public HashMap<String, String> getModifyPWDMap() {
		return modifyPWDMap;
	}
	public void setOldPWD(String oldPWD) {
		this.oldPWD = oldPWD;
	}
	public void setNewPWD(String newPWD) {
		this.newPWD = newPWD;
	}
	public void setIcode(String icode) {
		this.icode = icode;
	}
}
