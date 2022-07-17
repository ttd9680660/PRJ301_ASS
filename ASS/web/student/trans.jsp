<%-- 
    Document   : transcript
    Created on : Jul 7, 2022, 9:34:09 PM
    Author     : Trung Duc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Resume - Start Bootstrap Theme</title>
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
    </head>
    <style>
        .a {
            width: 100%;
            height: 100%;
        }
        .a h1{
            font-size: 40px;
        }
        .a h2{
            font-size: 15px;
            margin-left: 650px;
        }
        .b {
            width: 100%;
            background-color: #EEEEEE;
        }

        .b b1{
            padding: 1px;
            margin-left:  1100px;
            background-color: #66CC66;
        }
        .b b2{
            padding: 1px;
            background-color: #66CC66;
        }
        .c{
            padding-top: 30px;
        }
        .c td{
            width: 100%;
            padding-left: 20px;
            font-size: 40px;
        }

        .d
        {
            margin: 3%;
            flex: 20%;
            display: flex;
            justify-content: center;
        }

        .dd td{
            background-color: 	#4169E1;
            padding: 5px;
        }
        .d21 td{
            background-color: 	#4169E1;
            padding: 5px;
        }
        .ddd{
            text-align: center;
            font-size: 30px;
        }
        .ddddd{
            font-size: 30px;
        }
        .f {
            width: 100%;
        }
        .g{
            width: 100%;
        }
        .g p{
            text-align: center;
        }
    </style>

    <body>
        <div>
            <table>
                <tr class="a">
                    <td><h1> FPT University Academic Portal</h1></td>
                    <td><h2>FAP mobile app (myFAP) is ready at</h2></td>
                </tr>            
            </table>
        </div>

        <div class="b">
            <table >
                <tr>
                    <td><a href="home">Home</a>|Grade-book</td>
                    <td><b1><a href="logout">Logout</a></b1></td>
                <td><b2>CAMPUS: FPTU-Hòa Lạc</b2></td>
                </tr>
            </table>
        </div>

        <div class="c">
            <table>
                <tr >
                    <td>Grade report for Trần Trung Đức (HE150887)</td>
                </tr>            
            </table>
        </div>

        <div >
            <div>                   
                <div class="d">
                    <table>
                        <tr>
                            <td valign='top'>                
                                <div class="ddd">
                                    Select a term, course ...
                                </div>  
<!--                                <table class="d1">
                                    <thead><tr class="dd"><td>TERM</td><td>COURSE</td></tr></thead>
                                    <tbody>
                                        <tr>                    
                                            <td class="d11"><div><table><tr><td></td></tr></table></div></td>
                                            <td class="d12"><div><table>
                                                        <tr>
                                                            <td>Java Web Application Development (PRJ301) </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Basic Cross-Platform Application Programming With .NET (PRN211) </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Software Requirement (SWR302) </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Software Testing (SWT301) </td>
                                                        </tr>
                                                    </table></div></td>
                                        </tr>
                                    </tbody></table>-->
                                <table>
                                    <thead><tr class="d1"><th>TERM</th><th>COURSE</th></tr></thead>

                                    <tbody>
                                        <tr> 
                                            <td class="d11" valign='top'><div><table><tr><td>Summer 2022</td></tr></table></div></td>
                                            <td class="d12">
                                                <div>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <c:forEach items="${requestScope.course}" var="c">                               
                                                                    <a  href="viewtrans?sid=${requestScope.sid}&cid=${c.cid}"  >${c.cname}</a> </br>                                 
                                                                </c:forEach>

                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>

                                            </td>

                                        </tr>
                                    </tbody></table>
                            </td>                   
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <div class="f">
            <table>
                <tr>
                    <td>Mọi góp ý, thắc mắc xin liên hệ: Phòng dịch vụ sinh viên: Email: dichvusinhvien@fe.edu.vn. Điện thoại: (024)7308.13.13</td>
                </tr>
            </table>
        </div>

        <div class="g">
            <table >
                <tr>
                    <p>© Powered by FPT University |  CMS |  library |  books24x7</p>
                </tr>
            </table>
        </div>
    </body>
</html>
