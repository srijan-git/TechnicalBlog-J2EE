<%-- Document : register Created on : 25-Aug-2022, 11:07:32 am Author : srijankumarkhan --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <!------------css----------------->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
              integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css" />
    </head>

    <body>
        <!--navbar-->
        <%@include file="main_navbar.jsp" %>

        <main class="primary-background text-dark banner-background">
            <div class="container">
                <div class="col-md-6 offset-md-3 pt-3 pb-5">
                    <div class="card">
                        <div class="card-header primary-background text-center text-white">
                            <span class="fa fa-user-circle fa-3x"></span>
                            <br>
                            Register here
                        </div>
                        <div class="card-body">
                            <form action="RegisterServlet" method="POST" id="reg-Form">
                                <div class="form-group">
                                    <label for="user_name">Username</label>
                                    <input type="text" class="form-control" id="user_name" name="user_name" aria-describedby="emailHelp"
                                           placeholder="Enter name">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" name="user_email"
                                           aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control" placeholder="Enter password" id="exampleInputPassword1"
                                           name="user_password">
                                </div>

                                <div class=" form-group">
                                    <label for="gender">Select Gender</label>
                                    <br>
                                    <input type="radio" id="gender" name="user_gender" value="Male">Male
                                    <input type="radio" id="gender" name="user_gender" value="Female">Female
                                </div>

                                <div class="form-group">
                                    <textarea class="form-control" rows="5" placeholder="Enter something about yourself"
                                              name="user_about"></textarea>
                                </div>
                                <div class="form-group form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms and condition</label>
                                </div>
                                <br>
                                <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-2x"></span>
                                    <br>
                                    <h4>Please wait...</h4>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                            </form>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <script>

            $(document).ready(function () {
                $("#reg-Form").on('submit', function (event) {
                    event.preventDefault();
                    $("#loader").show();
                    $("#submit-btn").hide();
                    let form = new FormData(this);

                    //Send register Servlet

                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            $("#loader").hide();
                            $("#submit-btn").show();
                            if (data.trim() === 'Done') {
                                swal({
                                    title: "Registered Successfully...We are going to redirect to login page",
                                    icon: "success"
                                }).then(() => {
                                    window.location = "login.jsp";
                                });
                            } else {
                                swal({
                                    title: data,
                                    icon: "error"
                                }).then(() => {
                                    window.location.reload();
                                });
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                            $("#loader").show();
                            $("#submit-btn").hide();
                            swal("Something went wrong....");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
    </body>

</html>