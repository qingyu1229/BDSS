package com.baidu.imp;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.baidu.ConnFactory.IbatisConnectionFactory;
import com.baidu.dao.NoteDao;
import com.baidu.vo.Note;

public class NoteImp implements NoteDao {

	public String addNote(int s_id,String note,String nextnotedate){
		int n_id=0;
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("s_id", s_id);
		map.put("note", note);
		map.put("date", new Date());
		map.put("nextnotedate", nextnotedate);
		try {
			SalesRecordImp sri=new SalesRecordImp();
			sri.updateNextnotedate(map);
		    n_id=	(Integer) IbatisConnectionFactory.getSqlMapClient().insert("addnote", map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(n_id>0){
			return "success";
		}else{
			return "error";
		}
	}

	@SuppressWarnings("unchecked")
	public List<Note> getNotes(int s_id) {
		List<Note> list=new ArrayList<Note>();
		try {
			list=IbatisConnectionFactory.getSqlMapClient().queryForList("getnotes", s_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
