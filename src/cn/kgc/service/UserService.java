package cn.kgc.service;

import cn.kgc.entity.User;

/*
 * ��½ע���service�ӿ�
*/
public interface UserService {
	
	User login(User user);
	User login1(User user);
	User login2(User user);
	
	boolean register(User user);

}
