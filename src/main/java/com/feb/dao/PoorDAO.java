package com.feb.dao;

import java.time.LocalDate;
import java.time.LocalTime;

public class PoorDAO {
    
	public String getRandomDefect() {
		while (true) {
		    LocalDate nowdate = LocalDate.now();
		    LocalTime nowtime = LocalTime.now();
	
		    int num = (int)(Math.random()*6) +1;
		    String result = "";
		    
		    if (num == 1) {
		        result = "기판불량 입니다." + nowdate + " " + nowtime;
		    } else if (num == 2) {
		        result = "기판파손 입니다." + nowdate + " " + nowtime;
		    } else if (num == 3) {
		        result = "공정이 무너졌습니다." + nowdate + " " + nowtime;
		    } else if (num == 4) {
		        result = "particle불량 입니다." + nowdate + " " + nowtime;
		    } else if (num == 5) {
		        result = "Crack이 발생했습니다." + nowdate + " " + nowtime;
		    } else {
		        result = "공정불량 입니다." + nowdate + " " + nowtime;
		    }
		    System.out.println("●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●Random defect: " + result); // 추가된 코드
		    System.out.println("●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●● PoorDao 작동 ●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●");
		    return result;
		}
	}
}
