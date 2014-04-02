package com.baidu.dao;

import java.util.List;

import com.baidu.vo.User;
import com.baidu.vo.User3;

public interface UserDao {
	/**
	 * ����û����Ƿ��ظ�
	 * @param username
	 * @return
	 */
	public boolean checkUsername(String username);
	
	
	/**
	 * ע�����û�
	 * @param user
	 */
	public boolean addUser(User user);	
	
	
	/**
	 * �޸�����
	 * @param newPassword
	 * @param oldPassword
	 * @param u_id
	 * @return
	 */
	public String modifyPassword(String newPassword,String oldPassword,int u_id);
	
	
	/**
	 * Ա����ְ
	 * @param u_id
	 * @return
	 */
	public boolean fireEmp(int u_id);
	
	
	/**
	 * ����Ա���˺�
	 * @param u_id
	 * @return
	 */
	public boolean jiHuo(int u_id);
	
	
	/**
	 * �û���¼������User����
	 * @param username
	 * @param password
	 * @return
	 */
	public User Login(String username,String password);
	
	/**
	 * �����û�id�鿴�û���Ϣ
	 * @param u_id
	 * @return
	 */
	public User3 checkInfo(int u_id);
	
	/**
	 * �߼�Ȩ���˻��鿴�����˻���Ϣ
	 * @param u_id
	 * @param permission
	 * @return
	 */
	public List<User> checkEmpInfos(int u_id,int permission);
	
}
