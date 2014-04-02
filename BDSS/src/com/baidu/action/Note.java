package com.baidu.action;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.baidu.ConnFactory.IbatisConnectionFactory;
import com.baidu.imp.NoteImp;
import com.baidu.vo.Note2;
import com.opensymphony.xwork2.ActionSupport;

public class Note extends ActionSupport{
	private int s_id;
	private String note;
	private String nextnotedate;
	private HashMap<String,String> addNoteMap=new HashMap<String,String>();
	private HashMap<String,Object> notesMap=new HashMap<String, Object>();
	private HashMap<String,Object> noteMap=null;
	
	
	/**
	 * Ìí¼Ó¸ú½ø
	 * @return
	 */
	public String addNote(){
		NoteImp ni=new NoteImp();
		String ss=ni.addNote(s_id, note,nextnotedate);
		addNoteMap.put("result", ss);
		return SUCCESS;
	}
	
	public String getNotes(){
		NoteImp ni=new NoteImp();
		List<com.baidu.vo.Note> list= ni.getNotes(s_id);
		System.out.println("list----"+list);
		if(list==null||list.size()==0){
			notesMap.put("result", "nodata");
		}else {
			notesMap.put("result", "success");
			notesMap.put("info", list);
		}
		return SUCCESS;
	}
	
	public String getNote(){
		noteMap=new HashMap<String, Object>();
		Note2 note=new Note2();
		System.out.println("s_id--"+s_id);
		try {
			note=(Note2)IbatisConnectionFactory.getSqlMapClient().queryForObject("selectNote", s_id);
			if(note!=null){
				 noteMap.put("result", "success");
				 noteMap.put("info", note);
			}else{
				noteMap.put("result", "error");
			}
		} catch (SQLException e) {
			noteMap.put("result", "error");
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public HashMap<String, Object> getNoteMap() {
		return noteMap;
	}
	public HashMap<String, String> getAddNoteMap() {
		return addNoteMap;
	}
	public void setS_id(int s_id){
		this.s_id = s_id;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public void setNextnotedate(String nextnotedate) {
		this.nextnotedate = nextnotedate;
	}
	public HashMap<String, Object> getNotesMap() {
		return notesMap;
	}
}
