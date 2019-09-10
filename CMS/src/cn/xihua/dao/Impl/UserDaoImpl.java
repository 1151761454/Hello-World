package cn.xihua.dao.Impl;

import java.util.List;

import cn.xihua.dao.UserDao;
import cn.xihua.dao.Impl.BaseDao;
import cn.xihua.domain.User;

public class UserDaoImpl extends BaseDao implements UserDao {

	@Override
	public void add(User user) {
		// TODO 自动生成的方法存根
       try {
    	   //获取语句执行对象【预编译对象】
    	   String sql="insert into user(name,password,age,stature,address ) values(?,?,?,?,?)";
    	   executeUpdate(sql,user.getName(),user.getPassword(),user.getAge(),user.getStature(),user.getAddress());
       }catch (Exception e) {
		// TODO: handle exception
    	   e.printStackTrace();
	}
        
       
	}
	@Override
	public List<User> findAll() {
		// TODO 自动生成的方法存根
       try {
    	   String sql="select * from user";
    	   //参数1:sql语句
    	   //参数2:需要封装数据的类的字节码对象
    	   //参数3:从第三个参数开始，需要给SQL语句中的参数赋值
    	  return executeQuery(sql,User.class);
       }catch (Exception e) {
		
    	   e.printStackTrace();
	}
       return null;
           
	}
	@Override
	public User queryOne(String id) {
		try {
			String sql="select * from user where id=?";
			return executeQueryOne(sql, User.class, id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public void upd(User u) {
		// TODO 自动生成的方法存根
		try {
			String sql="update user set name=?, password=?,age=?,stature=?,address=? where id=?";
			 executeUpdate(sql,u.getName(),u.getPassword(),u.getAge(),u.getStature(),u.getAddress(),u.getId());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@Override
	public User login(User u) {
		
		// TODO 自动生成的方法存根
				try {
					String sql="select * from user where name=? and password=?";
					 return executeQueryOne(sql,User.class,u.getName(),u.getPassword());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		return null;
	}
	@Override
	public void del(String id) {
		// TODO 自动生成的方法存根
	       try {
	    	   //获取语句执行对象【预编译对象】
	    	   String sql="delete from user where id=?";
	    	   executeUpdate(sql,id);
	       }catch (Exception e) {
			// TODO: handle exception
	    	   e.printStackTrace();
	}

}
}
