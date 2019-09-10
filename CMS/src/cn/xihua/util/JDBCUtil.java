package cn.xihua.util;


import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCUtil {
	  //一个类中的静态代码块中的代码只执行一次
    private  static Properties p=null;
    //在方法之前执行
    static {
    	try {
    		p=new Properties();
    		
    		//使用线程的方式读取流
    		InputStream is=Thread.currentThread().getContextClassLoader().getResourceAsStream("db.properties");
    	    //加载流
    		p.load(is);
    		
    		
    		//注册驱动
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
