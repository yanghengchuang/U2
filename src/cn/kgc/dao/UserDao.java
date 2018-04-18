package cn.kgc.dao;

import cn.kgc.entity.User;

/*

*登陆和注册的接口
*/
public interface UserDao {
	//登陆的方法
	
	//根据用户名/电话号码/邮箱和密码登陆做查询操作
	User getUserbyUserNameAndPassword(User user);
	//根据电话号码和密码登陆做查询操作
	User getUserbyPhoneAndPassword(User user);
	//根据邮箱和密码做查询操作
	User getUserbyEmailAndPassword(User user);
	
	/*注册的方法*/
	//注册就是增加一个用户，如果成功就会返回一个记录数
	int save(User user);
	

}
