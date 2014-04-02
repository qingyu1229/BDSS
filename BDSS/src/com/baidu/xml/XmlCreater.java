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
 * ������XmlCreater  <p>
 * �������� ����DOM������XML�ļ�<p>
 * ��д�� ��luoc<p>
 * ��д���� ��2005-6-22<p>
 * ��Ҫpublic��Ա������<p>
 * ��Ҫpublic������   <p>
 **/
 
public class XmlCreater
{
	  /*ȫ�ֱ���*/
    private Logger logger = Logger.getLogger(getClass().getName());
    private Document doc=null;//�´�����DOM
    private String path=null;//���ɵ�XML�ļ�����·��

    /**
     *���캯��˵����       <p>
     *����˵����@param path  xml�ļ�·�� <p>
    **/
    public XmlCreater(String path)
    {
        this.path=path;
        init();
    }
     
    /**
    * �������ƣ�init<p>
    * �������ܣ� ��ʼ������           <p>
    * ����˵���� <p>
    * ���أ�void <p>
    * ���ߣ�luoc
    * ���ڣ�2005-6-22
    **/
    private void init()
    {
        DocumentBuilderFactory factory=DocumentBuilderFactory.newInstance();
        try
        {
            DocumentBuilder builder=factory.newDocumentBuilder();
            doc=builder.newDocument();//�½�DOM
        }catch(ParserConfigurationException e)
        {
            logger.error("Parse DOM builder error:"+e);
        }
    }
     
    /**
    * �������ƣ�createRootElement<p>
    * �������ܣ���������㣬������            <p>
    * ����˵����@param rootTagName <p>
    * ���أ�Element <p>
    * ���ߣ�luoc
    * ���ڣ�2005-6-22
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
    * �������ƣ�createElement<p>
    * �������ܣ���parent����������ӽ��tagName<p>
    * ����˵����@param parent
    * ����˵����@param tagName <p>
    * ���أ�Element <p>
    * ���ߣ�luoc
    * ���ڣ�2005-6-22
    **/
    public Element createElement(Element parent,String tagName)
    {
        Document doc=parent.getOwnerDocument();
        Element child=doc.createElement(tagName);
        parent.appendChild(child);        
        return child;
    }
     
    /**
    * �������ƣ�createElement<p>
    * �������ܣ���parent���������ֵΪvalue���ӽ��tabName<p>
    * ����˵����@param parent
    * ����˵����@param tagName
    * ����˵����@param value <p>
    * ���أ�Element <p>
    * ���ߣ�luoc
    * ���ڣ�2005-6-22
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
    * �������ƣ�createAttribute<p>
    * �������ܣ���parent������������� <p>
    * ����˵����@param parent
    * ����˵����@param attrName ������
    * ����˵����@param attrValue ����ֵ<p>
    * ���أ�void <p>
    * ���ߣ�luoc
    * ���ڣ�2005-6-22
    **/
    public void createAttribute(Element parent,String attrName,String attrValue)
    {
        XmlOper.setElementAttr(parent,attrName,attrValue);        
    }
     
    /**
    * �������ƣ�buildXmlFile<p>
    * �������ܣ�����DOM����XML�ļ�<p>
    * ����˵���� <p>
    * ���أ�void <p>
    * ���ߣ�luoc
    * ���ڣ�2005-6-22
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
     * @return ���� doc��
     */
    public Document getDoc()
    {
        return doc;
    }
    /**
     * @param doc Ҫ���õ� doc��
     */
    public void setDoc(Document doc)
    {
        this.doc = doc;
    }
    /**
     * @return ���� path��
     */
    public String getPath()
    {
        return path;
    }
    /**
     * @param path Ҫ���õ� path��
     */
    public void setPath(String path)
    {
        this.path = path;
    }
  
}