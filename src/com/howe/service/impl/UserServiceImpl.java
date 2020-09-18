package com.howe.service.impl;

import com.howe.dao.UserDao;
import com.howe.dao.impl.UserDaoImpl;
import com.howe.domain.Admin;
import com.howe.domain.PageBean;
import com.howe.domain.User;
import com.howe.service.UserService;

import java.util.List;
import java.util.Map;

public class UserServiceImpl implements UserService {
    private UserDao dao = new UserDaoImpl();

    @Override
    public Admin login(Admin admin) {
        return dao.login(admin.getAdminName(),admin.getPassword());
    }

    @Override
    public List<User> findAll() {
        return dao.findAll();
    }

    @Override
    public void addUser(User user) {
        dao.add(user);
    }

    @Override
    public void delUser(String id) {
        dao.delUser(Integer.parseInt(id));
    }

    @Override
    public User findUserById(String id) {
        return dao.findUserById(Integer.parseInt(id));
    }

    @Override
    public void updateUser(User user) {
        dao.update(user);
    }

    /*
    批量删除
     */
    @Override
    public void delSelected(String[] uids) {
        if (uids != null && uids.length != 0){

            for (String uid : uids) {
                dao.delUser(Integer.parseInt(uid));
            }
        }
    }

    @Override
    public PageBean<User> findUserByPage(String _currentPage, String _rows, Map<String, String[]> condition) {
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        //总记录数
        int totalCount = dao.findTotalCount(condition);
        //开始的索引记录
        int start = (currentPage - 1) * rows;
        //总页码
        int totalPage = totalCount % rows == 0 ? totalCount / rows : totalCount / rows + 1;

        List<User> list = dao.findByPage(start,rows,condition);

        PageBean<User> pb = new PageBean<User>();

        pb.setRows(rows);

        pb.setTotalCount(totalCount);

        pb.setPageList(list);

        pb.setTotalPage(totalPage);

        if (currentPage <= 0){
            currentPage = 1;
        }else if (currentPage > totalPage){
            currentPage = totalPage;
        }
        pb.setCurrentPage(currentPage);

        return pb;

    }
}
