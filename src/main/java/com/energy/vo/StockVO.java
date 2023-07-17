package com.energy.vo;

import java.sql.Date;
import java.util.Arrays;

public class StockVO {
    private Date startDate;
    private Date endDate;
    private int fal;
    private int stock;
    private Date hiredate;
    private int[] febstock;
    private int[] febfal;
    
    
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
	public int getFal() {
		return fal;
	}
	public void setFal(int fal) {
		this.fal = fal;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public Date getHiredate() {
		return hiredate;
	}
	public void setHiredate(Date hiredate) {
		this.hiredate = hiredate;
	}
	public int[] getFebstock() {
		return febstock;
	}
	public void setFebstock(int[] febstock) {
		this.febstock = febstock;
	}
	public int[] getFebfal() {
		return febfal;
	}
	public void setFebfal(int[] febfal) {
		this.febfal = febfal;
	}
	@Override
	public String toString() {
		return "StockVO [startDate=" + startDate + ", endDate=" + endDate + ", fal=" + fal + ", stock=" + stock
				+ ", hiredate=" + hiredate + ", febstock=" + Arrays.toString(febstock) + ", febfal="
				+ Arrays.toString(febfal) + ", getStartDate()=" + getStartDate() + ", getEndDate()=" + getEndDate()
				+ ", getFal()=" + getFal() + ", getStock()=" + getStock() + ", getHiredate()=" + getHiredate()
				+ ", getFebstock()=" + Arrays.toString(getFebstock()) + ", getFebfal()=" + Arrays.toString(getFebfal())
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
   
	
	
 }
	
	


