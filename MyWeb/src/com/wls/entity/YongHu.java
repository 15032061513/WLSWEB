package com.wls.entity;
/**
 * 实体类:用户表    	
 * 创建者:wls       	
 * 时间:2015-07-23
 * 修改：sjx 2015-08-03
 */
public class YongHu {
 
	private String id;       		//ID(序号)
	private String xingming;      	//姓名
	private String jinghao;       	//警号
	private String nianling;       	//年龄
	private String xingbie;       	//性别(0:女，1:男)
	private String dianhua;       	//电话
	private String jigoudaima;      //工作机构代码
	private String jigoumc;      //工作机构代码
	private String mima;       		//密码
	//--------------2015-08-03新增字段--------------------------
	private String zhandh;       		//站电话
	private String shidh;       		//市电话
	private String jgdz;       		//机构地址（单位地址）
	private String sspcs;       		//所属（所属派出所）
	
	
	
	
	public String getZhandh() {
		return zhandh;
	}


	public void setZhandh(String zhandh) {
		this.zhandh = zhandh;
	}


	public String getShidh() {
		return shidh;
	}


	public void setShidh(String shidh) {
		this.shidh = shidh;
	}


	public String getJgdz() {
		return jgdz;
	}


	public void setJgdz(String jgdz) {
		this.jgdz = jgdz;
	}


	public String getSspcs() {
		return sspcs;
	}


	public void setSspcs(String sspcs) {
		this.sspcs = sspcs;
	}

	public String getJigoumc() {
		return jigoumc;
	}


	public void setJigoumc(String jigoumc) {
		this.jigoumc = jigoumc;
	}


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getXingming() {
		return xingming;
	}
	public void setXingming(String xingming) {
		this.xingming = xingming;
	}
	public String getJinghao() {
		return jinghao;
	}
	public void setJinghao(String jinghao) {
		this.jinghao = jinghao;
	}
	public String getNianling() {
		return nianling;
	}
	public void setNianling(String nianling) {
		this.nianling = nianling;
	}
	public String getXingbie() {
		return xingbie;
	}
	public void setXingbie(String xingbie) {
		this.xingbie = xingbie;
	}
	public String getDianhua() {
		return dianhua;
	}
	public void setDianhua(String dianhua) {
		this.dianhua = dianhua;
	}
	public String getJigoudaima() {
		return jigoudaima;
	}
	public void setJigoudaima(String jigoudaima) {
		this.jigoudaima = jigoudaima;
	}
	public String getMima() {
		return mima;
	}
	public void setMima(String mima) {
		this.mima = mima;
	}
	

	@Override
	public String toString() {
		return "YongHu [id=" + id + ", xingming=" + xingming + ", jinghao="
				+ jinghao + ", nianling=" + nianling + ", xingbie=" + xingbie
				+ ", dianhua=" + dianhua + ", jigoudaima=" + jigoudaima
				+ ", jigoumc=" + jigoumc + ", mima=" + mima + ", zhandh="
				+ zhandh + ", shidh=" + shidh + ", jgdz=" + jgdz + ", sspcs="
				+ sspcs + "]";
	}

}
