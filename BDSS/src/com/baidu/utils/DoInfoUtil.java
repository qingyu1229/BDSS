package com.baidu.utils;

import java.util.HashMap;
import java.util.Map;

public class DoInfoUtil {
	
	public static String doIndutry(String industry){
		String zn_industry="";
		
		Map<String ,String> map=new HashMap<String,String>();
		
		map.put("��ȫ����", "aqab");
		map.put("�칫�Ľ�", "bgwj");
		map.put("��Ʊ", "cp");
		map.put("������Ʒ", "cryp");
		map.put("�����Ϸ", "rjyx");
		map.put("���ӵ繤", "dzdg");
		map.put("���ɷ���", "flfw");
		map.put("���ز�", "fdc");
		map.put("��װЬñ", "fzxm");
		map.put("��Ʒ��Ʒ", "lpsp");
		map.put("�㲥ͨ��", "gbtx");
		map.put("��漰��װ", "ggjbz");
		map.put("�������", "wlfu");
		map.put("����������", "hgjcl");
		map.put("��е�豸", "jxsb");
		map.put("��ͨ����", "jtys");
		map.put("������ѵ", "jypx");
		map.put("���ܻ���", "jnhb");
		map.put("���ڷ���", "jrfw");
		map.put("��������", "lsdx");
		map.put("���μ�Ʊ��", "lyjpw");
		map.put("�������", "swfw");
		map.put("�������", "shfw");
		map.put("ʳƷ����", "spcy");
		map.put("��������", "xxyl");
		map.put("���õ���", "jydq");
		map.put("ҽ�ƽ���", "yljk");
		map.put("���̼���", "zsjm");
		map.put("��ױƷ", "hzp");
		map.put("��Ӥ��Ʒ", "yyyp");
		map.put("����", "qt");
		
		zn_industry=map.get(industry);
		//System.out.println(zn_industry);
		return zn_industry;
		
	}
	
	public static String doTown(String town){
		String zn_town="";
		Map<String,String> map=new HashMap<String,String>();
		map.put("ݸ�ǽֵ�", "gcjd");
		map.put("�ϳǽֵ�", "ncjd");
		map.put("���ǽֵ�", "dcjd");
		map.put("�򽭽ֵ�", "wjjd");
		map.put("ʯ����", "sjz");
		map.put("ʯ����", "slz");
		map.put("��ɽ��", "csz");
		map.put("ʯ����", "spz");
		map.put("��ʯ��", "qsz");
		map.put("������", "hlz");
		map.put("��ͷ��", "qtz");
		map.put("л����", "xgz");
		map.put("������", "dkz");
		map.put("��ƽ��", "cpz");
		map.put("弲���", "lbz");
		map.put("������", "dlz");
		map.put("�ƽ���", "hjz");
		map.put("��Ϫ��", "qxz");
		map.put("������", "txz");
		map.put("�����", "fgz");
		map.put("������", "caz");
		map.put("������", "humz");
		map.put("�����", "hjz");
		map.put("ɳ����", "stz");
		map.put("������", "djz");
		map.put("��÷��", "hmz");
		map.put("��ӿ��", "myz");
		map.put("������", "ztz");
		map.put("�߈���", "gbz");
		map.put("��ľͷ��", "zmtz");
		map.put("����ɽ��", "dlsz");
		map.put("��ţ����", "wndz");
		map.put("����", "qt");
		map.put("�޺���", "szlhq");
		map.put("������", "szftq");
		map.put("��ɽ��", "sznsq");
		map.put("������", "szbaq");
		map.put("������", "szlgq");
		map.put("����", "szqt");
		map.put("Խ����", "gzyxq");
		map.put("������", "gzlwq");
		map.put("������", "gzhzq");
		map.put("�����", "gzthq");
		map.put("������", "gzbyq");
		map.put("������", "gzhpq");
		map.put("������", "gzhdq");
		map.put("��خ��", "gzpyq");
		map.put("�ܸ���", "gzlgq");
		map.put("��ɳ��", "gznsq");
		map.put("�ӻ���", "gzchs");
		map.put("������", "gzzcs");
		map.put("����", "gzqt");
		zn_town= map.get(town);
		
		
		return zn_town;
	}
	
}
