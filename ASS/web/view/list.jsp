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
    <style>
        .student {
            width: 100%;
        }
        .student td{
            text-align: center;
        }
        th {
            background-color: #aaffff;
        }
        .anh1 {
            width: 30px;
            height: 35px;
            margin-left: 10px;
            margin-right: 10px;
            margin-top: 5px;
        }
        .id {
            width: 40px;
        }

        .code{
            width: 100px;
        }

        .khung1{
            margin-bottom: 50px;
        }
        .khung1 td{
            font-size: 50px;
        }
        .khung2{
            width: 100%;
            background-color: #cccccc;
            margin-bottom: 30px;
        }
        .img1 {
            width: 130px;
            height: 150px;
        }
        .img{
            width: 200px;
        }
        .gender{
            width: 120px;
        }
    </style>
    <body>
        <div>
            <table class="khung1" border="0px"> 
                <tr>
                    <td>FPT University Academic Portal</td>
                </tr>
            </table>
        </div>
        
        <div>
            <table class="khung2" border="0px"> 
                <tr>
                    <td><a href="group">Home</a>|Group</td>
                </tr>
            </table>
        </div>

        <div >
               
              <table class="student" border = "1px">
                <tr>
                    <th class="id">ID</th>
                    <th class="img">Image</th>
                    <th class="code">Code</th>
                    <th class="name">Name</th>
                    <th class="gender">Gender</th>
                    <th class="dob">Dob</th>
                    <th class="address">Address</th>
                    <th class="phone">Phone</th>
                </tr>
                <c:forEach items="${requestScope.st}" var="s">
                    <tr>
                        <td class="id1">${s.sid}</td>                                           
                        <td>                  
                    <img class="img1" src="${s.simg}" alt=""/> </td>
                                                
                        <td class="code1">${s.scode}</td>
                        <td class="name1">${s.sname}</td>
                        <td><img class="anh1" src="assets/img/${s.gender?"nam.png":"gai.png"}" alt=""/></td>
                        <td class="dob1">${s.dob}</td>
                        <td class="address1">${s.address}</td>
                        <td class="phone1">${s.sphone}</td>
                    </tr>  
                </c:forEach>
            </table>

        </div>
    </body>
</html>
