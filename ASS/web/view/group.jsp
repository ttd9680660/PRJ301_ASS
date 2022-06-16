<%-- 
    Document   : group
    Created on : Jun 13, 2022, 9:52:16 PM
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
    <style>
        .lop a{
            text-decoration: none
        }
        .lop{
            padding: 2px;
        }
    </style>
    <body>
        <a>Hello Lecturers!</a>
        <div class="lop">
            Group :
            <table border = "2px">
                <tr>
                <c:forEach items="${requestScope.group}" var="g">
                        <td>
                            <a href="list?id=${g.gid}">${g.gname}</a>
                        </td> 
                    </c:forEach>
                </tr>
            </table>
        </div>
    </body>
</html>
