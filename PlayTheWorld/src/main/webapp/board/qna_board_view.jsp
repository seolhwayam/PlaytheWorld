<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="net.board.db.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="board" value="${requestScope.boarddata}" />


<html>
<head>
	<title>MVC �Խ���</title>
</head>

<body>
<!-- �Խ��� ���� -->
<table cellpadding="0" cellspacing="0">
    <tr align="center" valign="middle">
        <td colspan="5">MVC �Խ���</td>
    </tr>
    
    <tr>
        <td style="font-family:����; font-size:12" height="16">
            <div align="center">�� ��&nbsp;&nbsp;</div>
        </td>
        
        <td style="font-family:����; font-size:12">
            <c:out value="${board.BOARD_SUBJECT}" />
        </td>
    </tr>
    
    <tr bgcolor="cccccc">
        <td colspan="2" style="height:1px;"></td>
    </tr>
    
    <tr>
        <td style="font-family:����; font-size:12">
            <div align="center">�� ��</div>
        </td>
        <td style="font-family:����; font-size:12">
            <table border="0" width="490" height="250" style="table-layout:fixed">
                <tr>
                    <td valign="top" style="font-family:����; font-size:12">
                        <c:out value="${board.BOARD_CONTENT}" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="font-family:����; font-size:12">
            <div align="center">÷������</div>
        </td>
        <td style="font-family:����; font-size:12">
            <c:if test="${not empty board.BOARD_FILE}">
                <a href="./boardupload/${board.BOARD_FILE}">
                    <c:out value="${board.BOARD_FILE}" />
                </a>
            </c:if>
        </td>
    </tr>
    
    <tr bgcolor="cccccc">
        <td colspan="2" style="height:1px;"></td>
    </tr>
    <tr><td colspan="2">&nbsp;</td></tr>
    
    <tr align="center" valign="middle">
        <td colspan="5">
            <font size="2">
                <a href="./BoardReplyAction.bo?num=${board.BOARD_NUM}">
                    [�亯]
                </a>&nbsp;&nbsp;
                <a href="./BoardModify.bo?num=${board.BOARD_NUM}">
                    [����]
                </a>&nbsp;&nbsp;
                <a href="./BoardDelete.bo?num=${board.BOARD_NUM}">
                    [����]
                </a>&nbsp;&nbsp;
                <a href="./BoardList.bo">[���]</a>&nbsp;&nbsp;
            </font>
        </td>
    </tr>
</table>

<!-- �Խ��� ���� -->
</body>
</html>