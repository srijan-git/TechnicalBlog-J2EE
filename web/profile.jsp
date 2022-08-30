<%-- Document : profile Created on : 26-Aug-2022, 10:07:49 am Author : srijankumarkhan --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page errorPage="error.jsp" %>
<%@page import="com.tech.blog.model.User" %>
<%@page import="com.tech.blog.model.Message" %>
<%@page import="com.tech.blog.model.Category" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.helper.*" %>
<%@page import="java.util.ArrayList" %>


<% User user=(User)session.getAttribute("currentUser"); if(user==null) { response.sendRedirect("login.jsp"); } %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <!------------css----------------->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
              integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
              crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css" />
    </head>

    <body>
        <!------------navbar------------------>

        <nav class="navbar navbar-expand-lg navbar-dark text-light primary-background ">
            <a class="navbar-brand" href="index.jsp"><span><i class="fa fa-asterisk fa-spin"
                                                              aria-hidden="true"></i>
                </span> Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact us </a>

                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span
                                class="fa fa-plus"></span> Do Posts</a>

                    </li>
                </ul>
                <ul class="navbar navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal"><span
                                class="fa fa-user-circle "></span>&nbsp;<%=user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span> Logout</a>
                    </li>
                </ul>

            </div>
        </nav>
        <!------------end navbar------------------>

        <% Message m=(Message)session.getAttribute("msg"); if(m!=null){ %>
        <div class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div>
        <% session.removeAttribute("msg"); } %>


        <!-- Main body of the page -->
        <main>
            <div class="container">
                <div class="row mt-4">
                    <!-- 1st col -->
                    <div class="col-md-4">
                        <!-- Categories -->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0, this)"
                               class="c-link list-group-item list-group-item-action active primary-background"
                               aria-current="true">
                                All Posts
                            </a>

                            <% 
                                PostDao p=new PostDao(connectionProvider.getConnection());
                                ArrayList<Category> catList=p.getAllCategories();

                                for(Category c:catList)
                                {
                            %>

                            <a href="#" onclick="getPosts(<%= c.getCid()%>, this)" class="c-link list-group-item list-group-item-action">
                                <%=c.getName() %>
                            </a>
                            <% } %>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <!-- Posts -->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-4">Loading...</h3>
                        </div>

                        <div class="container-fluid" id="post-container">

                        </div>

                    </div>
                </div>
            </div>
        </main>
        <!--End Main body of the page -->

        <!-- Profile Modal -->
        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel">
                            TechBlog
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="images/<%=user.getProfile()%>" class="img-fluid" width="200"
                                 height="200">
                            <h5 class="modal-title" id="exampleModalLabel">
                                <%=user.getName()%>
                            </h5>
                            <div id="profile-details">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="row">ID :</th>
                                            <td>
                                                <%=user.getId()%>
                                            </td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email :</th>
                                            <td>
                                                <%=user.getEmail()%>
                                            </td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td>
                                                <%=user.getGender()%>
                                            </td>

                                        </tr>
                                        <tr>
                                            <th scope="row">About :</th>
                                            <td>
                                                <%=user.getAbout()%>
                                            </td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered Date :</th>
                                            <td>
                                                <%=user.getDateTime().toString()%>
                                            </td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>


                            <div id="profile-edit" style="display: none;">
                                <h3 class="mt-2">Please Edit Carefully</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <th scope="row">ID :</th>
                                                <td>
                                                    <%=user.getId()%>
                                                </td>

                                            </tr>
                                            <tr>
                                                <th scope="row">Name :</th>
                                                <td>
                                                    <input type="text" class="form-control"
                                                           name="user_name" value="<%=user.getName()%>">

                                                </td>

                                            </tr>
                                            <tr>
                                                <th scope="row">Email :</th>
                                                <td>
                                                    <input type="email" class="form-control"
                                                           name="user_email" value="<%=user.getEmail()%>">

                                                </td>

                                            </tr>
                                            <tr>
                                                <th scope="row">Password :</th>
                                                <td>
                                                    <input type="password" class="form-control"
                                                           name="user_password"
                                                           value="<%=user.getPassword()%>">

                                                </td>

                                            </tr>
                                            <tr>
                                                <th scope="row">Gender :</th>
                                                <td>
                                                    <input disabled type="text" class="form-control"
                                                           name="user_gender" value="<%=user.getGender()%>">

                                                </td>

                                            </tr>

                                            <tr>
                                                <th scope="row">About :</th>
                                                <td>
                                                    <textarea class="form-control" name="user_about"
                                                              rows="3"><%=user.getAbout()%></textarea>
                                                </td>

                                            </tr>
                                            <tr>
                                                <th scope="row">Update Image:</th>
                                                <td>

                                                    <input type="file" name="image" class="form-control">
                                                </td>

                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="container">
                                        <button class="btn btn-outline-success">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary"
                                data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary"
                                id="edit-profile-button">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Profile Modal -->


        <!--Add post modal-->
        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Feel free to add posts....</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="AddPostServlet" method="post" id="add-post-form">

                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>

                                    <% PostDao postd=new PostDao(connectionProvider.getConnection());
                                        ArrayList<Category> list=postd.getAllCategories();

                                        for(Category c:list)
                                        {
                                    %>
                                    <option value="<%= c.getCid()%>">
                                        <%= c.getName() %>
                                    </option>
                                    <% } %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter your post"
                                       class="form-control">
                            </div>


                            <div class="form-group">
                                <textarea name="pContent" type="text" placeholder="Enter your content"
                                          style="height: 200px;" class="form-control"></textarea>
                            </div>

                            <div class="form-group">
                                <textarea name="pCode" type="text"
                                          placeholder="Enter your pogramme(if any)" style="height: 200px;"
                                          class="form-control"></textarea>
                            </div>

                            <div class="form-group">
                                <label for="">Select your photo</label>
                                <br>
                                <input type="file" class="form-control" name="pic">
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-success">Post</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--end Add post modal-->


        <!--------JavaScript--------->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
                integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="Js/myJs.js"></script>
        <script>
                                $(document).ready(function () {
                                    let editStatus = false;
                                    $("#edit-profile-button").click(function () {
                                        if (editStatus == false) {
                                            $("#profile-details").hide();
                                            $("#profile-edit").show();
                                            editStatus = true;
                                            $(this).text("Back");
                                        } else {
                                            $("#profile-details").show();
                                            $("#profile-edit").hide();
                                            editStatus = false;
                                            $(this).text("Edit");

                                        }

                                    });
                                });
        </script>


        <script>
            $(document).ready(function () {
                $("#add-post-form").on("submit", function (event) {
                    event.preventDefault();
                    console.log("You have clicked on something");

                    let form = new FormData(this);

                    $.ajax({
                        url: "AddPostServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            if (data.trim() == "done") {
                                swal("Good job!", "Saved successfully", "success");

                            } else {
                                swal("Error!", "Something went wrong..", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Error!", "Something went wrong", "error");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>

        <script>

            function getPosts(catId, temp) {
                $('#loader').show();
                $('#post-container').hide();
                $('.c-link').removeClass('active');
                $('.c-link').removeClass("primary-background");
                $.ajax({
                    url: "load_posts.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        $('#loader').hide();
                        $('#post-container').show();
                        $('#post-container').html(data);
                        $(temp).addClass('active');
                        $(temp).addClass("primary-background");
                    }
                })
            }
            $(document).ready(function () {
                let allPostsRef = $('.c-link')[0];
                getPosts(0, allPostsRef);
            })
        </script>
    </body>

</html>