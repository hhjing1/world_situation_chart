package yiqing;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;


public class db {
	private static String mysqlname = "database";
	private static Connection con;
	private static Statement sta;
	private static ResultSet re;
	private static String coursename = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/"+mysqlname+"?useSSL=false&characterEncoding=utf8&allowPublicKeyRetrieval=true";
	
	//注册驱动
	public static Connection getCon() {
		try {
			Class.forName(coursename);
			System.out.println("驱动加载成功");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			con = DriverManager.getConnection(url,"root","20000604");
			System.out.println("连接成功");
		}catch(Exception e){
			e.printStackTrace();
			con = null;
		}
		return con;
	}
	
	public static void close(Statement sta,Connection connection) {
		if(sta!=null) {
			try {
				((Connection) sta).close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(connection!=null) {
			try {
				connection.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
		
	//关闭连接
	public static void close(ResultSet re,Statement sta,Connection connection) {
		if(re!=null) {
			try {
				re.close();
			}catch(SQLException e) {
			e.printStackTrace();
			}
		}
		if(sta!=null) {
			try {
				((Connection) sta).close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(connection!=null) {
			try {
				connection.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public static void main(String[] args)
	{
		getCon();
	}
}
