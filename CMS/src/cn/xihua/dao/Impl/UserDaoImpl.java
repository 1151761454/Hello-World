package cn.xihua.dao.Impl;

import java.util.List;

import cn.xihua.dao.UserDao;
import cn.xihua.dao.Impl.BaseDao;
import cn.xihua.domain.User;

public class UserDaoImpl extends BaseDao implements UserDao {

	@Override
	public void add(User user) {
		// TODO �Զ����ɵķ������
       try {
    	   //��ȡ���ִ�ж���Ԥ�������
    	   String sql="insert into user(name,password,age,stature,address ) values(?,?,?,?,?)";
    	   executeUpdate(sql,user.getName(),user.getPassword(),user.getAge(),user.getStature(),user.getAddress());
       }catch (Exception e) {
		// TODO: handle exception
    	   e.printStackTrace();
	}
        
       
	}
	@Override
	public List<User> findAll() {
		// TODO �Զ����ɵķ������
       try {
    	   String sql="select * from user";
    	   //����1:sql���
    	   //����2:��Ҫ��װ���ݵ�����ֽ������
    	   //����3:�ӵ�����������ʼ����Ҫ��SQL����еĲ�����ֵ
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
		// TODO �Զ����ɵķ������
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
		
		// TODO �Զ����ɵķ������
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
		// TODO �Զ����ɵķ������
	       try {
	    	   //��ȡ���ִ�ж���Ԥ�������
	    	   String sql="delete from user where id=?";
	    	   executeUpdate(sql,id);
	       }catch (Exception e) {
			// TODO: handle exception
	    	   e.printStackTrace();
	}

}
}
