package com.jinggege.service.Impl;

import com.jinggege.dao.RegisterAndLogin;
import com.jinggege.domain.User;
import com.jinggege.service.LoginService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.security.PublicKey;
import java.util.List;

@Service
public class LoginServiceImpl implements LoginService {
    @Resource
    private RegisterAndLogin registerAndLogin;
    @Override
    public User login(User user) {
        User queryUser = new User();
        queryUser = registerAndLogin.selectUserByUsername(user.getUsername());
        if (queryUser != null && queryUser.getPassword().equals(user.getPassword())){
            return queryUser;
        }
        return null;
    }
    @Override
    public List<User> userInfo(){
        List<User> userInfo = registerAndLogin.selectAll();
        return userInfo;
    }

    @Override
    public int addUser(User addUser) {
        int flag = 0 ;
        User userByIdentity = registerAndLogin.selectUserByIdentity(addUser.getIdentity_id());
        User selectUserByUsername = registerAndLogin.selectUserByUsername(addUser.getUsername());
        if (userByIdentity == null){
            if (selectUserByUsername == null){
                int i = registerAndLogin.addUser(addUser);
                if (i == 1){
                    flag = 0;
                }
            }else {
                flag = 2;
            }

        }else {
            flag = 1;
        }

        return flag;
    }

    @Override
    public int deleteUser(String username) {
        int i = 0;
        i = registerAndLogin.deleteUser(username);
        System.out.println(i);
        return i;
    }

}
