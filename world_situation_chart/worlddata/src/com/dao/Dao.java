package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bean.Bean;
import com.db.DB;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class Dao {
	//查看个人信息
	public static ArrayList<Bean>findDate(String Date)
	{
		String sql="select * from worlddata";
		Connection con=null;
		PreparedStatement psts=null;
		ResultSet rs=null;
		ArrayList<Bean> list=new ArrayList<Bean>();
		
		try  
		{
			con=(Connection) DB.getConn();
			psts=(PreparedStatement) con.prepareStatement(sql);
			rs=psts.executeQuery();//记录返回的结果
			while(rs.next())
			{
				Bean user1=new Bean();
				user1.setProvince(rs.getString("Province"));
				user1.setConfirmed_num(rs.getString("Confirmed_num"));
				user1.setCured_num(rs.getString("Cured_num"));
				user1.setDead_num(rs.getString("Dead_num"));
				user1.setCity(rs.getString("City"));
				user1.setDate(rs.getString("Date"));
				list.add(user1);
			}
			
			DB.close(rs, psts, con);
			return list;
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} 
	return list;
}
	
	public static ArrayList<Bean> findpro()
	{
		String sql="select * from worlddata";
		Connection con=null;
		PreparedStatement psts=null;
		ResultSet rs=null;
		ArrayList<Bean> list=new ArrayList<Bean>();
		int flag=0;
		try  
		{
			con=(Connection) DB.getConn();
			psts=(PreparedStatement) con.prepareStatement(sql);
			rs=psts.executeQuery();//记录返回的结果
			while(rs.next())
			{
				Bean user1=new Bean();
				user1.setProvince(rs.getString("Province"));
				user1.setConfirmed_num(rs.getString("Confirmed_num"));
				user1.setCured_num(rs.getString("Cured_num"));
				user1.setDead_num(rs.getString("Dead_num"));
				user1.setCity(rs.getString("City"));
				user1.setDate(rs.getString("Date"));
				user1.setYisi_num(rs.getString("Yisi_num"));
				list.add(user1);
			
			}
			
			DB.close(rs, psts, con);
			return list;
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} 
	return list;
}

}
