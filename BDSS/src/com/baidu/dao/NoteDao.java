package com.baidu.dao;

import java.util.List;

import com.baidu.vo.Note;

public interface NoteDao {
	public String addNote(int s_id,String note,String nextnotedate);
	public List<Note> getNotes(int s_id);
}
