<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>Play the World</title>
    <link rel="stylesheet" href="../styles/swiper-bundle.min.css" />
    <link rel="stylesheet" type="text/css" href="../styles/styles.css">
    <link rel="shortcut icon" href="images/favicon.ico">
    <style>
        * {
            font-family: 조선일보명조;
        }
        
        img.fullscreen {
            width: 100%;
            height: 94vh;
            object-fit: cover;
        }
        #playworld{
        	height:600px;
        	background-color:gray;
        }
    </style>
    <c:import url="NavBar.jsp" var="NavBar"/>
    <c:out value="${NavBar}" escapeXml="false"/>
</head>

<body>
    <!-- Home Section -->
    <section class="section home home-1" id="home" style="background-image: url('images/home-bg.png');">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-xl-7 col-md-10 mt-4" id="palyworld">
                    <h2 class="text-uppercase">세상을 플레이하다.</h2>
                    <p class="home-caption text-muted mt-4">We Play The World.</p>
                </div>
            </div>
            <!-- Modal -->
            <div class="modal fade bd-example-modal-lg" id="watchvideomodal" data-bs-keyboard="false" tabindex="-1"
                aria-labelledby="watchvideomodalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog modal-lg">
                    <div class="modal-content home-modal">
                        <div class="modal-header border-0">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <video id="VisaChipCardVideo" class="video-box" controls>
                            <source src="https://www.w3schools.com/html/mov_bbb.mp4" type="video/mp4">
                            <!--Browser does not support <video> tag -->
                        </video>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="container-fluid">
        <div class="row">
            <div class="home-shape-arrow">
                <a href="#features" class="mouse-down">
                    <svg class="arrows">
                        <path class="a1" d="M0 0 L25 22 L50 0"></path>
                        <path class="a2" d="M0 15 L25 40 L50 15"></path>
                        <path class="a3" d="M0 30 L25 54 L50 30"></path>
                    </svg>
                </a>
            </div>
        </div>
    </div>

    <!-- Service Section -->
    <section class="section service-2" id="service">
        <div class="container">
            <div class="row justify-content-center" style="margin-top: 100px;">
                <div class="col-3 text-center">
                    <h1 class="fs-1">We, Play, World</h1>
                    <h5>PLAY THE WORLD</h5>
                </div>
            </div>
            <div class="row justify-content-center align-items-center">
                <div class="col-lg-6">
                    <img class="img-fluid img-responsive" src="../img/ptw-logo.png">
                </div>
                <div class="col-lg-4">
                    <p>즐거운 이야기가 가득한 곳, 플레이더월드입니다.</p>
                    <p class="mt-5">조금은 서툴지만 재미있게.</p>
                    <p>조금은 어색하지만 친근하게.</p>
                    <p>그리고 함께.</p>
                    <p class="mt-5">플레이더월드의 이야기를 시작합니다.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Additional Section -->
    <section class="section">
        <div class="container">
            <div class="row justify-content-center text-center">
                <div class="col-lg-8">
                    <p>"냐옹"</p>
                    <img class="img-fluid" src="../img/doopal1.jpg">
                </div>
            </div>
        </div>
    </section>
   <c:import url="footer.jsp" var="footer"/>
   <c:out value="${footer}" escapeXml="false"/>

   	
</body>

</html>
