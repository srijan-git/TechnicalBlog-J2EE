/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.helper.Helper;
import com.tech.blog.helper.connectionProvider;
import com.tech.blog.model.Message;
import com.tech.blog.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import java.io.File;

/**
 *
 * @author Srijan Kumar Khan
 */
@MultipartConfig
public class EditServlet extends HttpServlet
{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter())
        {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

            //Fetch all data
            String userName = request.getParameter("user_name");
            String userEmail = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");
            String userAbout = request.getParameter("user_about");
            Part part = request.getPart("image");
            String imageName = part.getSubmittedFileName();

            //Get the user from the session
            HttpSession s = request.getSession();

            User user = (User) s.getAttribute("currentUser");
            user.setName(userName);
            user.setEmail(userEmail);
            user.setPassword(userPassword);
            user.setAbout(userAbout);
            String oldImageFile = user.getProfile();
            user.setProfile(imageName);

            //update database....
            UserDao dao = new UserDao(connectionProvider.getConnection());

            boolean ans = dao.updateUser(user);
            if (ans)
            {

                String path = request.getRealPath("/") + "images" + File.separator + user.getProfile();
                String oldPath = request.getRealPath("/") + "images" + File.separator + oldImageFile;
                
                if(!oldImageFile.equals("default.png")){
                    Helper.deleteFile(oldPath);
                }
                
                if (Helper.saveFile(part.getInputStream(), path))
                {
                    out.println("Profile updated...");
                    Message message = new Message("Profile details updated....", "success", "alert-success");
                    s.setAttribute("msg", message);
                } else
                {
                    out.println("Profile not updated successfully........");
                    Message message = new Message("Something went wrong....", "error", "alert-danger");
                    s.setAttribute("msg", message);

                }
            } else
            {
                out.println("not updated...");
                Message message = new Message("Something went wrong....", "error", "alert-danger");
                s.setAttribute("msg", message);
            }

            response.sendRedirect("profile.jsp");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo()
    {
        return "Short description";
    }// </editor-fold>

}
