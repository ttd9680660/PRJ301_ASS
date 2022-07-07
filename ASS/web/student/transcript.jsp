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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                    <td><a href="group">Home</a>|Grade-book</td>
                    <td><b1>Logout</b1></td>
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
                                <table class="d1">
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
                                    </tbody></table>
                            </td>
                            <td valign='top'>
                                <div>
                                    <table>
                                        <td class="ddddd">... then see report</td>

                                        <tr class="d21">
                                            <td>GRADE CATEGORY</td>
                                            <td>GRADE ITEM</td>
                                            <td>WEIGHT</td>
                                            <td>VALUE</td>
                                            <td>COMMENT</td>
                                        </tr>

                                        <tbody>
                                            <tr>
                                                <td rowspan="3">Assignment</td>
                                                <td>Assignment 1</td>
                                                <td>15.0 %</td>
                                                <td>
                                                    <c:if test="${requestScope.transcript.as1 == 0}">
                                                    </c:if>  
                                                    <c:if test="${requestScope.transcript.as1 != 0}">
                                                        ${requestScope.transcript.as1}
                                                    </c:if> 
                                                </td>
                                                <td></td>
                                            </tr>

                                            <tr>
                                                <td>Assignment 2</td>
                                                <td>15.0 %</td>
                                                <td>
                                                    <c:if test="${requestScope.transcript.as2 == 0}">
                                                    </c:if>  
                                                    <c:if test="${requestScope.transcript.as2 != 0}">
                                                        ${requestScope.transcript.as2}
                                                </td>
                                                <td></td>
                                            </tr>


                                            <tr>
                                                <td>Total</td>
                                                <td>30.0 %</td>
                                                <td></td>
                                                <td></td>
                                            </tr>

                                            <tr>
                                                <td rowspan="4">Progress test</td>
                                                <td>Progress test 1</td>
                                                <td>10.0 %</td>
                                                <td>
                                                    <c:if test="${requestScope.transcript.pt1 == 0}">
                                                    </c:if>  
                                                    <c:if test="${requestScope.transcript.pt1 != 0}">
                                                        ${requestScope.transcript.pt1}
                                                </td>
                                                <td></td>
                                            </tr>

                                            <tr>
                                                <td>Progress test 2</td>
                                                <td>10.0 %</td>
                                                <td>
                                                    <c:if test="${requestScope.transcript.pt2 == 0}">
                                                    </c:if>  
                                                    <c:if test="${requestScope.transcript.pt2 != 0}">
                                                        ${requestScope.transcript.pt2}
                                                </td>
                                                <td></td>
                                            </tr>

                                            <tr>
                                                <td>Progress test 3</td>
                                                <td>10.0 %</td>
                                                <td>
                                                    <c:if test="${requestScope.transcript.pt3 == 0}">
                                                    </c:if>  
                                                    <c:if test="${requestScope.transcript.pt3 != 0}">
                                                        ${requestScope.transcript.pt3}
                                                </td>
                                                <td></td>
                                            </tr>

                                            <tr>
                                                <td>Total</td>
                                                <td>30.0 %</td>
                                                <td></td>
                                                <td></td>
                                            </tr>

                                            <tr>
                                                <td rowspan="2">Practical Exam</td>
                                                <td>Practical Exam</td>
                                                <td>20.0 %</td>
                                                <td>
                                                    <c:if test="${requestScope.transcript.pe == 0}">
                                                    </c:if>  
                                                    <c:if test="${requestScope.transcript.pe != 0}">
                                                        ${requestScope.transcript.pe}
                                                </td>
                                                <td></td>
                                            </tr>

                                            <tr>
                                                <td>Total</td>
                                                <td>20.0 %</td>
                                                <td></td>
                                                <td></td>
                                            </tr>


                                            <tr>
                                                <td rowspan="2">Final Exam</td>
                                                <td>Final Exam</td>
                                                <td>20.0 %</td>
                                                <td>
                                                    <c:if test="${requestScope.transcript.fe == 0}">
                                                    </c:if>  
                                                    <c:if test="${requestScope.transcript.fe != 0}">
                                                        ${requestScope.transcript.fe}
                                                </td>
                                                <td></td>
                                            </tr>

                                            <tr>
                                                <td>Total</td>
                                                <td>20.0 %</td>
                                                <td></td>
                                                <td></td>
                                            </tr>

                                        </tbody>

                                        <tfoot>
                                            <tr>
                                                <td rowspan="2">COURSE TOTAL</td>
                                                <td>AVERAGE</td>
                                                <td colspan="3"></td>
                                            </tr>

                                            <tr>
                                                <td>STATUS</td>
                                                <td colspan="3">
                                                    <font color="Green">STUDYING</font>
                                                </td></tr>
                                        </tfoot>
                                    </table>
                                </div>
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