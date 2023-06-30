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
    
    @GetMapping("/fetch-data")
    public List<FebVO> fetchData(@RequestParam("start_date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
                             @RequestParam("end_date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate) {
        List<FebVO> data = dataDao.getTableData(startDate, endDate);
        return data;
    }
}
