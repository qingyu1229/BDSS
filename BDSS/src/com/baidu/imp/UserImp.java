package com.baidu.imp;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.baidu.ConnFactory.IbatisConnectionFactory;
import com.baidu.dao.UserDao;
import com.baidu.vo.User;
import com.baidu.vo.User3;

public class UserImp implements UserDao {

	/*public UserImp(){
		System.out.println("UserImp±»´´½¨");
	}*/
	
	public boolean checkUsername(String username) {
		int count=0;
		try {
			count=(Integer)IbatisConnectionFactory.getSqlMapClient().queryForObject("checkusername", username);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(count>0){
			return true;
		}
		return false;
	}
	
	
	public boolean addUser(User user) {
		int id=0;
		try {
			id=(Integer) IbatisConnectionFactory.getSqlMapClient().insert("register", user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(id!=0){
			return true;
		}
		return false;
	}
	public String modifyPassword(String newPassword, String oldPassword,
			int u_id) {
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("newpwd", newPassword);
		map.put("oldPassword", oldPassword);
		map.put("u_id", u_id);
		try {
			int count=0;
			count= (Integer) IbatisConnectionFactory.getSqlMapClient().queryForObject("checkOldPWD", map);
			if(count==0){
				return "oldPWDError";
			}else{
				IbatisConnectionFactory.getSqlMapClient().update("modifyPwd", map);
				return "success";
			}
		} catch (SQLException e){
			e.printStackTrace();
			return "error";
		}
	}

	public boolean fireEmp(int u_id) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean jiHuo(int u_id) {
		// TODO Auto-generated method stub
		return false;
	}

	public User Login(String username, String password) {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("username", username);
		map.put("password", password);
		try {
		    User user=(User)IbatisConnectionFactory.getSqlMapClient().queryForObject("login",map);
		    return user;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public User3 checkInfo(int u_id){
		User3 user=new User3();
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		map.put("u_id", u_id);
		try {
			 user= (User3) IbatisConnectionFactory.getSqlMapClient().queryForObject("getUserInfo", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	public List<User> checkEmpInfos(int u_id, int permission) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/*public static void main(String[] args) {
		UserImp ui=new UserImp();
		User u=ui.Login("dddddd", "dddddd");
		System.out.println(u.toString());
	}*/
}
