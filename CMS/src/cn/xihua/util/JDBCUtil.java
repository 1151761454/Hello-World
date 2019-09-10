package cn.xihua.util;


import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCUtil {
	  //һ�����еľ�̬������еĴ���ִֻ��һ��
    private  static Properties p=null;
    //�ڷ���֮ǰִ��
    static {
    	try {
    		p=new Properties();
    		
    		//ʹ���̵߳ķ�ʽ��ȡ��
    		InputStream is=Thread.currentThread().getContextClassLoader().getResourceAsStream("db.properties");
    	    //������
    		p.load(is);
    		
    		
    		//ע������
    		Class.forName(p.getProperty("driverClass"));
    	}
    	catch (Exception e) {
			// TODO: handle exception
    		e.printStackTrace();
		}
    }
    public static Connection getConnection() throws SQLException {
    	return DriverManager.getConnection(p.getProperty("url"),p.getProperty("username"),p.getProperty("password"));
    }
    
    public static void release(ResultSet rs,Statement st,Connection conn) {
    	try {
    	if(rs!=null) {
    		rs.close();
    	}
    	} catch (SQLException e) {
			// TODO: handle exception
    		e.printStackTrace();
		}
    	try {
    		if(st!=null) {
        		st.close();
        	}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	try {
    	if(conn!=null) {
    		conn.close();
    	}
    	} catch (SQLException e) {
			// TODO: handle exception
    		e.printStackTrace();
		}
    	
		
	}
    
}
