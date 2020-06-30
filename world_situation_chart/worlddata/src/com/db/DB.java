package com.db;


//数据库连接
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
* 数据库连接工具
* @author Zheng
*
*/
public class DB {
	
	public static String db_url = "jdbc:mysql://localhost:3306/database?useSSL=false";
	public static String db_user = "root";
	public static String db_pass = "20000604";
	
	public static Connection getConn () {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");//加载驱动
			conn = DriverManager.getConnection(db_url, db_user, db_pass);//通过输入的用户名还有密码来建立一个到数据库的连接主要是调用connect（）方法
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	/**
	 * 关闭连接
	 * @param state
	 * @param conn
	 */
	public static void close (Statement state, Connection conn) {
		if (state != null) {
			try {
				state.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close (ResultSet rs, Statement state, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (state != null) {
			try {
				state.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}


