package cn.kgc.service.impl;

import cn.kgc.dao.UserDao;
import cn.kgc.dao.impl.UserDaoImpl;
import cn.kgc.entity.User;
import cn.kgc.service.UserService;

public class UserServiceImpl implements UserService{

	
	private UserDao userdao=new UserDaoImpl();
	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		return userdao.getUserbyUserNameAndPassword(user);
	}

	@Override
	public boolean register(User user) {
		int count= userdao.save(user);	
		return count!=0;
	}

	@Override
	public User login1(User user) {
		// TODO Auto-generated method stub
		return userdao.getUserbyEmailAndPassword(user);
	}
    //
	@Override
	public User login2(User user) {
		// TODO Auto-generated method stub
		return userdao.getUserbyPhoneAndPassword(user);
	}

}
