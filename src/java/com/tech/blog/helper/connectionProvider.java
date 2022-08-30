package com.tech.blog.helper;

import java.sql.*;

public class connectionProvider
{

    private static Connection con;
    private static final String DBurl = "jdbc:mysql://localhost:3306/technicalblog";
    private static final String DBusername = "root";
    private static final String DBpassword = "Ss12345#";

    
    public static Connection getConnection()
    {
        try
        {
            if (con == null)
            {
                //Driver class load
                Class.forName("com.mysql.cj.jdbc.Driver");

                //Create a connection.....
                con = DriverManager.getConnection(DBurl, DBusername, DBpassword);
            }

        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
}
