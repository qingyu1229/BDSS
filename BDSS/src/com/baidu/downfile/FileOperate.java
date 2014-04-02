package com.baidu.downfile;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

import com.baidu.ConnFactory.IbatisConnectionFactory;
import com.baidu.values.Values;
import com.baidu.vo.SalesRecord2;
import com.baidu.xml.DoXML;

public class FileOperate {

	// private String path = "c://baidufile/";
	private String u_id;
	private String s_path;

	public FileOperate(String u_id) {
		this.u_id = u_id;
		s_path = Values.XMLPath + "//" + u_id + ".xml";
	}

	/*
	 * private boolean deleteFile() { boolean bl = false; File file = new
	 * File(path); String[] str1 = file.list();
	 * //System.out.println(str1.length); if (str1.length > 0) { for (int i = 0;
	 * i < str1.length; i++) { String filePath = path + str1[i]; File f = new
	 * File(filePath); if (f.exists() && f.isFile()) { bl = f.delete(); } } }
	 * return bl; }
	 */

	public String saveFile() {
		// deleteFile();

		String e_path = Values.XMLPath + "//" + u_id + ".xls";

		DoXML doxml = new DoXML(s_path, Values.XMLRoot);
		HashMap<String, String> map = doxml.readXML();
		map.remove("pagecount");
		map.remove("pagebegin");

		List<SalesRecord2> list = new ArrayList<SalesRecord2>();
		try {
			list = IbatisConnectionFactory.getSqlMapClient().queryForList(
					"getSalesRecords", map);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		try {
			WritableWorkbook workbook = Workbook
					.createWorkbook(new File(e_path));

			WritableSheet sheet = workbook.createSheet("工作表一", 0);
			Label label0 = new Label(0, 0, "序号");
			sheet.addCell(label0);
			Label label1 = new Label(1, 0, "公司名称");
			sheet.addCell(label1);
			Label label2 = new Label(2, 0, "联系人");
			sheet.addCell(label2);
			Label label3 = new Label(3, 0, "联系电话");
			sheet.addCell(label3);
			Label label4 = new Label(4, 0, "时间");
			sheet.addCell(label4);
			Label label5 = new Label(5, 0, "销售");
			sheet.addCell(label5);
			Label label6 = new Label(6, 0, "资料来源");
			sheet.addCell(label6);

			Label label7 = new Label(7, 0, "资料行业");
			sheet.addCell(label7);

			for (int i = 0; i < list.size(); i++) {
				Label l0 = new Label(0, i + 1, String.valueOf(i + 1));
				sheet.addCell(l0);
				Label l1 = new Label(1, i + 1, list.get(i).getCompanyname());
				sheet.addCell(l1);
				Label l2 = new Label(2, i + 1, list.get(i).getLinkman());
				sheet.addCell(l2);
				Label l3 = new Label(3, i + 1, list.get(i).getPhone());
				sheet.addCell(l3);
				Label l4 = new Label(4, i + 1, list.get(i).getDate());
				sheet.addCell(l4);
				Label l5 = new Label(5, i + 1, list.get(i).getRealname());
				sheet.addCell(l5);
				Label l6 = new Label(6, i + 1, list.get(i).getDatasource());
				sheet.addCell(l6);
				Label l7 = new Label(7, i + 1,getIndustry( list.get(i).getIndustry()));
				sheet.addCell(l7);
			}
			workbook.write();
			workbook.close();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RowsExceededException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (WriteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return e_path;
	}

	public static String getIndustry(String str) {
		String s = "";
		if (str.equals("aqab")) {
			s = "安全安保";
		} else if (str.equals("bgwj")) {
			s = "办公文教";
		} else if (str .equals( "cp")) {
			s = "彩票";
		} else if (str .equals( "cryp")) {
			s = "成人用品";
		} else if (str .equals( "dnyj")) {
			s = "电脑硬件";
		} else if (str .equals( "rjyx")) {
			s = "软件游戏";
		} else if (str .equals( "dzdg")) {
			s = "电子电工";
		} else if (str .equals( "flfw")) {
			s = "法律服务";
		} else if (str .equals( "fdc")) {
			s = "房地产";
		} else if (str .equals( "fzxm")) {
			s = "服装鞋帽";
		} else if (str .equals( "lpsp")) {
			s = "礼品饰品";
		} else if (str .equals( "gbtx")) {
			s = "广播通信";
		} else if (str .equals( "ggjbz")) {
			s = "广告及包装";
		} else if (str .equals( "wlfu")) {
			s = "网络服务";
		} else if (str .equals( "hgjcl")) {
			s = "化工及材料";
		} else if (str .equals( "jxsb")) {
			s = "机械设备";
		} else if (str .equals( "jzjzx")) {
			s = "建筑及装修";
		} else if (str .equals( "jtys")) {
			s = "交通运输";
		} else if (str .equals( "jypx")) {
			s = "教育培训";
		} else if (str .equals( "jnhb")) {
			s = "节能环保";
		} else if (str .equals( "jrfw")) {
			s = "金融服务";
		} else if (str .equals( "lsdx")) {
			s = "铃声短信";
		} else if (str .equals( "lyjpw")) {
			s = "旅游及票务";
		} else if (str .equals( "nlmy")) {
			s = "农林牧渔";
		} else if (str .equals( "swfw")) {
			s = "商务服务";
		} else if (str .equals( "shfw")) {
			s = "生活服务";
		} else if (str .equals( "spcy")) {
			s = "食品餐饮";
		} else if (str .equals( "xxyl")) {
			s = "休闲娱乐";
		} else if (str .equals( "jydq")) {
			s = "家用电器";
		} else if (str .equals( "tsyx")) {
			s = "图书音像";
		} else if (str .equals( "yljk")) {
			s = "医疗健康";
		} else if (str .equals( "zsjm")) {
			s = "招商加盟";
		} else if (str .equals( "hzp")) {
			s = "化妆品";
		} else if (str .equals( "yyyp")) {
			s = "孕婴用品";
		} else if (str .equals( "qt")) {
			s = "其他";
		}
		return s;
	}
	
}
