package cn.kgc.test;

import java.sql.Connection;

import cn.kgc.util.JDBCUtils;

public class Test {
	
   public static void main(String[] args) {
	   
	   Connection conn = JDBCUtils.getConn();
	   System.out.println(conn);
	
}
	
	
	

}
