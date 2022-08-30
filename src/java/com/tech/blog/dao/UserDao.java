/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.model.User;
import java.sql.*;

/**
 *
 * @author Srijan Kumar khan
 */
public class UserDao
{

    private Connection con;

    public UserDao(Connection con)
    {
        this.con = con;
    }

    //Method to insert into database
    public boolean save_user(User user)
    {
        boolean f = false;

        try
        {
            // user ---> Database
            String insert_users = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(insert_users);

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            //Saving data to the data base
            pstmt.executeUpdate();

            f = true;
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }

    //Get user by Email and password
    public User getUserByEmailAndPassword(String email, String password)
    {
        User user = null;
        try
        {
            String query = "Select * from user where email=? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next())
            {
                user = new User();

//                  data from db
                String name = set.getString("name");
//             set to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("reg_date"));
                user.setProfile(set.getString("profile"));

            }
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return user;

    }

    public boolean updateUser(User user)
    {
        boolean f = false;
        try
        {
            String query = "update user set name=?,email=?,password=?,gender=?,about=?,profile=? where id=?";

            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            pstmt.setString(6, user.getProfile());
            pstmt.setInt(7, user.getId());

            pstmt.executeUpdate();
            f = true;

        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }

    public User getUserByUserId(int userId)
    {

        User user = null;

        String query = "select * from user where id=?";
        try
        {
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, userId);

            ResultSet set = pstmt.executeQuery();

            if (set.next())
            {

                user = new User();

//                  data from db
                String name = set.getString("name");
//             set to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("reg_date"));
                user.setProfile(set.getString("profile"));

            }
        } catch (Exception e)
        {
            e.printStackTrace();
        }

        return user;

    }

}
