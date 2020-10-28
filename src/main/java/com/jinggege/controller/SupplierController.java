package com.jinggege.controller;

import com.jinggege.domain.Supplier;
import com.jinggege.service.SupplierService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/supplier")
public class SupplierController {
    @Resource
    private SupplierService supplierService;
    @RequestMapping("/info")
    public ModelAndView supplierInfo(){
        ModelAndView mv = new ModelAndView();
        List<Supplier> suppliers = supplierService.supplierInfo();
        mv.addObject("suppliers",suppliers);
        mv.setViewName("supplier");
        return mv;
    }
    @RequestMapping("/add")
    public ModelAndView addSupplier(String addSupplier, String addContacts,String addAddress,String addPhone){
        ModelAndView mv = new ModelAndView();
        Supplier supplier = new Supplier();
        supplier.setSupplier(addSupplier);
        supplier.setContacts(addContacts);
        supplier.setAddress(addAddress);
        supplier.setPhone(addPhone);
        System.out.println(supplier);
        int i = supplierService.addSupplier(supplier);
        System.out.println(i);
        List<Supplier> suppliers = supplierService.supplierInfo();
        mv.addObject("suppliers",suppliers);
        mv.setViewName("supplier");
        return mv;
    }

}
