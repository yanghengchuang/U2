package cn.kgc.dao;

import cn.kgc.entity.User;

/*

*��½��ע��Ľӿ�
*/
public interface UserDao {
	//��½�ķ���
	
	//�����û���/�绰����/����������½����ѯ����
	User getUserbyUserNameAndPassword(User user);
	//���ݵ绰����������½����ѯ����
	User getUserbyPhoneAndPassword(User user);
	//�����������������ѯ����
	User getUserbyEmailAndPassword(User user);
	
	/*ע��ķ���*/
	//ע���������һ���û�������ɹ��ͻ᷵��һ����¼��
	int save(User user);
	

}
