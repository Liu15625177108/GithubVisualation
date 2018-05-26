package com.example.dao.impl;

import com.example.dao.languageDAO;
import com.example.model.language;
import com.example.model.languageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;

@Repository("LanguageDAO")
public class languageDaoImpl implements languageDAO {
    @Autowired
    private JdbcTemplate template;
    public languageDaoImpl(){
    }

    public languageDaoImpl(JdbcTemplate template) throws SQLException {
        this.template = template;
    }

    @Override
    public language findByType(String type) {
        String sql = "SELECT * FROM language WHERE type=?";
        return this.template.queryForObject(sql, new Object[]{type}, new languageMapper());

    }

    @Override
    public List<language> findAll() {
        String sql = "SELECT * FROM language";
        return this.template.query(sql, new Object[]{}, new languageMapper());
    }

    @Override
    public List<language> sortByRep(){
        String sql = "SELECT * FROM language ORDER BY repositories DESC";
        return this.template.query(sql, new Object[]{}, new languageMapper());
    }
}
