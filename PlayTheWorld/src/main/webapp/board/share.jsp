<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:import url="../login/NavBar.jsp" var="NavBar"/>
<c:out value="${NavBar}" escapeXml="false"/>
<title>Insert title here</title>
<style>
    * {
        font-family: 국민연금체;
    }
</style>
</head>
<body>
    <a id="kakao-link-btn" href="javascript:kakaoShare()">
    	<img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" />
    </a>
</body>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
 <script type='text/javascript'>

  Kakao.init('e349724d5bdb90952c8f2f22e1419693'); //자바스크립트 키값
  // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
  Kakao.Link.createScrapButton({
      container: '#kakao-link-btn',
      requestUrl: 'http://localhost:8080/Model2-Board/Main.lo', //누르면 올 주소!!
      templateId : 107192 //템플릿 id
  });

</script>

</html>
