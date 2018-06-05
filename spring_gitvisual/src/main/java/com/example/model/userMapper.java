package com.example.model;

import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;
public class userMapper implements RowMapper<user> {
    @Override

    public user mapRow(ResultSet rs, int i) throws SQLException{
        user User = new user();
        User.setId(rs.getInt("id"));
        User.setName(rs.getString("name"));
        User.setFollowers(rs.getInt("followers"));
        User.setUrl(rs.getString("url"));
        User.setLanguage(rs.getString("language"));
        return User;
    }
}
