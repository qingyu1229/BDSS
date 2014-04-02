package com.baidu.ConnFactory;

import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

/**
 * MyBatis Connection Factory, which reads the configuration data from a XML
 * file.
 * 
 * @author Loiane Groner http://loianegroner.com (English) http://loiane.com
 *         (Portuguese)
 */
public class IbatisConnectionFactory {

	private static SqlMapClient sqlmapclient = null;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
			if (sqlmapclient == null) {
				sqlmapclient = SqlMapClientBuilder.buildSqlMapClient(reader);
			}
			reader.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static SqlMapClient getSqlMapClient(){
		return sqlmapclient;
	}

}
