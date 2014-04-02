package com.baidu.xml;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
public class XmlOper {

	    private XmlOper()
	    {        
	    }
	     
	    /**
	    * �������ƣ�getNodeList<p>
	    * �������ܣ���ȡ�����parent�������ӽ��<p>
	    * ����˵����@param parent
	    * ����˵����@return <p>
	    * ���أ�NodeList <p>
	    * ���ߣ�luoc
	    * ���ڣ�2005-6-22
	    **/
	    public static NodeList getNodeList(Element parent)
	    {
	        return parent.getChildNodes();
	    }
	     
	    /**
	    * �������ƣ�getElementsByName<p>
	    * �������ܣ��ڸ�����в�ѯָ�����ƵĽ�㼯            <p>
	    * ����˵����@param parent
	    * ����˵����@param name
	    * ����˵����@return <p>
	    * ���أ�Element[] <p>
	    * ���ߣ�luoc
	    * ���ڣ�2005-6-22
	    **/
	    public static Element [] getElementsByName(Element parent,String name)
	    {
	        ArrayList resList=new ArrayList();
	        NodeList nl=getNodeList(parent);
	        for(int i=0;i<nl.getLength();i++)
	        {
	            Node nd=nl.item(i);
	            if(nd.getNodeName().equals(name))
	            {
	                resList.add(nd);
	            }
	        }
	        Element [] res=new Element [resList.size()];
	        for(int i=0;i<resList.size();i++)
	        {
	            res[0]=(Element)resList.get(i);
	        }        
	        logger.debug(parent.getNodeName()+"'s children of "+name+
	                "'s num:"+res.length);
	        return res;
	    }
	     
	    /**
	    * �������ƣ�getElementName<p>
	    * �������ܣ���ȡָ��Element������<p>
	    * ����˵����@param element
	    * ����˵����@return <p>
	    * ���أ�String <p>
	    * ���ߣ�luoc
	    * ���ڣ�2005-6-22
	    **/
	    public static String getElementName(Element element)
	    {
	        return element.getNodeName();
	    }
	     
	    /**
	    * �������ƣ�getElementValue<p>
	    * �������ܣ���ȡָ��Element��ֵ<p>
	    * ����˵����@param element
	    * ����˵����@return <p>
	    * ���أ�String <p>
	    * ���ߣ�luoc
	    * ���ڣ�2005-6-22
	    **/
	    public static String getElementValue(Element element)
	    {
	        NodeList nl=element.getChildNodes();
	        for(int i=0;i<nl.getLength();i++)
	        {
	            if(nl.item(i).getNodeType()==Node.TEXT_NODE)//��һ��Text Node
	            {            
	                logger.debug(element.getNodeName()+" has a Text Node.");
	                return element.getFirstChild().getNodeValue();
	            }
	        }   
	        logger.error(element.getNodeName()+" hasn't a Text Node.");
	        return null;
	    }
	     
	    /**
	    * �������ƣ�getElementAttr<p>
	    * �������ܣ���ȡָ��Element������attr��ֵ            <p>
	    * ����˵����@param element
	    * ����˵����@param attr
	    * ����˵����@return <p>
	    * ���أ�String <p>
	    * ���ߣ�luoc
	    * ���ڣ�2005-6-22
	    **/
	    public static String getElementAttr(Element element,String attr)
	    {
	        return element.getAttribute(attr);
	    }
	     
	    /**
	    * �������ƣ�setElementValue<p>
	    * �������ܣ�����ָ��Element��ֵ            <p>
	    * ����˵����@param element
	    * ����˵����@param val <p>
	    * ���أ�void <p>
	    * ���ߣ�luoc
	    * ���ڣ�2005-6-22
	    **/
	    public static void setElementValue(Element element,String val)
	    {
	        Node node=element.getOwnerDocument().createTextNode(val);
	        NodeList nl=element.getChildNodes();
	        for(int i=0;i<nl.getLength();i++)
	        {
	            Node nd=nl.item(i);
	            if(nd.getNodeType()==Node.TEXT_NODE)//��һ��Text Node
	            {            
	                  nd.setNodeValue(val);
	                  logger.debug("modify "+element.getNodeName()+"'s node value succe.");
	                  return;
	            }
	        }   
	        logger.debug("new "+element.getNodeName()+"'s node value succe.");
	        element.appendChild(node);        
	    }
	     
	    /**
	    * �������ƣ�setElementAttr<p>
	    * �������ܣ����ý��Element������<p>
	    * ����˵����@param element
	    * ����˵����@param attr
	    * ����˵����@param attrVal <p>
	    * ���أ�void <p>
	    * ���ߣ�luoc
	    * ���ڣ�2005-6-22
	    **/
	    public static void setElementAttr(Element element,
	            String attr,String attrVal)
	    {
	        element.setAttribute(attr,attrVal);
	    }
	     
	     
	    /**
	    * �������ƣ�addElement<p>
	    * �������ܣ���parent�����ӽ��child<p>
	    * ����˵����@param parent
	    * ����˵����@param child <p>
	    * ���أ�void <p>
	    * ���ߣ�luoc
	    * ���ڣ�2005-6-22
	    **/
	    public static void addElement(Element parent,Element child)
	    {
	        parent.appendChild(child);
	    }
	     
	    /**
	    * �������ƣ�addElement<p>
	    * �������ܣ���parent�������ַ���tagName���ɵĽ��<p>
	    * ����˵����@param parent
	    * ����˵����@param tagName <p>
	    * ���أ�void <p>
	    * ���ߣ�luoc
	    * ���ڣ�2005-6-22
	    **/
	    public static void addElement(Element parent,String tagName)
	    {        
	        Document doc=parent.getOwnerDocument();
	        Element child=doc.createElement(tagName);
	        parent.appendChild(child);
	    }
	     
	    /**
	    * �������ƣ�addElement<p>
	    * �������ܣ���parent������tagName��Text��㣬��ֵΪtext<p>
	    * ����˵����@param parent
	    * ����˵����@param tagName
	    * ����˵����@param text <p>
	    * ���أ�void <p>
	    * ���ߣ�luoc
	    * ���ڣ�2005-6-22
	    **/
	    public static void addElement(Element parent,String tagName,String text)
	    {
	        Document doc=parent.getOwnerDocument();
	        Element child=doc.createElement(tagName);
	        setElementValue(child,text);
	        parent.appendChild(child);
	    }
	     
	    /**
	    * �������ƣ�removeElement<p>
	    * �������ܣ��������parent�µ�����ΪtagName�Ľ���Ƴ�<p>
	    * ����˵����@param parent
	    * ����˵����@param tagName <p>
	    * ���أ�void <p>
	    * ���ߣ�luoc
	    * ���ڣ�2005-6-22
	    **/
	    public static void removeElement(Element parent,String tagName)
	    {
	        logger.debug("remove "+parent.getNodeName()+"'s children by tagName "+tagName+" begin...");
	        NodeList nl=parent.getChildNodes();
	        for(int i=0;i<nl.getLength();i++)
	        {
	            Node nd=nl.item(i);
	            if(nd.getNodeName().equals(tagName))
	            {
	                parent.removeChild(nd);
	                logger.debug("remove child '"+nd+"' success.");
	            }
	        }
	        logger.debug("remove "+parent.getNodeName()+"'s children by tagName "+tagName+" end.");
	    }
	     
	     
	    /*ȫ�ֱ���*/   
	    static Logger logger=Logger.getLogger("XmlOper");
	
}
