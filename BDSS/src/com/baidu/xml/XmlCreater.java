package com.baidu.xml;
import java.io.File;
 
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
 
import org.apache.log4j.Logger;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
 
/**
 * 类名：XmlCreater  <p>
 * 类描述： 创建DOM并生成XML文件<p>
 * 编写者 ：luoc<p>
 * 编写日期 ：2005-6-22<p>
 * 主要public成员变量：<p>
 * 主要public方法：   <p>
 **/
 
public class XmlCreater
{
	  /*全局变量*/
    private Logger logger = Logger.getLogger(getClass().getName());
    private Document doc=null;//新创建的DOM
    private String path=null;//生成的XML文件绝对路径

    /**
     *构造函数说明：       <p>
     *参数说明：@param path  xml文件路径 <p>
    **/
    public XmlCreater(String path)
    {
        this.path=path;
        init();
    }
     
    /**
    * 方法名称：init<p>
    * 方法功能： 初始化函数           <p>
    * 参数说明： <p>
    * 返回：void <p>
    * 作者：luoc
    * 日期：2005-6-22
    **/
    private void init()
    {
        DocumentBuilderFactory factory=DocumentBuilderFactory.newInstance();
        try
        {
            DocumentBuilder builder=factory.newDocumentBuilder();
            doc=builder.newDocument();//新建DOM
        }catch(ParserConfigurationException e)
        {
            logger.error("Parse DOM builder error:"+e);
        }
    }
     
    /**
    * 方法名称：createRootElement<p>
    * 方法功能：创建根结点，并返回            <p>
    * 参数说明：@param rootTagName <p>
    * 返回：Element <p>
    * 作者：luoc
    * 日期：2005-6-22
    **/
    public Element createRootElement(String rootTagName)
    {     
        if(doc.getDocumentElement()==null)
        {
            logger.debug("create root element '"+rootTagName+"' success.");
            Element root=doc.createElement(rootTagName);
            doc.appendChild(root);
            return root;
        }
        logger.warn("this dom's root element is exist,create fail.");
        return doc.getDocumentElement();
    }
     
    /**
    * 方法名称：createElement<p>
    * 方法功能：在parent结点下增加子结点tagName<p>
    * 参数说明：@param parent
    * 参数说明：@param tagName <p>
    * 返回：Element <p>
    * 作者：luoc
    * 日期：2005-6-22
    **/
    public Element createElement(Element parent,String tagName)
    {
        Document doc=parent.getOwnerDocument();
        Element child=doc.createElement(tagName);
        parent.appendChild(child);        
        return child;
    }
     
    /**
    * 方法名称：createElement<p>
    * 方法功能：在parent结点下增加值为value的子结点tabName<p>
    * 参数说明：@param parent
    * 参数说明：@param tagName
    * 参数说明：@param value <p>
    * 返回：Element <p>
    * 作者：luoc
    * 日期：2005-6-22
    **/
    public Element createElement(Element parent,String tagName,String value)
    {
        Document doc=parent.getOwnerDocument();
        Element child=doc.createElement(tagName);
        XmlOper.setElementValue(child,value);
        parent.appendChild(child);
        return child;
    }
     
    /**
    * 方法名称：createAttribute<p>
    * 方法功能：在parent结点下增加属性 <p>
    * 参数说明：@param parent
    * 参数说明：@param attrName 属性名
    * 参数说明：@param attrValue 属性值<p>
    * 返回：void <p>
    * 作者：luoc
    * 日期：2005-6-22
    **/
    public void createAttribute(Element parent,String attrName,String attrValue)
    {
        XmlOper.setElementAttr(parent,attrName,attrValue);        
    }
     
    /**
    * 方法名称：buildXmlFile<p>
    * 方法功能：根据DOM生成XML文件<p>
    * 参数说明： <p>
    * 返回：void <p>
    * 作者：luoc
    * 日期：2005-6-22
    **/
    public void buildXmlFile()
    {
        TransformerFactory tfactory=TransformerFactory.newInstance();
        try
        {
            Transformer transformer=tfactory.newTransformer();
            DOMSource source=new DOMSource(doc);
            logger.debug("New DOMSource success.");
            StreamResult result=new StreamResult(new File(path));
            logger.debug("New StreamResult success.");
            transformer.setOutputProperty("encoding","GBK");
            transformer.transform(source,result);
            logger.debug("Build XML File '"+path+"' success.");
        }catch(TransformerConfigurationException e)
        {
            logger.error("Create Transformer error:"+e);
        }catch(TransformerException e)
        {
            logger.error("Transformer XML file error:"+e);
        }
    }
     
    /**
     * @return 返回 doc。
     */
    public Document getDoc()
    {
        return doc;
    }
    /**
     * @param doc 要设置的 doc。
     */
    public void setDoc(Document doc)
    {
        this.doc = doc;
    }
    /**
     * @return 返回 path。
     */
    public String getPath()
    {
        return path;
    }
    /**
     * @param path 要设置的 path。
     */
    public void setPath(String path)
    {
        this.path = path;
    }
  
}