package com.feb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DatepickerController {

    @RequestMapping("/")
    public String index() {
        return "datepicker";
    }
}
