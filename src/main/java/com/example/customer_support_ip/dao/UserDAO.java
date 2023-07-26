package com.example.customer_support_ip.dao;



import com.example.customer_support_ip.beans.UserBean;
import com.example.customer_support_ip.util.ConnectionPool;
import com.example.customer_support_ip.util.DAOUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class UserDAO {
    private static final ConnectionPool connectionPool = ConnectionPool.getConnectionPool();
    private static final String SELECT_USER_BY_USERNAME = "SELECT * FROM korisnik WHERE status=1 and korisnicko_ime=?;";


    private UserDAO() {
    }

    public static UserBean getUserByUsername(String username) {
        UserBean user=null;
        Connection c=null;
        ResultSet rs=null;
        System.out.println("connectionPool1: " + c);

        try {
            System.out.println("connectionPool2: " + c);

            c = connectionPool.checkOut();
            System.out.println("connectionPool: " + c);


            PreparedStatement ps = DAOUtil.prepareStatement(c, SELECT_USER_BY_USERNAME, false);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                user = new UserBean(rs.getInt("id"), rs.getString("ime"), rs.getString("prezime"), rs.getString("korisnicko_ime"), rs.getString("lozinka"));
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connectionPool.checkIn(c);
        }
        return user;
    }

}