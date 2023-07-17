package com.energy.vo;

import java.sql.Date;
import java.util.Arrays;

public class EnergyVO {
    private Date date;
    private Date startDate;
    private Date endDate;
    private double opratio;
    private int temp;
    private int tr;
    private int costs;
    private double usingratio;
    private Date hiredate;
    private double[] febopratio;
    private int[] febtr;
    private int[] febcosts;
    private int[] febusingratio;
    private double[] febcvusingratio;
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public double getOpratio() {
		return opratio;
	}
	public void setOpratio(double opratio) {
		this.opratio = opratio;
	}
	public int getTemp() {
		return temp;
	}
	public void setTemp(int temp) {
		this.temp = temp;
	}
	public int getTr() {
		return tr;
	}
	public void setTr(int tr) {
		this.tr = tr;
	}
	public int getCosts() {
		return costs;
	}
	public void setCosts(int costs) {
		this.costs = costs;
	}
	public double getUsingratio() {
		return usingratio;
	}
	public void setUsingratio(double usingratio) {
		this.usingratio = usingratio;
	}
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	public double[] getFebopratio() {
		return febopratio;
	}
	public void setFebopratio(double[] febopratio) {
		this.febopratio = febopratio;
	}
	public int[] getFebtr() {
		return febtr;
	}
	public void setFebtr(int[] febtr) {
		this.febtr = febtr;
	}
	public int[] getFebcosts() {
		return febcosts;
	}
	public void setFebcosts(int[] febcosts) {
		this.febcosts = febcosts;
	}
	public int[] getFebusingratio() {
		return febusingratio;
	}
	public void setFebusingratio(int[] febusingratio) {
		this.febusingratio = febusingratio;
	}
	public double[] getFebcvusingratio() {
		return febcvusingratio;
	}
	public void setFebcvusingratio(double[] febcvusingratio) {
		this.febcvusingratio = febcvusingratio;
	}
	@Override
	public String toString() {
		return "EnergyVO [date=" + date + ", startDate=" + startDate + ", endDate=" + endDate + ", opratio=" + opratio
				+ ", temp=" + temp + ", tr=" + tr + ", costs=" + costs + ", usingratio=" + usingratio + ", hiredate="
				+ hiredate + ", febopratio=" + Arrays.toString(febopratio) + ", febtr=" + Arrays.toString(febtr)
				+ ", febcosts=" + Arrays.toString(febcosts) + ", febusingratio=" + Arrays.toString(febusingratio)
				+ ", febcvusingratio=" + Arrays.toString(febcvusingratio) + ", getDate()=" + getDate()
				+ ", getStartDate()=" + getStartDate() + ", getEndDate()=" + getEndDate() + ", getOpratio()="
				+ getOpratio() + ", getTemp()=" + getTemp() + ", getTr()=" + getTr() + ", getCosts()=" + getCosts()
				+ ", getUsingratio()=" + getUsingratio() + ", getHiredate()=" + getHiredate() + ", getFebopratio()="
				+ Arrays.toString(getFebopratio()) + ", getFebtr()=" + Arrays.toString(getFebtr()) + ", getFebcosts()="
				+ Arrays.toString(getFebcosts()) + ", getFebusingratio()=" + Arrays.toString(getFebusingratio())
				+ ", getFebcvusingratio()=" + Arrays.toString(getFebcvusingratio()) + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
 }
	
	


