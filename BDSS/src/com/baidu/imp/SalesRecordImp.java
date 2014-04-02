package com.baidu.imp;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.baidu.ConnFactory.IbatisConnectionFactory;
import com.baidu.dao.SalesRecordDao;
import com.baidu.vo.SalesRecord;

public class SalesRecordImp implements SalesRecordDao {

	public boolean add(SalesRecord sr) {
		try {
			IbatisConnectionFactory.getSqlMapClient().insert("addRecord", sr);
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public String modify(SalesRecord sr) {
		String s="error";
		try {
			IbatisConnectionFactory.getSqlMapClient().update("modifyInfo", sr);
			s="success";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return s;
	}

	public String chengdan(int s_id) {
		String s="error";
		try {
			IbatisConnectionFactory.getSqlMapClient().update("chengdan", s_id);
			s="success";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return s;
	}

	public List<SalesRecord> selectSalesRecords(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	public SalesRecord selectSalesRecord(int id) {
		SalesRecord sr=new SalesRecord();
		try {
			sr= (SalesRecord) IbatisConnectionFactory.getSqlMapClient().queryForObject("selectSalesRecord", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sr;
	}
	/*public static void main(String[] args) {
		SalesRecordImp sri=new SalesRecordImp();
		SalesRecord sr=new SalesRecord();
		sr.setCompanyname("name");
		sr.setAddress("address");
		sr.setComment("comment");
		sr.setIndustry("qt");
		sr.setIntention("A");
		sr.setDataSource("°¡°¡");
		sr.setFax("111111");
		sr.setLinkman("linkman");
		sr.setNextnotedate("2013-7-29");
		sr.setTown("qt");
		sr.setPhone("0715555555");
		sr.setWebsite("website");
		sr.setSalerId(22);
		sri.add(sr);
	}*/

	public void updateNextnotedate(HashMap<String, Object> map) {
		try {
			IbatisConnectionFactory.getSqlMapClient().update("updateNextnotedate", map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
