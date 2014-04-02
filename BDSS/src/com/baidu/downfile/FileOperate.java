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

			WritableSheet sheet = workbook.createSheet("������һ", 0);
			Label label0 = new Label(0, 0, "���");
			sheet.addCell(label0);
			Label label1 = new Label(1, 0, "��˾����");
			sheet.addCell(label1);
			Label label2 = new Label(2, 0, "��ϵ��");
			sheet.addCell(label2);
			Label label3 = new Label(3, 0, "��ϵ�绰");
			sheet.addCell(label3);
			Label label4 = new Label(4, 0, "ʱ��");
			sheet.addCell(label4);
			Label label5 = new Label(5, 0, "����");
			sheet.addCell(label5);
			Label label6 = new Label(6, 0, "������Դ");
			sheet.addCell(label6);

			Label label7 = new Label(7, 0, "������ҵ");
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
			s = "��ȫ����";
		} else if (str.equals("bgwj")) {
			s = "�칫�Ľ�";
		} else if (str .equals( "cp")) {
			s = "��Ʊ";
		} else if (str .equals( "cryp")) {
			s = "������Ʒ";
		} else if (str .equals( "dnyj")) {
			s = "����Ӳ��";
		} else if (str .equals( "rjyx")) {
			s = "�����Ϸ";
		} else if (str .equals( "dzdg")) {
			s = "���ӵ繤";
		} else if (str .equals( "flfw")) {
			s = "���ɷ���";
		} else if (str .equals( "fdc")) {
			s = "���ز�";
		} else if (str .equals( "fzxm")) {
			s = "��װЬñ";
		} else if (str .equals( "lpsp")) {
			s = "��Ʒ��Ʒ";
		} else if (str .equals( "gbtx")) {
			s = "�㲥ͨ��";
		} else if (str .equals( "ggjbz")) {
			s = "��漰��װ";
		} else if (str .equals( "wlfu")) {
			s = "�������";
		} else if (str .equals( "hgjcl")) {
			s = "����������";
		} else if (str .equals( "jxsb")) {
			s = "��е�豸";
		} else if (str .equals( "jzjzx")) {
			s = "������װ��";
		} else if (str .equals( "jtys")) {
			s = "��ͨ����";
		} else if (str .equals( "jypx")) {
			s = "������ѵ";
		} else if (str .equals( "jnhb")) {
			s = "���ܻ���";
		} else if (str .equals( "jrfw")) {
			s = "���ڷ���";
		} else if (str .equals( "lsdx")) {
			s = "��������";
		} else if (str .equals( "lyjpw")) {
			s = "���μ�Ʊ��";
		} else if (str .equals( "nlmy")) {
			s = "ũ������";
		} else if (str .equals( "swfw")) {
			s = "�������";
		} else if (str .equals( "shfw")) {
			s = "�������";
		} else if (str .equals( "spcy")) {
			s = "ʳƷ����";
		} else if (str .equals( "xxyl")) {
			s = "��������";
		} else if (str .equals( "jydq")) {
			s = "���õ���";
		} else if (str .equals( "tsyx")) {
			s = "ͼ������";
		} else if (str .equals( "yljk")) {
			s = "ҽ�ƽ���";
		} else if (str .equals( "zsjm")) {
			s = "���̼���";
		} else if (str .equals( "hzp")) {
			s = "��ױƷ";
		} else if (str .equals( "yyyp")) {
			s = "��Ӥ��Ʒ";
		} else if (str .equals( "qt")) {
			s = "����";
		}
		return s;
	}
	
}
