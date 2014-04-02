function doTown(town) {
	var s;
	
	if (town =="gcjd") {
		s = "莞城街道";
	} else if (town == "ncjd") {
		s = "南城街道";
	} else if (town == "dcjd") {
		s = "东城街道";
	} else if (town == "wjjd") {
		s = "万江街道";
	} else if (town == "sjz") {
		s = "石碣镇";
	} else if (town == "slz") {
		s = "石龙镇";
	} else if (town == "csz") {
		s = "茶山镇";
	} else if (town == "spz") {
		s = "石排镇";
	} else if (town == "qsz") {
		s = "企石镇";
	} else if (town == "hlz") {
		s = "横沥镇";
	} else if (town == "qtz") {
		s = "桥头镇";
	} else if (town == "xgz") {
		s = "谢岗镇";
	} else if (town == "dkz") {
		s = "东坑镇";
	} else if (town == "cpz") {
		s = "常平镇";
	} else if (town == "lbz") {
		s = "寮步镇";
	} else if (town == "dlz") {
		s = "大朗镇";
	} else if (town == "hjz") {
		s = "黄江镇";
	} else if (town == "qxz") {
		s = "清溪镇";
	} else if (town == "txz") {
		s = "塘厦镇";
	} else if (town == "fgz") {
		s = "凤岗镇";
	} else if (town == "caz") {
		s = "长安镇";
	} else if (town == "humz") {
		s = "虎门镇";
	} else if (town == "hjz") {
		s = "厚街镇";
	} else if (town == "stz") {
		s = "沙田镇";
	} else if (town == "djz") {
		s = "道滘镇";
	} else if (town == "hmz") {
		s = "洪梅镇";
	} else if (town == "myz") {
		s = "麻涌镇";
	} else if (town == "ztz") {
		s = "中堂镇";
	} else if (town == "gbz") {
		s = "高埗镇";
	} else if (town == "zmtz") {
		s = "樟木头镇";
	} else if (town == "dlsz") {
		s = "大岭山镇";
	} else if (town == "wndz") {
		s = "望牛墩镇";
	} else if (town == "qt") {
		s = "其他";
	}

	else if (town == "szlhq") {
		s = "罗湖区";
	} else if (town == "szftq") {
		s = "福田区";
	} else if (town == "sznsq") {
		s = "南山区";
	} else if (town == "szbaq") {
		s = "宝安区";
	} else if (town == "szlgq") {
		s = "龙岗区";
	} else if (town == "szytq") {
		s = "盐田区";
	} else if (town == "szqt") {
		s = "其他";
	}
	else if (town == "gzyxq") {
		s = "越秀区";
	} else if (town == "gzlwq") {
		s = "荔湾区";
	} else if (town == "gzhzq") {
		s = "海珠区";
	} else if (town == "gzthq") {
		s = "天河区";
	} else if (town == "gzbyq") {
		s = "白云区";
	} else if (town == "gzhpq") {
		s = "黄浦区";
	} else if (town == "gzhdq") {
		s = "花都区";
	} else if (town == "gzpyq") {
		s = "番禺区";
	} else if (town == "gzlgq") {
		s = "萝岗区";
	} else if (town == "gznsq") {
		s = "南沙区";
	} else if (town == "gzchs") {
		s = "从化市";
	} else if (town == "gzzcs") {
		s = "增城市";
	} else if (town == "gzqt") {
		s = "其他";
	}else{
		s="未知";
	}
	return s;
}

function getcity(town){
	var s="";
    var s_town=	town.substring(0,2);
	if(s_town=="sz"){
		s="深圳市";
	}else if(s_town=="gz"){
		s="广州市";
	}else{
		s="东莞市";
	}
	return s;
}


function doIndustry(industry) {
	var s;

	if (industry == "aqab") {
		s = "安全安保";
	} else if (industry == "bgwj") {
		s = "办公文教";
	} else if (industry == "cp") {
		s = "彩票";
	} else if (industry == "cryp") {
		s = "成人用品";
	} else if (industry == "dnyj") {
		s = "电脑硬件";
	} else if (industry == "rjyx") {
		s = "软件游戏";
	} else if (industry == "dzdg") {
		s = "电子电工";
	} else if (industry == "flfw") {
		s = "法律服务";
	} else if (industry == "fdc") {
		s = "房地产";
	} else if (industry == "fzxm") {
		s = "服装鞋帽";
	} else if (industry == "lpsp") {
		s = "礼品饰品";
	} else if (industry == "gbtx") {
		s = "广播通信";
	} else if (industry == "ggjbz") {
		s = "广告及包装";
	} else if (industry == "wlfu") {
		s = "网络服务";
	} else if (industry == "hgjcl") {
		s = "化工及材料";
	} else if (industry == "jxsb") {
		s = "机械设备";
	} else if (industry == "jzjzx") {
		s = "建筑及装修";
	} else if (industry == "jtys") {
		s = "交通运输";
	} else if (industry == "jypx") {
		s = "教育培训";
	} else if (industry == "jnhb") {
		s = "节能环保";
	} else if (industry == "jrfw") {
		s = "金融服务";
	} else if (industry == "lsdx") {
		s = "铃声短信";
	} else if (industry == "lyjpw") {
		s = "旅游及票务";
	} else if (industry == "nlmy") {
		s = "农林牧渔";
	} else if (industry == "swfw") {
		s = "商务服务";
	} else if (industry == "shfw") {
		s = "生活服务";
	} else if (industry == "spcy") {
		s = "食品餐饮";
	} else if (industry == "xxyl") {
		s = "休闲娱乐";
	} else if (industry == "jydq") {
		s = "家用电器";
	} else if (industry == "tsyx") {
		s = "图书音像";
	} else if (industry == "yljk") {
		s = "医疗健康";
	} else if (industry == "zsjm") {
		s = "招商加盟";
	} else if (industry == "hzp") {
		s = "化妆品";
	} else if (industry == "yyyp") {
		s = "孕婴用品";
	} else if (industry == "qt") {
		s = "其他";
	}else{
		s="未知";
	}
	return s;

}

function openMap(city,keyword){
	var url="files/BaiduMap.jsp?city="+city+"&keyword="+keyword;
	window.open(url,'newwindow','height=500,width=611,scrollbars=yes,status =yes');
}

