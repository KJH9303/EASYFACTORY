package com.simulation.dao;

public class CalcTest {

	public static void main(String[] args) {
		int cnt = 10;
		
		/////////////////////////////// 1공정
		double elec = 40.0;
		double cost = 200;

		for (int i = 1; i <= cnt; i++) {
			elec = i * elec;
			cost = i * cost;
		}
		System.out.println("elec  : " + elec + "kWh" + ", cost : " + cost + "원");
		
		////////////////////////////////
	}
}
