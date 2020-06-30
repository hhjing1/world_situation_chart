package com.bean;


public class Bean {
	
	public String Date;
	public String Province;
	public String City;
	public String Confirmed_num;
	public String Cured_num;
	public String Dead_num;
	public String Yisi_num;
	
	public Bean() {}
	public Bean(String date, String province, String city, String confirmed_num, String cured_num, String dead_num,
			String yisi_num) {
		super();
		Date = date;
		Province = province;
		City = city;
		Confirmed_num = confirmed_num;
		Cured_num = cured_num;
		Dead_num = dead_num;
		Yisi_num = yisi_num;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public String getProvince() {
		return Province;
	}
	public void setProvince(String province) {
		Province = province;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getConfirmed_num() {
		return Confirmed_num;
	}
	public void setConfirmed_num(String confirmed_num) {
		Confirmed_num = confirmed_num;
	}
	public String getCured_num() {
		return Cured_num;
	}
	public void setCured_num(String cured_num) {
		Cured_num = cured_num;
	}
	public String getDead_num() {
		return Dead_num;
	}
	public void setDead_num(String dead_num) {
		Dead_num = dead_num;
	}
	public String getYisi_num() {
		return Yisi_num;
	}
	public void setYisi_num(String yisi_num) {
		Yisi_num = yisi_num;
	}
	
	
	

}
