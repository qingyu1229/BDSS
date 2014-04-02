package com.baidu.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jxl.CellType;
import jxl.DateCell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.struts2.ServletActionContext;

import com.baidu.ConnFactory.IbatisConnectionFactory;
import com.baidu.imp.SalesRecordImp;
import com.baidu.utils.DoInfoUtil;
import com.baidu.values.Values;
import com.baidu.vo.SalesRecord;
import com.baidu.vo.SalesRecord2;
import com.opensymphony.xwork2.ActionContext;

public class AddByExcel {
	// 封装上传文件域的属性
    private File file;
    // 封装上传文件类型的属性
    private String fileContentType;
    // 封装上传文件名的属性
    private String FileName="";
    // 接受依赖注入的属性
    private String savePath;
    
    public String saveFile(){
    	ActionContext actionContext = ActionContext.getContext();
    	int u_id= (Integer) actionContext.getSession().get("id");
    	//System.out.println("FileName-"+FileName);
    	System.out.println("u_id-"+u_id);
    	FileName=u_id+".xls";
    	System.out.println("fileContentType----"+fileContentType);
    	if(!("application/vnd.ms-excel".equals(fileContentType)||"application/excel".equals(fileContentType))){
    		 actionContext.getSession().put("result", "提交的文件格式不正确！请重新提交！");
    		return "success";
    	}
    	
    	//System.out.println("contenttype--"+fileContentType+"--filename--"+FileName+"-savePath"+savePath);
    	FileOutputStream fos = null;
        FileInputStream fis = null;
        try {
            // 建立文件输出流
            System.out.println(getSavePath());
            
            File f1=new File(getSavePath());
            if(!f1.exists()){
            	f1.mkdir();
            }
            
            File f=new File(getSavePath() + "\\" + getFileName());
            if(f.exists()){
            	f.delete();
            }
            fos = new FileOutputStream(getSavePath() + "\\" + getFileName());
            // 建立文件上传流
            fis = new FileInputStream(getFile());
            byte[] buffer = new byte[1024];
            int len = 0;
            while ((len = fis.read(buffer)) > 0) {
                fos.write(buffer, 0, len);
            }
        } catch (Exception e) {
        	 actionContext.getSession().put("result", "文件上传失败！");
            System.out.println("文件上传失败");
            e.printStackTrace();
        } finally {
            close(fos, fis);
        }
        //int id=(Integer) actionContext.getSession().get("id");
        String re= saveInfo(getSavePath() + "\\" + FileName,u_id);
       
        actionContext.getSession().put("result", re);
        
    	return "success";
    }
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public String getFileName() {
		return FileName;
	}
	public void setFileName(String fileName) {
		FileName = fileName;
	}
	public String getSavePath() {
		return ServletActionContext.getServletContext().getRealPath(savePath);
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	
	   private void close(FileOutputStream fos, FileInputStream fis) {
	        if (fis != null) {
	            try {
	                fis.close();
	            } catch (IOException e) {
	                System.out.println("FileInputStream关闭失败");
	                e.printStackTrace();
	            }
	        }
	        if (fos != null) {
	            try {
	                fos.close();
	            } catch (IOException e) {
	                System.out.println("FileOutputStream关闭失败");
	                e.printStackTrace();
	            }
	        }
	    }
	   
	   public String saveInfo(String ExcelFilepath,int u_id){
			List<SalesRecord2> list = new ArrayList<SalesRecord2>();
			try {
				
				//String path=ExcelFilepath+u_id+".xls";
				Workbook workbook = Workbook.getWorkbook(new File(ExcelFilepath));
				Sheet ws= workbook.getSheet(0);
				int rows=ws.getRows();
				
				if(rows<=1){
					  //ActionContext.getContext().getSession().put("result", "无数据！添加失败！");
					  return "无数据！添加失败！";
				}
				
				System.out.println("rows--"+rows);
				String check_f=checkExcel(ws);
				System.out.println(check_f);
				if(!"OK".equals(check_f)){
					return check_f;
				}
				 //String[] s={"公司名称","联系人","电话","意向","资料来源","行业","城镇","地址","录入时间","下次跟进时间","公司网站","传真","备注"};
				SalesRecordImp sri=new SalesRecordImp();
				for(int i=1;i<rows;i++){
					Map<String,String> map=new HashMap<String,String>();
					map.put("companyname", ws.getCell(0, i).getContents().trim());
					map.put("intention", ws.getCell(3, i).getContents().trim());
					System.out.println(ws.getCell(1, i).getContents().trim());
					map.put("linkman", ws.getCell(1, i).getContents().trim());
					map.put("phone", ws.getCell(2, i).getContents().trim());
					map.put("address", ws.getCell(7, i).getContents().trim());
					map.put("industry", DoInfoUtil.doIndutry(ws.getCell(5, i).getContents().trim()));
					map.put("nextnotedate",ws.getCell(8, i).getContents().trim());
					map.put("town",DoInfoUtil.doTown(ws.getCell(6, i).getContents().trim()));
					map.put("dataSource", ws.getCell(4, i).getContents().trim());
					map.put("fax", ws.getCell(10, i).getContents().trim());
					map.put("website", ws.getCell(9, i).getContents().trim());
					map.put("comment", ws.getCell(11, i).getContents().trim());
					map.put("salerId", String.valueOf(u_id));
					map.put("accomplished", "0");
					
					//sr.setDate((java.sql.Date)((DateCell)ws.getCell(i, 8)).getDate());
					
					//ws.getCell(i, 8);
					IbatisConnectionFactory.getSqlMapClient().insert("addRecord", map);
					
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (BiffException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   return "success";
	   }
	   
	   private static String checkExcel(Sheet ws){
		   int rows=ws.getRows();
		   //行数不能超过500
		   if(rows>Values.ROWS){
			   return "行数不能超过上线";
		   }
		   String[] s={"公司名称","联系人","电话","意向","资料来源","行业","城镇","地址","下次跟进时间","公司网站","传真","备注"};
		   for(int i=0;i<s.length;i++){
			   //检查第一行是否正确
			   //System.out.println(ws.getCell(i, 0).getContents().trim());
			   if(!s[i].equals((ws.getCell(i, 0).getContents().trim()))){
				   return "各列顺序或标题不正确";
			   }
		   }
		   
		   for(int i=1;i<rows;i++){
			   //公司名称
			   if(ws.getCell(0, i).getContents()==null){
				   return "第"+(i+1)+"行的公司名称为空！请检查格式后重新提交！";
			   }
			   //联系人
			   if(ws.getCell(1, i).getContents()==null){
				   return "第"+(i+1)+"行的联系人为空！请检查格式后重新提交！";
			   }
			   //电话
			   if(ws.getCell(2, i).getContents()==null){
				   return "第"+i+1+"行的电话为空！请检查格式后重新提交！";
			   }
			   
			   //意向
			   if(ws.getCell(3, i).getContents()==null){
				   return "第"+(i+1)+"行的意向为空！请检查格式后重新提交！";
			   }else{
				  String cellvalue=ws.getCell(3, i).getContents().trim().toUpperCase();
				  //System.out.println(i+"--"+cellvalue);
				  if(!(cellvalue.equals("A")||cellvalue.equals("B")||cellvalue.equals("C")||cellvalue.equals("D"))){
					  return "第"+(i+1)+"行的意向格式不对！请检查格式后重新提交！";
				  }
			   }
			   //资料来源
			   if(ws.getCell(4, i).getContents()==null){
				   return "第"+(i+1)+"行的资料来源为空！请检查格式后重新提交！";
			   }
			   //行业
			   if(ws.getCell(5, i).getContents()==null){
				   return "第"+(i+1)+"行的行业为空！请检查格式后重新提交！";
			   }else{
				   String s_indsutry=DoInfoUtil.doIndutry(ws.getCell(5, i).getContents().trim());
				   if("".equals(s_indsutry)||s_indsutry==null){
					   return "第"+(i+1)+"行的行业格式不对！请检查格式后重新提交！";
				   }
			   }
			   
			   //城镇
			   if(ws.getCell(6, i).getContents()==null){
				   return "第"+(i+1)+"行的城镇为空！请检查格式后重新提交！";
			   }else{
				   String s_town=ws.getCell(6, i).getContents().trim();
				   if("".equals(s_town)||s_town==null){
					   return "第"+(i+1)+"行的城镇格式不对！请检查格式后重新提交！";
				   }
			   }
			   
			   
			   //地址
			   if(ws.getCell(7, i).getContents()==null){
				   return "第"+(i+1)+"行的地址为空！请检查格式后重新提交！";
			   }
			  
			   //下次跟进时间
			   if(ws.getCell(8, i).getContents()==null){
				   return "第"+(i+1)+"行的下次跟进时间为空！请检查格式后重新提交！";
			   }else{
				  if(ws.getCell(8,i).getType()!=CellType.DATE){
					  return "第"+(i+1)+"行的下次跟进时间格式不对！请检查格式后重新提交！";
				  }
			   }
		   }
		   return "OK";
	   }
}
