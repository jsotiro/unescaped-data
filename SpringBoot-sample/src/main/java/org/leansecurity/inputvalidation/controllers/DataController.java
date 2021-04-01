package org.leansecurity.inputvalidation.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.leansecurity.inputvalidation.models.Message;

@Controller
public class DataController {
    @RequestMapping("/")
    public String index()
    {
        return "index";
    }

    @PostMapping("/data")
    public ModelAndView postData(Message msg) {

        String data = msg.getData();
        String template = msg.getTemplate();
        String templateName =template +"-data";
        return new ModelAndView(templateName, "data", data);
    }





}
