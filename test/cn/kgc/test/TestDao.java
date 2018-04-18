package cn.kgc.test;

import static org.junit.Assert.*;

import org.junit.Test;

import cn.kgc.dao.UserDao;
import cn.kgc.dao.impl.UserDaoImpl;
import cn.kgc.entity.User;

public class TestDao {
	private  UserDao userdao= new UserDaoImpl();
	
	@Test
	public void testGetUserbyUserNameAndPassword() {
		User user=new User();
		user.setUsername("daofeng");//中文会乱码导致登陆失败
		user.setPassword("cfx139123");
		User user2 = userdao.getUserbyUserNameAndPassword(user);
		System.out.println(user2.toString());
	}

	@Test
	public void testSave() {
		User user=new User(null,"zhangsan","18862738253","zs123","zs123@163.com","male");
		int i = userdao.save(user);
		System.out.println(i);
		
	}

}
