package com.demo.service;

import com.demo.dao.UserDao;
import com.demo.pojo.User;

public class UserService {
    private UserDao userDao;

    /**
     * 根据用户名和密码获取登录的用户
     * @param username
     * @param password
     * @return
     */
    public User getLoginUser(String username,String password){
        userDao=new UserDao();
        return userDao.findUserByUsernameAndPwd(username,password);
    }

    /**
     * 用户注册：当找不到对应的用户名时，即可注册
     * @param user
     * @return
     */
    public boolean register(User user){
        userDao=new UserDao();
        //找不到对应的username，则可以注册
        if(userDao.findUserByUsername(user.getUsername())==null){
            userDao.addUser(user);
            return true;
        }else {
            return false;
        }
    }

    /**
     * 根据用户名获取用户
     * @param username
     * @return
     */
    public User findUserByUsername(String username){
        userDao=new UserDao();
        return userDao.findUserByUsername(username);
    }
}
