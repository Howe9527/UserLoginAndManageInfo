package com.howe.service;

import com.howe.domain.Admin;
import com.howe.domain.PageBean;
import com.howe.domain.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    Admin login(Admin admin);

    List<User> findAll();

    void addUser(User user);

    void delUser(String id);

    User findUserById(String id);

    void updateUser(User user);

    void delSelected(String[] uids);

    PageBean<User> findUserByPage(String currentPage, String rows, Map<String, String[]> condition);
}
