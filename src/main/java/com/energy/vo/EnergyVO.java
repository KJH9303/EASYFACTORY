package com.energy.vo;

import java.sql.Date;

public class EnergyVO {
    private Date date;
    private Date startDate;
    private Date endDate;
    private double opratio;
    private int temp;
    private int tr;
    private int fal;
    private int stock;
    private int costs;
    private double usingratio;
    private Date hiredate;
   
    public EnergyVO() {
    	
    }
    public Date getDate() {
        return date;
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

    public void setDate(Date date) {
        this.date = date;
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

	   public EnergyVO(
			   double opratio
			   , int temp
			   , int tr
			   , int fal
			   , int stock
			   , int costs
			   , double usingratio
			   , Date hiredate) {
	      this.opratio = opratio;
	      this.temp = temp;
	      this.tr = tr;
	      this.fal = fal;
	      this.stock = stock;
	      this.costs = costs;
	      this.usingratio = usingratio;
	      this.hiredate = hiredate;
	   }
	   
	@Override
	   public String toString() {
	      String msg = String.format("process [opratio=" + opratio + ", temp=" + temp + ", tr=" + tr + ", fal=" + fal + ", stock=" + stock + ", costs=" + costs
	            + ", usingratio=" + usingratio + ", hiredate=" + hiredate + "]");
	      return msg;
	   }
	
	 public EnergyVO(java.sql.Date hiredate, double opratio, int costs, double usingratio, java.sql.Date hiredate1) {
		 	this.hiredate = hiredate;
	        this.opratio = opratio;
	        this.costs = costs;
	        this.usingratio = usingratio;
	        this.hiredate = hiredate1;
	    }

	
	}


