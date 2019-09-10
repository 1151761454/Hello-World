package cn.xihua.service.Impl;

import java.util.List;

import cn.xihua.dao.UserDao;
import cn.xihua.dao.Impl.UserDaoImpl;
import cn.xihua.domain.User;
import cn.xihua.service.UserService;

public class UserServiceImpl implements UserService {

	@Override
	public void add(User user) {
		// TODO 自动生成的方法存根
            UserDao dao=new UserDaoImpl();
            dao.add(user);
	}

	@Override
	public List<User> findAll() {
		// TODO 自动生成的方法存根
		 UserDao dao=new UserDaoImpl();
		 return dao.findAll();
	}

	@Override
	public User queryOne(String id) {
		// TODO 自动生成的方法存根
		 UserDao dao=new UserDaoImpl();
		 return dao.queryOne(id);
	}

	@Override
	public void upd(User u) {
		// TODO 自动生成的方法存根
		UserDao dao=new UserDaoImpl();
		 dao.upd(u);
	}

	@Override
	public User login(User u) {
		// TODO 自动生成的方法存根
		UserDao dao=new UserDaoImpl();
		return dao.login(u);
		 
	}

	@Override
	public void del(String id) {
		// TODO 自动生成的方法存根
		UserDao dao=new UserDaoImpl();
		 dao.del(id);
	}

}
