package yiqing;

public class information {
	private String id;
	private String date;
	private String province;
	private String city;
	private String confirmed_num;
	private String yisi_num;
	private String cured_num;
	private String dead_num;
	
	
	
	public information() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getConfirmed_num() {
		return confirmed_num;
	}
	public void setConfirmed_num(String confirmed_num) {
		this.confirmed_num = confirmed_num;
	}
	public String getYisi_num() {
		return yisi_num;
	}
	public void setYisi_num(String yisi_num) {
		this.yisi_num = yisi_num;
	}
	public String getCured_num() {
		return cured_num;
	}
	public void setCured_num(String cured_num) {
		this.cured_num = cured_num;
	}
	public String getDead_num() {
		return dead_num;
	}
	public void setDead_num(String dead_num) {
		this.dead_num = dead_num;
	}
	public information(String id, String date, String province, String city, String confirmed_num, String yisi_num,
			String cured_num, String dead_num) {
		super();
		this.id = id;
		this.date = date;
		this.province = province;
		this.city = city;
		this.confirmed_num = confirmed_num;
		this.yisi_num = yisi_num;
		this.cured_num = cured_num;
		this.dead_num = dead_num;
	}
	
	
}
