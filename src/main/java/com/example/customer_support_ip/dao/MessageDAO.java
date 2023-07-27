package com.example.customer_support_ip.dao;
import com.example.customer_support_ip.beans.MessageBean;
import com.example.customer_support_ip.util.ConnectionPool;
import com.example.customer_support_ip.util.DAOUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;



public class MessageDAO {

    private static ConnectionPool connectionPool = ConnectionPool.getConnectionPool();
    private static final String SQL_SELECT_ALL = "SELECT p.id, p.sadrzaj, p.procitana, k.email FROM webshop_ip.poruka p INNER JOIN korisnik k ON p.korisnik_id = k.id;";
    private static final String SQL_SELECT_BY_ID = "SELECT m.id, sadrzaj, procitana, email FROM webshop_ip.poruka m INNER JOIN korisnik u WHERE m.korisnik_id=u.id AND m.id=?;";
    private static final String SQL_UPDATE_STATUS = "UPDATE poruka m SET procitana=? WHERE m.id=?;";

    public MessageDAO() {

    }

    public static List<MessageBean> getAll() {
        List<MessageBean> messages = new ArrayList<>();

        Connection c = null;
        ResultSet rs = null;
        PreparedStatement ps = null;

        try {
            c = connectionPool.checkOut();
            ps = DAOUtil.prepareStatement(c, SQL_SELECT_ALL, false);
            rs = ps.executeQuery();

            while (rs.next()) {
                messages.add(new MessageBean(rs.getInt("id"), rs.getString("sadrzaj"), rs.getBoolean("procitana"), rs.getString("email")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connectionPool.checkIn(c);
        }

        Collections.sort(messages, (m1, m2) -> Boolean.compare(!m2.isProcitana(), !m1.isProcitana()));

        return messages;
    }


    public static MessageBean getById(int id) {
        List<MessageBean> messages = new ArrayList<>();

        Connection c = null;
        ResultSet rs = null;
        PreparedStatement ps = null;

        try {
            c = connectionPool.checkOut();
            ps =DAOUtil.prepareStatement(c, SQL_SELECT_BY_ID, false);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                messages.add(new MessageBean(rs.getInt("id"), rs.getString("sadrzaj"), rs.getBoolean("procitana"), rs.getString("email")));
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connectionPool.checkIn(c);
        }
        return messages.get(0);
    }


    public static void markMessageAsRead(int id) {
        Connection c = null;
        PreparedStatement ps = null;

        try {
            c = connectionPool.checkOut();
            ps = DAOUtil.prepareStatement(c, SQL_UPDATE_STATUS, false);
            ps.setBoolean(1, true);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            connectionPool.checkIn(c);
        }

    }

}