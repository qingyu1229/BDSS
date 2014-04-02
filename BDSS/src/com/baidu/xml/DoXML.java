package com.baidu.xml;

import java.util.HashMap;
import java.util.Map;

import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import com.baidu.xml.XmlOper;
import com.baidu.xml.XMLBuilder;
import com.baidu.xml.XmlCreater;

public class DoXML {

	private String path;
	private String rootTagName;

	public DoXML(String path, String rootTagName) {
		this.path = path;
		this.rootTagName = rootTagName;
	}

	public void writeXML(HashMap<String, Object> map) {
		XmlCreater xc = new XmlCreater(path);
		Element root = xc.createRootElement(rootTagName);
		for (Map.Entry<String, Object> en : map.entrySet()) {
			en.getKey();
			xc.createElement(root, en.getKey(), en.getValue().toString());
		}
		xc.buildXmlFile();
	}
	public HashMap<String,String> readXML(){
		HashMap<String,String> hm=new HashMap<String, String>();
		XMLBuilder xb=new XMLBuilder(path);
		Element root= xb.getRoot();
		NodeList nodeList= XmlOper.getNodeList(root);
		for(int i=0;i<nodeList.getLength();i++){
			String nodeName=nodeList.item(i).getNodeName();
			String nodeValue=nodeList.item(i).getTextContent();
			hm.put(nodeName, nodeValue);
		}
		return hm;
	}
}
