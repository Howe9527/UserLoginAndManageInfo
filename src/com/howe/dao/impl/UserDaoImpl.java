package com.howe.dao.impl;

import com.howe.dao.UserDao;
import com.howe.domain.Admin;
import com.howe.domain.User;
import com.howe.util.JDBCUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class UserDaoImpl implements UserDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDs());

    @Override
    public List<User> findAll() {

        String sql = "select * from user";
        List<User> users = template.query(sql, new BeanPropertyRowMapper<User>(User.class));

        return users;
    }

    @Override
    public Admin login(String adminName, String password) {

        try {
            String sql = "select * from admin where adminname = ? and password = ?";
            Admin admin = template.queryForObject(sql, new BeanPropertyRowMapper<Admin>(Admin.class), adminName, password);

            return admin;
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void add(User user) {
        String sql = "insert into user values(null,?,?,?,?,?,?)";
        template.update(sql,user.getName(),user.getGender(),user.getAge(),user.getAddress(),user.getQq(),user.getEmail());
    }

    @Override
    public void delUser(int id) {
        String sql = "delete from user where id = ?";
        template.update(sql,id);
    }

    @Override
    public User findUserById(int id) {
        String sql = "select * from user where id = ?";
        User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), id);
        return user;
    }

    @Override
    public void update(User user) {
        String sql = "update user set name=?, gender=?, age=?, qq=?, address=?, email=? where id=?";

        template.update(sql,user.getName(),user.getGender(),user.getAge(),user.getAddress(),user.getQq(),user.getEmail(),user.getId());
    }

    @Override
    public int findTotalCount(Map<String, String[]> condition) {
        String sql = "select count(*) from user where 1 = 1 ";
        StringBuilder sb = new StringBuilder(sql);
        Set<String> keySet = condition.keySet();
        //定义参数集合
        List<Object> params = new ArrayList<>();
        for (String key : keySet) {
            //排除分页条件参数
            if ("currentPage".equals(key) || "rows".equals(key)) continue;
            String value = condition.get(key)[0];
            if (value != null && !"".equals(value)){
                sb.append("and ").append(key).append(" like ? ");
                params.add("%"+value+"%");// ?条件的值
            }
        }
        System.out.println(sql);
        System.out.println(params);

        Integer total = template.queryForObject(sb.toString(), Integer.class,params.toArray());
        return total;
    }

    @Override
    public List<User> findByPage(int start, int rows, Map<String, String[]> condition) {
        String sql = "select * from user where 1 = 1 ";
        StringBuilder sb = new StringBuilder(sql);
        Set<String> keySet = condition.keySet();
        //定义参数集合
        List<Object> params = new ArrayList<>();
        for (String key : keySet) {
            //排除分页条件参数
            if ("currentPage".equals(key)) continue;
            String value = condition.get(key)[0];
            if (value != null && !"".equals(value)){
                sb.append("and "+key+" like ? ");
                params.add("%"+value+"%");// ?条件的值
            }
        }
        //添加分页查询
        sb.append(" limit ? , ?");
        //添加分页查询参数值
        params.add(start);
        params.add(rows);
        sql = sb.toString();

        List<User> list = template.query(sql, new BeanPropertyRowMapper<User>(User.class),params.toArray());

        return list;
    }
}
