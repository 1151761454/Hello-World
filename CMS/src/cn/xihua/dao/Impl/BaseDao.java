package cn.xihua.dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import cn.xihua.util.JDBCUtil;

public class BaseDao {
	/**
	 * 封装增删改的方法
	 * @param sql sql语句
	 * @param obj sql语句参数的赋值
	 * @throws Exception
	 * @throws SQLException
	 */
	public void executeUpdate(String sql,Object... obj) throws Exception, SQLException {
		Connection conn = JDBCUtil.getConnection();
		
		PreparedStatement pst = conn.prepareStatement(sql);
		//准备给sql中的占位符赋值
		//遍历传入的给SQL参数的值【可变参数】
		for (int i = 1; i <= obj.length; i++) {
			//数组下标从0开始，遍历从1开始，所以从数组中取值应该是i-1
			pst.setObject(i, obj[i-1]);
		}
		//执行
		pst.executeUpdate();
		//释放资源
		JDBCUtil.release(null, pst, conn);
	}
	
	public <T> T executeQueryOne(String sql,Class<T> clz,Object... obj) throws Exception, SQLException {
		/**
		 * 查询
		 */
		Connection conn = JDBCUtil.getConnection();
		
		PreparedStatement pst = conn.prepareStatement(sql);
		//准备SQL的参数赋值
		for (int i = 1; i <= obj.length; i++) {
			pst.setObject(i, obj[i-1]);
		}
		
		//执行SQL
		ResultSet rs = pst.executeQuery();
		
		//User u =null;
		T t=null;
		//移动光标，如果有数据就返回true，没有就返回false
		if (rs.next()) {
			//将结果集对象中的数据封装到User类
			//u= new User();
			t=clz.newInstance();
			//想办法将结果集对象转成map
			//beanutils.populate()
			
			//rs转换map
			ResultSetMetaData rsmd = rs.getMetaData();
			//获取结果集的列数
			int count = rsmd.getColumnCount();
			//存储的是一行数据
			HashMap<String, Object> map = new  HashMap<>();
			
			//遍历
			for (int i = 1; i <=count; i++) {
				//字段名字
				String name = rsmd.getColumnLabel(i);
				//根据字段名从结果集中获取对应的数据
				Object value = rs.getObject(name);
				map.put(name, value);
			}
			//将map中的数据封装到对象中
			BeanUtils.populate(t, map);
		}
		//释放资源
		JDBCUtil.release(rs, pst, conn);
		return t;
	}
	public <T> List<T> executeQuery(String sql,Class<T> clz,Object... obj) throws Exception, SQLException {
		/**
		 * 查询
		 */
		Connection conn = JDBCUtil.getConnection();
		
		PreparedStatement pst = conn.prepareStatement(sql);
		//准备SQL的参数赋值
		for (int i = 1; i <= obj.length; i++) {
			pst.setObject(i, obj[i-1]);
		}
		
		//执行SQL
		ResultSet rs = pst.executeQuery();
		
		//User u =null;
		//移动光标，如果有数据就返回true，没有就返回false
		List<T> list= new ArrayList<>();
		while (rs.next()) {
			//将结果集对象中的数据封装到User类
			//u= new User();
			T t=clz.newInstance();
			//想办法将结果集对象转成map
			//beanutils.populate()
			
			//rs转换map
			ResultSetMetaData rsmd = rs.getMetaData();
			//获取结果集的列数
			int count = rsmd.getColumnCount();
			//存储的是一行数据
			HashMap<String, Object> map = new  HashMap<>();
			
			//遍历
			for (int i = 1; i <=count; i++) {
				//字段名字
				String name = rsmd.getColumnLabel(i);
				//根据字段名从结果集中获取对应的数据
				Object value = rs.getObject(name);
				map.put(name, value);
			}
			//将map中的数据封装到对象中
			BeanUtils.populate(t, map);
			//将每行数据添加到集合中
			list.add(t);
		}
		//释放资源
		JDBCUtil.release(rs, pst, conn);
		return list;
	}
}
