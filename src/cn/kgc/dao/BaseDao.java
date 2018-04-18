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

//带泛型的实体类
public class BaseDao<T> {
	QueryRunner runn=new  QueryRunner();
	
	public Class<T> type;
	
	public BaseDao(){
		//获取当前类的带泛型的父类的类型
		ParameterizedType tp = (ParameterizedType) this.getClass().getGenericSuperclass();
		//获取泛型里面具体的类
		//带泛型的类里面的对象只有一个
		Type[] types = tp.getActualTypeArguments();
		//从数组中获取到第一个即可
		this.type=(Class<T>) types[0];
	}
	
	
	
	
	//通用的增删改的方法
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
	//通用的查询一个数据的方法
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
	//通用的查询多个的方法
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
