package com.example.dao.impl;

import com.example.dao.areaDAO;
import com.example.model.area;
import com.example.model.areaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;

@Repository("areaDAO")
public class areaDaoImpl implements areaDAO{
    @Autowired
    private JdbcTemplate template;

    public areaDaoImpl(){
    }

    public areaDaoImpl(JdbcTemplate template) throws SQLException {
        this.template = template;
    }
    @Override
    public List<area> findAll() {
        String sql = "SELECT * FROM location";
        return this.template.query(sql, new Object[]{}, new areaMapper());
    }

    @Override
    public List <area> sortByUsernums(){
        String sql = "SELECT * FROM location ORDER BY usernum DESC";
        return this.template.query(sql, new Object[]{}, new areaMapper());
    }
}
