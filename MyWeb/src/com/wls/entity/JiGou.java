package com.wls.entity;
/**
 * 实体类:机构表    	
 * 创建者:wls       	
 * 时间:2015-07-23
 */
public class JiGou {
 
	private String id;       		//ID(序号)
	private String jgmc;      		//机构名称
	private String jgdm;       		//机构代码
	private String sjjgdm;       	//上级机构代码
	private String mima;       		//密码
	private String bz;       		//备注
	private String jglb;     		//机构类别（0系统管理员，1市局，2分局，3警务站，4指挥中心）
	
	
	private String sjjgmc;       	//上级机构代码
	
	@Override
	public String toString() {
		return "JiGou [id=" + id + ", jgmc=" + jgmc + ", jgdm=" + jgdm
				+ ", sjjgdm=" + sjjgdm + ", mima=" + mima + ", bz=" + bz
				+ ", jglb=" + jglb + ", sjjgmc=" + sjjgmc + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getJgmc() {
		return jgmc;
	}

	public void setJgmc(String jgmc) {
		this.jgmc = jgmc;
	}

	public String getJgdm() {
		return jgdm;
	}

	public void setJgdm(String jgdm) {
		this.jgdm = jgdm;
	}

	public String getSjjgdm() {
		return sjjgdm;
	}

	public void setSjjgdm(String sjjgdm) {
		this.sjjgdm = sjjgdm;
	}

	public String getMima() {
		return mima;
	}

	public void setMima(String mima) {
		this.mima = mima;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getJglb() {
		return jglb;
	}

	public void setJglb(String jglb) {
		this.jglb = jglb;
	}

	public String getSjjgmc() {
		return sjjgmc;
	}

	public void setSjjgmc(String sjjgmc) {
		this.sjjgmc = sjjgmc;
	}

}
