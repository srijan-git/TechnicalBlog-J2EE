/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Srijan Kumar khan
 */
public class LikeDao
{

    Connection con;

    public LikeDao(Connection con)
    {
        this.con = con;
    }

    public boolean InsertLike(int pid, int uid)
    {
        boolean f = false;
        try
        {
            String query = "insert into liked(pid,uid) values(?,?)";

            PreparedStatement p = con.prepareCall(query);

            p.setInt(1, pid);
            p.setInt(2, uid);

            p.executeUpdate();
            f = true;

        } catch (Exception e)
        {
            e.printStackTrace();
        }

        return f;

    }

    public int countLikeOnPost(int pid)
    {
        int count = 0;
        try
        {
            String query = "select count(*) from liked where pid=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);

            pstmt.setInt(1, pid);

            ResultSet set = pstmt.executeQuery();

            if (set.next())
            {
                count = set.getInt("count(*)");
            }
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return count;
    }

    public boolean isLikedByUser(int pid, int uid)
    {
        boolean f = false;
        try
        {
            PreparedStatement p = this.con.prepareStatement("Select * from liked where pid=? and uid=?");

            p.setInt(1, pid);
            p.setInt(2, uid);
            ResultSet set = p.executeQuery();
            if (set.next())
            {
                f = true;
            }
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }

    public boolean deleteLike(int pid, int uid)
    {
        boolean f = false;
        try
        {
            PreparedStatement p = this.con.prepareStatement("Delete from liked where pid=? and uid=?");

            p.setInt(1, pid);
            p.setInt(2, uid);

            p.executeUpdate();
            f = true;
        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
}
