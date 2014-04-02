package com.baidu.xml;

import java.io.File;
import java.io.IOException;
 
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
 
import org.apache.log4j.Logger;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;
 
/**
 * 类名：XmlBuilder  <p>
 * 类描述：根据传入的XML文件生成Document和root结点 <p>
 * 编写者 ：luoc<p>
 * 编写日期 ：2005-6-22<p>
 * 主要public成员变量：<p>
 * 主要public方法：   <p>
 **/
 
public class XMLBuilder
{
    /**
     *构造函数说明：       <p>
     *参数说明：@param path   <p>
    **/
    public XMLBuilder(String path)
    {
        this.path=path;
        init();
    }
     
    /**
    * 方法名称：init<p>
    * 方法功能：初始化函数<p>
    * 参数说明： <p>
    * 返回：void <p>
    * 作者：luoc
    * 日期：2005-6-22
    **/
    public void init()
    {
        buildDocument();
        buildRoot();
    }
     
    /**
    * 方法名称：buildDocument<p>
    * 方法功能：将XML文件生成Document <p>
    * 参数说明： <p>
    * 返回：void <p>
    * 作者：luoc
    * 日期：2005-6-22
    **/
    private void buildDocument()
    {
        DocumentBuilderFactory factory=DocumentBuilderFactory.newInstance();
        try
        {
            DocumentBuilder builder=factory.newDocumentBuilder();
            logger.debug("Construct document builder success.");
            System.out.println("path--"+path);
            doc=builder.parse(new File(path));    
            System.out.println("doc--"+doc);
            logger.debug("Build xml document success.");
        }catch(ParserConfigurationException e)
        {
            logger.error("Construct document builder error:"+e);
        }catch(SAXException e)
        {
            logger.error("Parse xml file error:"+e);
        }catch(IOException e)
        {
            logger.error("Read xml file error:"+e);
        }
    }
     
    /**
    * 方法名称：buildRoot<p>
    * 方法功能：生成XML的根结点<p>
    * 参数说明： <p>
    * 返回：void <p>
    * 作者：luoc
    * 日期：2005-6-22
    **/
    private void buildRoot()
    {
        root=doc.getDocumentElement();
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
    /**
     * @return 返回 root。
     */
    public Element getRoot()
    {
        return root;
    }
    /**
     * @param root 要设置的 root。
     */
    public void setRoot(Element root)
    {
        this.root = root;
    }
    /*全局变量*/
    private String path=null;//xml文件路径
    private Document doc=null;//xml文件对应的document
    private Element root=null;//xml文件的根结点
    private Logger logger=Logger.getLogger(getClass().getName());
}
