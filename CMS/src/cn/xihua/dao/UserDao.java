package cn.xihua.dao;

import java.util.List;

import cn.xihua.domain.User;

public interface UserDao {
  void add(User user);

List<User> findAll();

User queryOne(String id);

void upd(User u);

User login(User u);

void del(String id);
}
