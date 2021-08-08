<%-- 
    Document   : Menu
    Created on : Mar 3, 2021, 3:20:14 PM
    Author     : Minh Hoang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <c:if test="${sessionScope.acc.isAdmin == 1}">
        <a href="ManagerProduct.jsp">Manager Product</a>
    </c:if>
    <c:if test="${sessionScope.acc.isSell == 1}">
    </c:if>
     <c:if test="${sessionScope.acc != null}">
    <a href="#">Hello ${sessionScope.acc.userName}</a>
    <a href="#"> Logout </a> &emsp;
    </c:if>
    <c:if test="${sessionScope.acc == null}">
    <a href="Login.jsp"> Login </a> &emsp;
 </c:if>
</body>
</html>
