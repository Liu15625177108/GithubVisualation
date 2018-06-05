package com.example.dao.impl;

import com.example.dao.repositoryDAO;
import com.example.model.repository;
import com.example.model.repositoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;
@Repository("repositoryDAO")
public class repositoryDaoImpl implements repositoryDAO {
    @Autowired
    private JdbcTemplate template;
    public repositoryDaoImpl(){
    }

    public repositoryDaoImpl(JdbcTemplate template) throws SQLException {
        this.template = template;
    }
    @Override
    public List<repository> findByLanguage(String language) {
        String sql = "SELECT * FROM repository WHERE language=? order by star DESC limit 1,6";
        return this.template.query(sql, new Object[]{language}, new repositoryMapper());
    }

    @Override
    public List<repository> findAll() {
        String sql = "SELECT * FROM repository";
        return this.template.query(sql, new Object[]{}, new repositoryMapper());

    }

    @Override
    public List<repository> sortByStar() {
        String sql = "select * from repository order by star DESC limit 1,30;";
        return this.template.query(sql, new Object[]{}, new repositoryMapper());
    }
}
