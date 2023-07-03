package com.feb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.feb.dao.DataDao;
import com.feb.vo.FebVO;

import java.util.Date;
import java.util.List;

@RestController
public class DataController {
    
    private final DataDao dataDao;
    
    @Autowired
    public DataController(DataDao dataDao) {
        this.dataDao = dataDao;
    }
    
    /*
     * startDate와 endDate는 필수적으로 입력을 받아야함.
     * yyyy-MM-dd 형태로 입력받도록 요청파라미터를 어노테이션을 활용하여 변환함.
     */
    @GetMapping("/fetch-data")
    public List<FebVO> fetchData(@RequestParam("start_date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
                             @RequestParam("end_date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate) {
        List<FebVO> data = dataDao.getTableData(startDate, endDate);
        return data;
    }
}
