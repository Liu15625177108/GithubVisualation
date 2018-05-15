package com.example.model;

import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class languageMapper implements RowMapper<language> {
    @Override
    public language mapRow(ResultSet rs, int i) throws SQLException{
        language lan = new language();
        lan.setType(rs.getString("type"));
        lan.setUsers(rs.getInt("users"));
        lan.setRepositories(rs.getInt("repositories"));
        return lan;
    }
}
