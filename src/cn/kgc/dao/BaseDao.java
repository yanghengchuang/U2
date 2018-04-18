package cn.kgc.dao;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.alibaba.fastjson.util.ParameterizedTypeImpl;

import cn.kgc.util.JDBCUtils;

//�����͵�ʵ����
public class BaseDao<T> {
	QueryRunner runn=new  QueryRunner();
	
	public Class<T> type;
	
	public BaseDao(){
		//��ȡ��ǰ��Ĵ����͵ĸ��������
		ParameterizedType tp = (ParameterizedType) this.getClass().getGenericSuperclass();
		//��ȡ��������������
		//�����͵�������Ķ���ֻ��һ��
		Type[] types = tp.getActualTypeArguments();
		//�������л�ȡ����һ������
		this.type=(Class<T>) types[0];
	}
	
	
	
	
	//ͨ�õ���ɾ�ĵķ���
	public int update(String sql,Object...args){
		int count=0;
		Connection conn=null;
		try {
		      conn=JDBCUtils.getConn();
		
			count=runn.update(conn, sql, args);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  finally{
			
			JDBCUtils.closeAll(null, null, conn);
		}
		
		  return count;
		
	}
	//ͨ�õĲ�ѯһ�����ݵķ���
	public  T getBean(String sql,Object...args){
		T t=null;
		Connection conn = JDBCUtils.getConn();
		try {
			t=runn.query(conn, sql, new BeanHandler<T>(type), args);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			
			JDBCUtils.closeAll(null, null, conn);
		}	
		return t;
	}
	//ͨ�õĲ�ѯ����ķ���
	public List<T> getListBean(String sql,Object...args){
		List<T> list=new ArrayList<T>();
		Connection conn = JDBCUtils.getConn();
		try {
			list=runn.query(conn, sql, new BeanListHandler<T>(type), args);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			
			JDBCUtils.closeAll(null, null, conn);
		}
		      return list;
		
	}
	

	
	
	
}
