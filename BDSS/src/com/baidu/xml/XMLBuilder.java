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
 * ������XmlBuilder  <p>
 * �����������ݴ����XML�ļ�����Document��root��� <p>
 * ��д�� ��luoc<p>
 * ��д���� ��2005-6-22<p>
 * ��Ҫpublic��Ա������<p>
 * ��Ҫpublic������   <p>
 **/
 
public class XMLBuilder
{
    /**
     *���캯��˵����       <p>
     *����˵����@param path   <p>
    **/
    public XMLBuilder(String path)
    {
        this.path=path;
        init();
    }
     
    /**
    * �������ƣ�init<p>
    * �������ܣ���ʼ������<p>
    * ����˵���� <p>
    * ���أ�void <p>
    * ���ߣ�luoc
    * ���ڣ�2005-6-22
    **/
    public void init()
    {
        buildDocument();
        buildRoot();
    }
     
    /**
    * �������ƣ�buildDocument<p>
    * �������ܣ���XML�ļ�����Document <p>
    * ����˵���� <p>
    * ���أ�void <p>
    * ���ߣ�luoc
    * ���ڣ�2005-6-22
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
    * �������ƣ�buildRoot<p>
    * �������ܣ�����XML�ĸ����<p>
    * ����˵���� <p>
    * ���أ�void <p>
    * ���ߣ�luoc
    * ���ڣ�2005-6-22
    **/
    private void buildRoot()
    {
        root=doc.getDocumentElement();
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
    /**
     * @return ���� root��
     */
    public Element getRoot()
    {
        return root;
    }
    /**
     * @param root Ҫ���õ� root��
     */
    public void setRoot(Element root)
    {
        this.root = root;
    }
    /*ȫ�ֱ���*/
    private String path=null;//xml�ļ�·��
    private Document doc=null;//xml�ļ���Ӧ��document
    private Element root=null;//xml�ļ��ĸ����
    private Logger logger=Logger.getLogger(getClass().getName());
}
