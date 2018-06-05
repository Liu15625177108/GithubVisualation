package com.example.model;

import org.springframework.jdbc.core.RowMapper;
import java.sql.ResultSet;
import java.sql.SQLException;

public class areaMapper implements RowMapper<area> {
    @Override
    public area mapRow(ResultSet rs, int i) throws SQLException{
        area Area = new area();
        Area.setLocation(rs.getString("location"));
        Area.setUsernum(rs.getInt("usernum"));
        Area.setChinaName(rs.getString("ChinaName"));
        return Area;
    }
}