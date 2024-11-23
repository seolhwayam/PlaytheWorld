<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <c:import url="./adminNavBar.jsp" var="NavBar"/>
	<c:out value="${NavBar}" escapeXml="false"/>
    <meta charset="UTF-8">
    <title>유저 상세 정보</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1, h2 {
            color: #333;
            text-align: center; /* 가운데 정렬 추가 */
        }
        h1 {
            margin-bottom: 20px;
        }
        h2 {
            margin-bottom: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
            text-align: center; /* 가운데 정렬 추가 */
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <br>
    <br>
    <h1>회원 상세 정보</h1>
    <div class="container">
        <table>
            <thead>
                <tr>
                    <th>이름</th>
                    <th>주민번호</th>
                    <th>ID</th>
                    <th>PW</th>
                    <th>이메일</th>
                    <th>취미</th>
                    <th>자기소개</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <c:forEach var="info" items="${userInfo}">
                        <td><c:out value="${info}" /></td>
                    </c:forEach>
                </tr>
            </tbody>
        </table>
    </div>
</body>

</html>
