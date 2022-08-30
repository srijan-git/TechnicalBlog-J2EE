<%-- Document : login Created on : 25-Aug-2022, 10:40:13 am Author : srijankumarkhan --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="com.tech.blog.model.Message" %>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <!------------css----------------->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
              integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css" />
    </head>

    <body>

        <!--navbar-->
        <%@include file="main_navbar.jsp" %>


        <main class="d-flex align-items-center primary-background text-dark banner-background" style="height: 80vh;">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-sm-4">
                        <div class="card">
                            <div class="card-header primary-background text-center text-white">
                                <span class="fa fa-user-circle-o fa-3x"></span>
                                <p class="mt-2">Login here</p>
                            </div>
                            <%
                            Message m=(Message)session.getAttribute("msg");
                            if(m!=null){
                            %>
                            <div class="alert <%= m.getCssClass()%>" role="alert">
                                <%= m.getContent()%>
                            </div>
                            <%
                                session.removeAttribute("msg");
                                }
                            %>


                            <div class="card-body">
                                <form action="LoginServlet" method="POST">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1"
                                               aria-describedby="emailHelp">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone
                                            else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="password" required type="password" class="form-control" id="exampleInputPassword1">
                                    </div>
                                    <div class="form-group form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                    </div>
                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary">Submit</button>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>







        <!--------JavaScript--------->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
        integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    </body>

</html>