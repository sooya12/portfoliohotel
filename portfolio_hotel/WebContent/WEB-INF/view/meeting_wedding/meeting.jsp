<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../css/slick.css">
    <link rel="stylesheet" href="../css/slick-theme.css">
    <link rel="stylesheet" href="../css/default.css">
    <link rel="stylesheet" href="../css/header-fixed.css">
    <link rel="stylesheet" href="../css/meeting.css">
    <link rel="stylesheet" href="../css/footer.css">
    <script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="../js/gnb.js"></script>
    <script type="text/javascript" src="../js/slick.js"></script>
    <script type="text/javascript" src="../js/slick-slide.js"></script>
    <title>Meeting</title>
</head>
<body>
    <jsp:include page="/header_menu" flush="true"/>

    <!-- 컨테이너 영역 시작 -->
    <div id="container">
        <div class="container">
            <!-- 서브페이지 상단 타이틀 -->
            <h1>Meeting</h1>

            <!-- 객실 사진 슬라이드 영역 -->
            <div class="slide">
                <div class="sub_page_panel">
                    <div class="room-wrap">
                        <div class="room-pic1 rooms"></div>
                    </div>
                    <div class="room-wrap">
                        <div class="room-pic2 rooms"></div>
                    </div>
                    <div class="room-wrap">
                        <div class="room-pic3 rooms"></div>
                    </div>
                    <div class="room-wrap">
                        <div class="room-pic4 rooms"></div>
                    </div>
                    <div class="room-wrap">
                        <div class="room-pic5 rooms"></div>
                    </div>
                </div>
            </div>
            <div class="room-btn clear">
                    <button class="slick-prev"></button>
                    <button class="slick-next"></button>
            </div>

            <div class="brief">
                <h5>성공적인 비즈니스 이벤트를 호텔 클럽 앤 스파 서울에서 준비해보세요.
                    서울의 중심인 남산에 위치해 지리적 편리함을 갖췄으며 특별한 자연 환경을 배경으로 한 다양한 크기의 연회 공간에서 비즈니스 미팅, 컨퍼런스, 론칭 행사 등 목적에 따른 미팅 또는 이벤트를 계획할 수 있습니다. 반얀트리 서울 연회 전문가의 세심한 배려와 정성을 담은 다이닝 서비스는 비즈니스 이벤트를 성공적으로 만들어 드립니다.
                </h5>

                <div class="book">예약 및 문의 : Telephone    02-1234-5678</div>
            </div>
        </div>
        <div class="meeting-rooms">
            <div class="meeting-rooms-center clear">
                <div class="meeting-room1">
                    <div class="room-bg"></div>
                    <div class="room-text">
                        <h3>크리스탈 볼룸 </h3>
                            <div class="room-text-hover">
                                <p>스와로브스키 크리스탈이 반짝이는 </p>
                                    <p>화려하고 품격 있는 대규모 연회장</p>
                               
                                <h4>수용인원 230명</h4>
                            </div>
                    </div>
                </div>
                <div class="meeting-room2">
                    <div class="room-bg"></div>
                    <div class="room-text">
                        <h3>페스타 홀</h3>
                        <div class="room-text-hover">
                            <p>소규모 가족 행사와 기업 연회에 최적화된 </p>
                                <p>아늑한 분위기의 연회장</p>
                           
                            <h4>수용인원 100명</h4>
                        </div>
                    </div>
                </div>
                <div class="meeting-room3">
                    <div class="room-bg"></div>
                    <div class="room-text">
                        <h3>보드룸</h3>
                        <div class="room-text-hover">
                            <p>소규모 비즈니스 미팅 </p>
                                <p>또는 세미나에 세미나에 적합한 회의실</p>
                           
                            <h4>수용인원 13명</h4>
                        </div>
                    </div>
                </div>
                <div class="meeting-room4">
                    <div class="room-bg"></div>
                    <div class="room-text">
                        <h3>남산 테라스 & 셀레스테</h3>
                        <div class="room-text-hover">
                            <p>계절마다 변화하는 남산의 경관을 배경으로 한</p>
                                <p>세련된 야외 연회 공간</p>
                           
                            <h4>수용인원 230명</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/footer" flush="true" />
    
</body>
</html>