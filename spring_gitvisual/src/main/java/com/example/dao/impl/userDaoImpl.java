package com.example.dao.impl;

import com.example.dao.userDAO;
import com.example.model.user;
import com.example.model.userMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;


@Repository("userDAO")
public class userDaoImpl implements userDAO {
    @Autowired
    private JdbcTemplate template;

    public userDaoImpl() {
    }
    public userDaoImpl(JdbcTemplate template) throws SQLException {
        this.template = template;
    }
    @Override
    public List<user> findByLanguage(String language) {
        String sql = "SELECT * FROM user WHERE language=? order by followers DESC limit 1,6";
        return this.template.query(sql, new Object[]{language}, new userMapper());
    }

    @Override
    public List<user> findAll() {
        String sql = "SELECT * FROM user";
        return this.template.query(sql,new Object[]{},new userMapper());
    }

    @Override
    public List<user> sortByStar() {
       String sql="select *from user order by followers DESC limit 1,30";
       return this.template.query(sql,new Object[]{},new userMapper());
    }
}
