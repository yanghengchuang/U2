package cn.kgc.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.mysql.jdbc.PreparedStatement;

/*
�������ݿ����ز����Լ����ݿ�Ĺر�
*/
public class JDBCUtils {
	
    //�������ݿ�ķ���
	public static Connection getConn(){
	ComboPooledDataSource cbpd = new ComboPooledDataSource("helloc3p0");
	     Connection conn=null;
	 try {
		conn = cbpd.getConnection();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return conn;
		
	}
	//
	public static  void closeAll(ResultSet rs,PreparedStatement pstm,Connection conn){
		try {
			if(rs!=null){rs.close();}
			if(pstm!=null){pstm.close();}
			if(conn!=null){conn.close();}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}

}
