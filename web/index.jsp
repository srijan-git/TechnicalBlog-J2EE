<%-- Document : index Created on : 24-Aug-2022, 9:14:27 pm Author : srijankumarkhan --%>

    <%--<%@page import="com.tech.blog.helper.connectionProvider" %>--%>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <%@page import="java.sql.*" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <title>Tech Blog</title>


                    <!------------css----------------->
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
                        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                    <link href="css/style.css" rel="stylesheet" type="text/css" />
                </head>

                <body>

                    <!--navbar-->
                    <%@include file="main_navbar.jsp" %>


                        <!-- banner -->
                        <div class="container-fluid m-0 p-0 banner-background text-white">
                            <div class="jumbotron primary-background">
                                <div class="container">
                                    <h3 class="display-3">Welcome to TechBlog</h3>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Laboriosam debitis quaerat aliquam iure, explicabo nam
                                        quo quae repudiandae nisi excepturi autem deserunt amet praesentium. Ab impedit dolorum corporis nihil beatae.
                                    </p>
                                    <button class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span> Start ! its free</button>
                                    <a href="login.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle-o"></span> Login</a>
                                </div>
                            </div>
                        </div>


                        <!-- cards -->
                        <div class="container">
                            <!-- 1strow -->
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">Java Programming</h5>
                                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
                                                content.</p>
                                            <a href="#" class="btn primary-background">Read More</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
                                                content.</p>
                                            <a href="#" class="btn primary-background">Read More</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
                                                content.</p>
                                            <a href="#" class="btn primary-background">Read More</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 2ndrow -->
                            <div class="row mt-3">
                                <div class="col-md-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">Java Programming</h5>
                                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
                                                content.</p>
                                            <a href="#" class="btn primary-background">Read More</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
                                                content.</p>
                                            <a href="#" class="btn primary-background">Read More</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">Card title</h5>
                                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
                                                content.</p>
                                            <a href="#" class="btn primary-background">Read More</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <!--------JavaScript--------->
                        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
                            crossorigin="anonymous"></script>
                        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                            integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
                            integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
                </body>

                </html>