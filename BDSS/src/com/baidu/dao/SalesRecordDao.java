package com.baidu.dao;

import java.util.HashMap;
import java.util.List;

import com.baidu.vo.SalesRecord;

public interface SalesRecordDao {
	
	/**
	 * ��ӿͻ���Ϣ
	 * @param sr
	 * @return
	 */
	public boolean add(SalesRecord sr);
	
	/**
	 * �޸Ŀͻ���Ϣ
	 * @param sr
	 * @return
	 */
	public String modify(SalesRecord sr);
	
	/**
	 * �ͻ���Ϣ�ɵ�
	 * @param sr
	 * @return
	 */
	public String chengdan(int s_id);
	
	/**
	 * ��������ѯ�ͻ���Ϣ
	 * @param map
	 * @return
	 */
	public List<SalesRecord> selectSalesRecords(HashMap<String,String> map);
	
	/**
	 * ����id��ѯ�ͻ���Ϣ
	 * @param id
	 * @return
	 */
	public SalesRecord selectSalesRecord(int id);
	
	/**
	 * �����´θ���ʱ��
	 * @param map
	 */
	public void updateNextnotedate(HashMap<String,Object> map);
	
	
}
