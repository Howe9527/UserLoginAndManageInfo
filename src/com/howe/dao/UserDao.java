package com.howe.dao;

import com.howe.domain.Admin;
import com.howe.domain.User;

import java.util.List;
import java.util.Map;

public interface UserDao {

    public List<User> findAll();


    public Admin login(String adminName,String password);

    void add(User user);

    void delUser(int id);

    User findUserById(int id);

    void update(User user);

    int findTotalCount(Map<String, String[]> condition);

    //分页查询每页记录
    List<User> findByPage(int start, int rows, Map<String, String[]> condition);
}
