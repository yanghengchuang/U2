package cn.kgc.dao.impl;

import cn.kgc.dao.BaseDao;
import cn.kgc.dao.UserDao;
import cn.kgc.entity.User;
/*
 * UserDao的实现类
*/
public class UserDaoImpl extends BaseDao<User> implements UserDao {

	@Override
	public User getUserbyUserNameAndPassword(User user) {
		String sql="select uid,username,phone,password,email,sex from user where username=? and password=?";
		return this.getBean(sql, user.getUsername(),user.getPassword());
	}

	@Override
	public int save(User user) {
		String sql="insert into user(username,phone,password,email,sex) values(?,?,?,?,?)";
		
		
		return this.update(sql, user.getUsername(),user.getPhone(),user.getPassword(),user.getEmail(),user.getSex());
		
	}

	@Override
	public User getUserbyPhoneAndPassword(User user) {
		String sql="select uid,username,phone,password,email,sex from user where phone=? and password=?";
		return this.getBean(sql, user.getPhone(),user.getPassword());
	}
	@Override
	public User getUserbyEmailAndPassword(User user) {
		String sql="select uid,username,phone,password,email,sex from user where email=? and password=?";
		return this.getBean(sql, user.getEmail(),user.getPassword());
	}

}
