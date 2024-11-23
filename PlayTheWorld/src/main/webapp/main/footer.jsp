<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../styles/swiper-bundle.min.css" />
<link rel="stylesheet" type="text/css" href="../styles/styles.css">
<link rel="stylesheet" type="text/css" href="../styles/swiper-bundle.min.css">
<link rel="shortcut icon" href="images/favicon.ico">
<!-- FontAwesome for the back-to-top button icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
    * {
        font-family: 조선일보명조;
    }
    /* Back to top button styles */
    #back-to-top {
        position: fixed;
        bottom: 20px; /* Adjusted position */
        right: 20px; /* Adjusted position */
        width: 40px; /* Increased size */
        height: 40px; /* Increased size */
        display: none; /* Initially hidden */
        justify-content: center;
        align-items: center;
        background-color: #007aff; /* Changed color */
        color: white;
        border-radius: 50%;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        cursor: pointer;
        transition: background-color 0.3s, box-shadow 0.3s, color 0.3s;
    }

    #back-to-top:hover {
        background-color: white; /* White background on hover */
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        color: black; /* Black arrow on hover */
    }

    #back-to-top i, #back-to-top svg {
        font-size: 20px; /* Adjusted icon size */
    }
</style>
</head>
<body>
    <!-- START FOOTER -->
    <footer class="section footer">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-sm-10 text-center">
                    <a href="javascript:void(0)"><img src="https://i.postimg.cc/2Sc7snW1/logo3.png" height="50" alt=""></a>
                    <p class="mx-auto mt-sm-4">주식회사 마인드밴드 | 사업자등록번호: 782-86-03345</p>
                    <p class="mx-auto mt-sm-4">대표자: 윤덕수 | 대전광역시 유성구 대학로 59, 15층 1570호</p>
                </div>
                <!--end col-->
            </div>
            <!--end row-->
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="text-center mt-3">
                        <ul class="list-unstyled mb-0">
                            <li class="list-inline-item mx-lg-3 m-2 mb-0">
                                <a class="text-black" href="index.html">홈</a>
                            </li>
                            <li class="list-inline-item mx-lg-3 m-2 mb-0">
                                <a class="text-black" href="reservation.html">예약하기</a>
                            </li>
                            <li class="list-inline-item mx-lg-3 m-2 mb-0">
                                <a class="text-black" href="search.html">예약조회</a>
                            </li>
                            <li class="list-inline-item mx-lg-3 m-2 mb-0">
                                <a class="text-black" href="theme.html">테마정보</a>
                            </li>
                            <li class="list-inline-item mx-lg-3 m-2 mb-0">
                                <a class="text-black" href="notice.html">공지사항</a>
                            </li>
                        </ul>
                    </div>
                </div><!-- end col-->
            </div><!-- end row-->
        </div>
        <!--end container-->
    </footer>
    <!-- END FOOTER -->

    <!-- FOOTER-ALT -->
    <div class="footer-alt pt-4 pb-4">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="text-center">
                        <p class="mb-0 fs-15">©
                            <script>
                                document.write(new Date().getFullYear())
                            </script> 마인드밴드
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END FOOTER-ALT -->

    <!-- Back to top button -->
    <div id="back-to-top">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-up-short" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M8 12a.5.5 0 0 0 .5-.5V5.707l2.146 2.147a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 1 0 .708.708L7.5 5.707V11.5a.5.5 0 0 0 .5.5"/>
        </svg>
    </div>

    <!-- JavaScript to handle the back-to-top button -->
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var mybutton = document.getElementById("back-to-top");

            window.onscroll = function () {
                scrollFunction();
            };

            function scrollFunction() {
                if (
                    document.body.scrollTop > 100 ||
                    document.documentElement.scrollTop > 100
                ) {
                    mybutton.style.display = "flex";
                } else {
                    mybutton.style.display = "none";
                }
            }

            mybutton.addEventListener('click', function() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            });
        });
    </script>

</body>
</html>
