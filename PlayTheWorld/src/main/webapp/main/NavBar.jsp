<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
<style>
* {
	font-family: 조선일보명조;
}
 /* 둥근 버튼 스타일 */
        .nav-btn {
            border-radius: 25px; /* 모서리를 둥글게 */
        }

        /* 메뉴 항목 롤오버 스타일 */
        .navbar-nav .nav-link:hover {
            color: blue; /* 마우스 올릴 때 글자색 하늘색 색깔 찾아야댐*/
        }
</style>
<link rel="stylesheet" type="text/css" href="../styles/styles.css">
</head>
<body>
  <nav class="navbar navbar-expand-lg fixed-top navbar-white navbar-custom sticky" id="navbar">
        <div class="container d-flex justify-content-between align-items-center">
            <!-- LOGO -->
            <a class="navbar-brand text-uppercase" href="index.html">
                <img class="logo-light" src="https://i.postimg.cc/HLByFm7d/logo.jpg" alt="" height="32">
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="mdi mdi-menu"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-center" id="navbarCollapse">
                <ul class="navbar-nav" id="navbar-navlist">
                    <li class="nav-item">
                        <a class="nav-link active" href="./main.jsp">홈</a> <!-- 홈에 active 클래스 추가 -->
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./Reservation.re">예약하기</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./SearchReservation.re">예약조회</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./ThemeInfo.bo">테마정보</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./Notice.bo">공지사항</a>
                    </li>
                </ul>
            </div>

            <a type="button" class="btn btn-primary nav-btn" href="reservation.html">
                예약하기
            </a>
        </div>
    </nav>
</body>
</html>
