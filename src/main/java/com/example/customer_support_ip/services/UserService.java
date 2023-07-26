package com.example.customer_support_ip.services;

import java.io.Serializable;


import com.example.customer_support_ip.beans.UserBean;
import com.example.customer_support_ip.dao.UserDAO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


public class UserService implements Serializable {


	public UserService() {
		// TODO Auto-generated constructor stub
	}

    public UserBean getUser(String username, String password)
    {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

        UserBean userBean= UserDAO.getUserByUsername(username);

        return userBean != null && bCryptPasswordEncoder.matches(password, userBean.getLozinka()) ? userBean : null;
    }

}
