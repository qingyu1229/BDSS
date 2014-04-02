package com.baidu.utils;

import java.util.HashMap;
import java.util.Map;

public class DoInfoUtil {
	
	public static String doIndutry(String industry){
		String zn_industry="";
		
		Map<String ,String> map=new HashMap<String,String>();
		
		map.put("安全安保", "aqab");
		map.put("办公文教", "bgwj");
		map.put("彩票", "cp");
		map.put("成人用品", "cryp");
		map.put("软件游戏", "rjyx");
		map.put("电子电工", "dzdg");
		map.put("法律服务", "flfw");
		map.put("房地产", "fdc");
		map.put("服装鞋帽", "fzxm");
		map.put("礼品饰品", "lpsp");
		map.put("广播通信", "gbtx");
		map.put("广告及包装", "ggjbz");
		map.put("网络服务", "wlfu");
		map.put("化工及材料", "hgjcl");
		map.put("机械设备", "jxsb");
		map.put("交通运输", "jtys");
		map.put("教育培训", "jypx");
		map.put("节能环保", "jnhb");
		map.put("金融服务", "jrfw");
		map.put("铃声短信", "lsdx");
		map.put("旅游及票务", "lyjpw");
		map.put("商务服务", "swfw");
		map.put("生活服务", "shfw");
		map.put("食品餐饮", "spcy");
		map.put("休闲娱乐", "xxyl");
		map.put("家用电器", "jydq");
		map.put("医疗健康", "yljk");
		map.put("招商加盟", "zsjm");
		map.put("化妆品", "hzp");
		map.put("孕婴用品", "yyyp");
		map.put("其他", "qt");
		
		zn_industry=map.get(industry);
		//System.out.println(zn_industry);
		return zn_industry;
		
	}
	
	public static String doTown(String town){
		String zn_town="";
		Map<String,String> map=new HashMap<String,String>();
		map.put("莞城街道", "gcjd");
		map.put("南城街道", "ncjd");
		map.put("东城街道", "dcjd");
		map.put("万江街道", "wjjd");
		map.put("石碣镇", "sjz");
		map.put("石龙镇", "slz");
		map.put("茶山镇", "csz");
		map.put("石排镇", "spz");
		map.put("企石镇", "qsz");
		map.put("横沥镇", "hlz");
		map.put("桥头镇", "qtz");
		map.put("谢岗镇", "xgz");
		map.put("东坑镇", "dkz");
		map.put("常平镇", "cpz");
		map.put("寮步镇", "lbz");
		map.put("大朗镇", "dlz");
		map.put("黄江镇", "hjz");
		map.put("清溪镇", "qxz");
		map.put("塘厦镇", "txz");
		map.put("凤岗镇", "fgz");
		map.put("长安镇", "caz");
		map.put("虎门镇", "humz");
		map.put("厚街镇", "hjz");
		map.put("沙田镇", "stz");
		map.put("道滘镇", "djz");
		map.put("洪梅镇", "hmz");
		map.put("麻涌镇", "myz");
		map.put("中堂镇", "ztz");
		map.put("高埗镇", "gbz");
		map.put("樟木头镇", "zmtz");
		map.put("大岭山镇", "dlsz");
		map.put("望牛墩镇", "wndz");
		map.put("其他", "qt");
		map.put("罗湖区", "szlhq");
		map.put("福田区", "szftq");
		map.put("南山区", "sznsq");
		map.put("宝安区", "szbaq");
		map.put("盐田区", "szlgq");
		map.put("其他", "szqt");
		map.put("越秀区", "gzyxq");
		map.put("荔湾区", "gzlwq");
		map.put("海珠区", "gzhzq");
		map.put("天河区", "gzthq");
		map.put("白云区", "gzbyq");
		map.put("黄浦区", "gzhpq");
		map.put("花都区", "gzhdq");
		map.put("番禺区", "gzpyq");
		map.put("萝岗区", "gzlgq");
		map.put("南沙区", "gznsq");
		map.put("从化市", "gzchs");
		map.put("增城市", "gzzcs");
		map.put("其他", "gzqt");
		zn_town= map.get(town);
		
		
		return zn_town;
	}
	
}
