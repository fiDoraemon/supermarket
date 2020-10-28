package com.jinggege.dao;

import com.jinggege.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RegisterAndLogin {
    public int addUser(User user);
    public User selectUserByIdentity(String identity);
    public int updateUser(User user);
    public User selectUserByUsername(/*@Param("username")*/ String username);
    public List<User> selectAll();
    public int deleteUser(String username);


}
