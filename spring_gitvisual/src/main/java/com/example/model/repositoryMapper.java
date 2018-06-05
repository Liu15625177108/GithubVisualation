package com.example.model;

import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class repositoryMapper implements RowMapper<repository> {
    @Override
    public repository mapRow(ResultSet rs, int i) throws SQLException{
        repository rep = new repository();
        rep.setId(rs.getInt("id"));
        rep.setName(rs.getString("name"));
        rep.setStar(rs.getInt("star"));
        rep.setFork(rs.getInt("fork"));
        rep.setUrl(rs.getString("url"));
        rep.setLanguage(rs.getString("language"));
        return rep;
    }
}
