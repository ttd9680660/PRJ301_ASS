<%-- 
    Document   : list
    Created on : Jun 10, 2022, 9:11:30 PM
    Author     : Trung Duc
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                <form action="list" method ="GET">
              <table>
                <tr>
                    <td>id</td>
                    <td>code</td>
                    <td>name</td>
                    <td>gender</td>
                    <td>dob</td>
                    <td>address</td>
                    <td>phone</td>
                </tr>
                <c:forEach items="${requestScope.student}" var="s">
                    <tr>
                        <td>${s.sid}</td>
                        <td>${s.scode}</td>
                        <td>${s.sname}</td>
                        <td>${s.gender}</td>
                        <td>${s.dob}</td>
                        <td>${s.address}</td>
                        <td>${s.sphone}</td>
                    </tr>  
                </c:forEach>
            </table>
    </form>
    </body>
</html>
