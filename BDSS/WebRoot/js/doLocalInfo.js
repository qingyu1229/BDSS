function doTown(town) {
	var s;
	
	if (town =="gcjd") {
		s = "ݸ�ǽֵ�";
	} else if (town == "ncjd") {
		s = "�ϳǽֵ�";
	} else if (town == "dcjd") {
		s = "���ǽֵ�";
	} else if (town == "wjjd") {
		s = "�򽭽ֵ�";
	} else if (town == "sjz") {
		s = "ʯ����";
	} else if (town == "slz") {
		s = "ʯ����";
	} else if (town == "csz") {
		s = "��ɽ��";
	} else if (town == "spz") {
		s = "ʯ����";
	} else if (town == "qsz") {
		s = "��ʯ��";
	} else if (town == "hlz") {
		s = "������";
	} else if (town == "qtz") {
		s = "��ͷ��";
	} else if (town == "xgz") {
		s = "л����";
	} else if (town == "dkz") {
		s = "������";
	} else if (town == "cpz") {
		s = "��ƽ��";
	} else if (town == "lbz") {
		s = "弲���";
	} else if (town == "dlz") {
		s = "������";
	} else if (town == "hjz") {
		s = "�ƽ���";
	} else if (town == "qxz") {
		s = "��Ϫ��";
	} else if (town == "txz") {
		s = "������";
	} else if (town == "fgz") {
		s = "�����";
	} else if (town == "caz") {
		s = "������";
	} else if (town == "humz") {
		s = "������";
	} else if (town == "hjz") {
		s = "�����";
	} else if (town == "stz") {
		s = "ɳ����";
	} else if (town == "djz") {
		s = "������";
	} else if (town == "hmz") {
		s = "��÷��";
	} else if (town == "myz") {
		s = "��ӿ��";
	} else if (town == "ztz") {
		s = "������";
	} else if (town == "gbz") {
		s = "�߈���";
	} else if (town == "zmtz") {
		s = "��ľͷ��";
	} else if (town == "dlsz") {
		s = "����ɽ��";
	} else if (town == "wndz") {
		s = "��ţ����";
	} else if (town == "qt") {
		s = "����";
	}

	else if (town == "szlhq") {
		s = "�޺���";
	} else if (town == "szftq") {
		s = "������";
	} else if (town == "sznsq") {
		s = "��ɽ��";
	} else if (town == "szbaq") {
		s = "������";
	} else if (town == "szlgq") {
		s = "������";
	} else if (town == "szytq") {
		s = "������";
	} else if (town == "szqt") {
		s = "����";
	}
	else if (town == "gzyxq") {
		s = "Խ����";
	} else if (town == "gzlwq") {
		s = "������";
	} else if (town == "gzhzq") {
		s = "������";
	} else if (town == "gzthq") {
		s = "�����";
	} else if (town == "gzbyq") {
		s = "������";
	} else if (town == "gzhpq") {
		s = "������";
	} else if (town == "gzhdq") {
		s = "������";
	} else if (town == "gzpyq") {
		s = "��خ��";
	} else if (town == "gzlgq") {
		s = "�ܸ���";
	} else if (town == "gznsq") {
		s = "��ɳ��";
	} else if (town == "gzchs") {
		s = "�ӻ���";
	} else if (town == "gzzcs") {
		s = "������";
	} else if (town == "gzqt") {
		s = "����";
	}else{
		s="δ֪";
	}
	return s;
}

function getcity(town){
	var s="";
    var s_town=	town.substring(0,2);
	if(s_town=="sz"){
		s="������";
	}else if(s_town=="gz"){
		s="������";
	}else{
		s="��ݸ��";
	}
	return s;
}


function doIndustry(industry) {
	var s;

	if (industry == "aqab") {
		s = "��ȫ����";
	} else if (industry == "bgwj") {
		s = "�칫�Ľ�";
	} else if (industry == "cp") {
		s = "��Ʊ";
	} else if (industry == "cryp") {
		s = "������Ʒ";
	} else if (industry == "dnyj") {
		s = "����Ӳ��";
	} else if (industry == "rjyx") {
		s = "�����Ϸ";
	} else if (industry == "dzdg") {
		s = "���ӵ繤";
	} else if (industry == "flfw") {
		s = "���ɷ���";
	} else if (industry == "fdc") {
		s = "���ز�";
	} else if (industry == "fzxm") {
		s = "��װЬñ";
	} else if (industry == "lpsp") {
		s = "��Ʒ��Ʒ";
	} else if (industry == "gbtx") {
		s = "�㲥ͨ��";
	} else if (industry == "ggjbz") {
		s = "��漰��װ";
	} else if (industry == "wlfu") {
		s = "�������";
	} else if (industry == "hgjcl") {
		s = "����������";
	} else if (industry == "jxsb") {
		s = "��е�豸";
	} else if (industry == "jzjzx") {
		s = "������װ��";
	} else if (industry == "jtys") {
		s = "��ͨ����";
	} else if (industry == "jypx") {
		s = "������ѵ";
	} else if (industry == "jnhb") {
		s = "���ܻ���";
	} else if (industry == "jrfw") {
		s = "���ڷ���";
	} else if (industry == "lsdx") {
		s = "��������";
	} else if (industry == "lyjpw") {
		s = "���μ�Ʊ��";
	} else if (industry == "nlmy") {
		s = "ũ������";
	} else if (industry == "swfw") {
		s = "�������";
	} else if (industry == "shfw") {
		s = "�������";
	} else if (industry == "spcy") {
		s = "ʳƷ����";
	} else if (industry == "xxyl") {
		s = "��������";
	} else if (industry == "jydq") {
		s = "���õ���";
	} else if (industry == "tsyx") {
		s = "ͼ������";
	} else if (industry == "yljk") {
		s = "ҽ�ƽ���";
	} else if (industry == "zsjm") {
		s = "���̼���";
	} else if (industry == "hzp") {
		s = "��ױƷ";
	} else if (industry == "yyyp") {
		s = "��Ӥ��Ʒ";
	} else if (industry == "qt") {
		s = "����";
	}else{
		s="δ֪";
	}
	return s;

}

function openMap(city,keyword){
	var url="files/BaiduMap.jsp?city="+city+"&keyword="+keyword;
	window.open(url,'newwindow','height=500,width=611,scrollbars=yes,status =yes');
}

