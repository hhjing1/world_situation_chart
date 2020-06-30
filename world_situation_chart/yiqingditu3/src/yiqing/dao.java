package yiqing;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;
//import com.sun.org.apache.xpath.internal.operations.And;

public class dao {

	public List<information> search(String data){
		int num=0;
		List<information>list=new ArrayList<information>();
	Connection con=null;
    java.sql.Statement psts=null;
 	ResultSet rs=null;
	try {
		con=db.getCon();
		String sql="select * from info1 where Date ='"+data+"'";
		System.out.print(sql);
		psts=con.createStatement();
		rs=psts.executeQuery(sql);
		while(rs.next()){
			String id=rs.getString("Id");
			String date=rs.getString("Date");
			 String province=rs.getString("Province");
			 String city=rs.getString("City");
			 String confirmed_num=rs.getString("Confirmed_num");
			 String yisi_num=rs.getString("Yisi_num");
			 String cured_num=rs.getString("Cured_num");
			 String dead_num=rs.getString("Dead_num");
			 
			 information data1=new information(id,date,province,city,confirmed_num,yisi_num,cured_num,dead_num);
			 list.add(data1);
			
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return list;
}
	
	public static List searchPro(String data,String province) {
		int num=0;
		List<information>list=new ArrayList<information>();
	Connection con=null;
    java.sql.Statement psts=null;
 	ResultSet rs=null;
	try {
		con=db.getCon();
		String sql="select * from info1 where Date ='"+data+"' and Province ='"+province+"'";
		System.out.print(sql);
		psts=con.createStatement();
		rs=psts.executeQuery(sql);
		while(rs.next()){
			String id=rs.getString("Id");
			String date=rs.getString("Date");
			String city=rs.getString("City");
			 String confirmed_num=rs.getString("Confirmed_num");
			 String yisi_num=rs.getString("Yisi_num");
			 String cured_num=rs.getString("Cured_num");
			 String dead_num=rs.getString("Dead_num");
			 
			 information pro=new information(id,date,province,city,confirmed_num,yisi_num,cured_num,dead_num);
			 list.add(pro);	
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return list;
		
	}
	
	
	public static void main(String[] args) {
		dao dataDao=new dao();
		//List<information>list=dataDao.search("2020-02-08 02:28:59");
		List<information>list=dataDao.searchPro("2020-02-08 02:28:59","ºþ±±Ê¡");
		int size=list.size();
		System.out.print(size);
		
	}
}