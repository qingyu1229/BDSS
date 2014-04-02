package com.baidu.dao;

import java.util.HashMap;
import java.util.List;

import com.baidu.vo.SalesRecord;

public interface SalesRecordDao {
	
	/**
	 * 添加客户信息
	 * @param sr
	 * @return
	 */
	public boolean add(SalesRecord sr);
	
	/**
	 * 修改客户信息
	 * @param sr
	 * @return
	 */
	public String modify(SalesRecord sr);
	
	/**
	 * 客户信息成单
	 * @param sr
	 * @return
	 */
	public String chengdan(int s_id);
	
	/**
	 * 多条件查询客户信息
	 * @param map
	 * @return
	 */
	public List<SalesRecord> selectSalesRecords(HashMap<String,String> map);
	
	/**
	 * 根据id查询客户信息
	 * @param id
	 * @return
	 */
	public SalesRecord selectSalesRecord(int id);
	
	/**
	 * 更新下次跟进时间
	 * @param map
	 */
	public void updateNextnotedate(HashMap<String,Object> map);
	
	
}
