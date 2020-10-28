package com.jinggege.service;

import com.jinggege.domain.User;

import java.util.List;

public interface LoginService {
    public User login(User user);
    public List<User> userInfo();
    public int addUser(User addUser);
    public int deleteUser(String username);
}
