<%-- 
    Document   : detail
    Created on : Mar 3, 2021, 10:52:19 PM
    Author     : Minh Hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> oke</title>
        <style type="text/css">
            .img{
                text-align: center;
                border: 1px solid green;
                padding: 5px;
                margin: 50px auto; 
                height: 300px;
                width: 250px;

            }
        </style>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h3><a href="home">Home</a></h3> &emsp;
        <c:if test="${sessionScope.acc.isAdmin == 1}">
            <a href="ManagerProduct.jsp">Manager Product</a>
        </c:if>
        <c:if test="${sessionScope.acc.isSell == 1}">
        </c:if>
        <c:if test="${sessionScope.acc != null}">
            <a href="#">Hello ${sessionScope.acc.userName}</a>
            <a href="logout"> Logout </a> &emsp;
        </c:if>
        <c:if test="${sessionScope.acc == null}">
            <a href="Login.jsp"> Login </a> &emsp;
        </c:if> <br>
        <div class="card bg-light mb-3">
            <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
            <ul class="list-group category_block">
                <c:forEach items="${ListC}" var="o">
                    <li class="list-group-item text-white"><a href="category?cid=${o.categoryid}">${o.categoryName}</a></li>
                    </c:forEach>
                <div class="img">
                    <img
                        src="image/${detail.imageUrl}" width="120" height="120">               
                
                
                    <h3> ${detail.nameProduct} </h3><br> 
                    Price: ${detail.price} <br>
                    <dt> Quantity: </dt>
                                                    <dd>
                                                        <select class="form-control form-control-sm" style="width:70px;">
                                                            <option> 1 </option>
                                                            <option> 2 </option>
                                                            <option> 3 </option>
                                                        </select>
                                                    </dd>
                
               
                <a href="CartControl?action=buy&id=${detail.idProduct}">  Add to cart </a>
                </div>
            </ul>
        </div>

    </body>
</html>
