package com.baidu.dao;

import java.util.List;

import com.baidu.vo.User;
import com.baidu.vo.User3;

public interface UserDao {
	/**
	 * 检查用户名是否重复
	 * @param username
	 * @return
	 */
	public boolean checkUsername(String username);
	
	
	/**
	 * 注册新用户
	 * @param user
	 */
	public boolean addUser(User user);	
	
	
	/**
	 * 修改密码
	 * @param newPassword
	 * @param oldPassword
	 * @param u_id
	 * @return
	 */
	public String modifyPassword(String newPassword,String oldPassword,int u_id);
	
	
	/**
	 * 员工离职
	 * @param u_id
	 * @return
	 */
	public boolean fireEmp(int u_id);
	
	
	/**
	 * 激活员工账号
	 * @param u_id
	 * @return
	 */
	public boolean jiHuo(int u_id);
	
	
	/**
	 * 用户登录，返回User对象
	 * @param username
	 * @param password
	 * @return
	 */
	public User Login(String username,String password);
	
	/**
	 * 根据用户id查看用户信息
	 * @param u_id
	 * @return
	 */
	public User3 checkInfo(int u_id);
	
	/**
	 * 高级权限账户查看下属账户信息
	 * @param u_id
	 * @param permission
	 * @return
	 */
	public List<User> checkEmpInfos(int u_id,int permission);
	
}
