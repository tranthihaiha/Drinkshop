<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="home">Drinks Shop</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto">
                        <c:if test="${sessionScope.acc == null}">
                            <a href="Login.jsp"> Login </a> &emsp;
                        </c:if>
                        <c:if test="${sessionScope.acc != null}">
                            Hello ${sessionScope.acc.userName}&emsp;
                            <a href="logout"> Logout </a> 
                            <a class="btn btn-success btn-sm ml-3" href="CartControl">
                                <i class="fa fa-shopping-cart"></i> Cart
                                <span class="badge badge-light">3</span>
                            </a>
                        </c:if>

                    </ul>

                    <form action="search" method="post" class="form-inline my-2 my-lg-0">
                        <div class="input-group input-group-sm">
                            <input value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary btn-number">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>

                    </form><br>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                        <ul class="list-group category_block">
                            <c:forEach items="${ListC}" var="o">
                                <li class="list-group-item text-white"><a href="category?cid=${o.categoryid}">${o.categoryName}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-9">
                    <div id="content" class="row">
                        <c:forEach items="${listP}" var="o">
                            <div class="product col-12 col-md-6 col-lg-4">
                                <div class="card">
                                    <img class="card-img-top" src="image/${o.imageUrl}" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title show_txt"><a href="detail?pid=${o.idProduct}" title="View Product">${o.nameProduct}</a></h4>
                                        <p class="card-text show_txt">${o.nameProduct}</p>
                                        <div class="row">
                                            <div class="col">
                                                <p class="btn btn-danger btn-block">${o.price} $</p>
                                            </div>
                                            <c:if test="${sessionScope.acc == null}">
                                                <div class="col">
                                                    <a href="#"  onclick="myFunction()" class="btn btn-success btn-block">  Add to cart</a>

                                                </div>
                                            </c:if>
                                            <c:if test="${sessionScope.acc != null}">
                                                <div class="col">
                                                    <a href="CartControl?action=buy&id=${o.idProduct}" class="btn btn-success btn-block">Add to cart</a>
                                                </div>
                                            </c:if>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                </div>

            </div>
        </div>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
                                                        function loadMore() {
                                                            var amount = document.getElementsByClassName("product").length;
                                                            $.ajax({
                                                                url: "/Project_banhang/load",
                                                                type: "get", //send it through get method
                                                                data: {
                                                                    exits: amount
                                                                },
                                                                success: function (data) {
                                                                    var row = document.getElementById("content");
                                                                    row.innerHTML += data;
                                                                },
                                                                error: function (xhr) {
                                                                    //Do Something to handle error
                                                                }
                                                            });
                                                        }
                                                        function searchByName(param) {
                                                            var txtSearch = param.value;
                                                            $.ajax({
                                                                url: "/Project_banhang/searchAjax",
                                                                type: "get", //send it through get method
                                                                data: {
                                                                    txt: txtSearch
                                                                },
                                                                success: function (data) {
                                                                    var row = document.getElementById("content");
                                                                    row.innerHTML = data;
                                                                },
                                                                error: function (xhr) {
                                                                    //Do Something to handle error
                                                                }
                                                            });
                                                        }
                                                        function myFunction() {
                                                            alert("You must be logged in to use this feature!");
                                                        }
        </script>  
    </body>
</html>

