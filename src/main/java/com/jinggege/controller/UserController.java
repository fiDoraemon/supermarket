package com.jinggege.controller;

import com.jinggege.domain.User;
import com.jinggege.service.LoginService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private LoginService loginService;
    @RequestMapping("/login")
    public ModelAndView userLogin(HttpServletResponse response, HttpServletRequest request ,
                                  String name, String password){
        User user = new User();
        ModelAndView modelAndView = new ModelAndView();
        String msg ="";
        if (name == "" && name.length() == 0 ){
            msg = "登录失败！用户名或密码错误";
            modelAndView.addObject("msg",msg);

        }else {
            user.setUsername(name);
            user.setPassword(password);
            User login = loginService.login(user);
            if (login == null){
                msg = "登录失败！用户名或密码错误";
                modelAndView.addObject("msg",msg);
                modelAndView.setViewName("login");
            }else {
                HttpSession session = request.getSession();
                session.setAttribute("user",login);
                System.out.println(login.toString());
                modelAndView.setViewName("index");
            }
        }
        return modelAndView;
    }
    @RequestMapping("/logout")
    public ModelAndView logout(HttpServletRequest request,HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        mv.setViewName("login");
        return mv;
    }

    @RequestMapping("/info")
    public ModelAndView userInfo(HttpServletRequest request,HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        List<User> userList = loginService.userInfo();
        mv.addObject("userList",userList);
        mv.setViewName("userInfo");
        return mv;
    }
    @RequestMapping("/add")
    public ModelAndView addUser(User user ,HttpServletRequest request , HttpServletResponse response){
        ModelAndView modelAndView = new ModelAndView();
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("user");
        if(loginUser.getRole()==1){
            user.setRole(2);
        }
        int flag = loginService.addUser(user);
        if (flag == 0){
            List<User> userList = loginService.userInfo();
            modelAndView.addObject("userList",userList);
        }
        if(flag == 1){
            modelAndView.addObject("msg","身份信息已经存在！请重新输入");
        }
        if (flag == 2){
            modelAndView.addObject("msg","用户名已存在！");
        }
        modelAndView.setViewName("userInfo");
        return modelAndView;
    }
    @RequestMapping("/remove")
    public ModelAndView deteleUser(HttpServletRequest request,HttpServletResponse response){
        ModelAndView mv = new ModelAndView();
        String[] select = request.getParameterValues("select[]");
        for (int i = 0; i < select.length; i++) {
            System.out.println(select[i]);
            int v = loginService.deleteUser(select[i]);
            if (v == 0){
                mv.addObject("msg","删除失败，请重试");
                mv.setViewName("forward:info");
                return mv;
            }
        }
        mv.setViewName("forward:info");
        return mv;
    }
}
