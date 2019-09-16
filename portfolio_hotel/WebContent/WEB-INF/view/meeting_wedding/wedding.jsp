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
    <link rel="stylesheet" href="../css/wedding.css">
    <link rel="stylesheet" href="../css/footer.css">
    <script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="../js/gnb.js"></script>
    <script type="text/javascript" src="../js/slick.js"></script>
    <script type="text/javascript" src="../js/slick-slide.js"></script>
    <title>Wedding</title>
</head>
<body>
    <jsp:include page="/header_menu" flush="true"/>

    <!-- 컨테이너 영역 시작 -->
    <div id="container">
        <div class="container">
            <!-- 서브페이지 상단 타이틀 -->
            <h1>Wedding</h1>

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
                <h5>인생에서 가장 행복한 순간, 사랑하는 두 사람의 첫 여정을 반얀트리 웨딩과 함께 시작해보세요. 로맨틱하면서도 품격 있는 웨딩 스타일링, 크리스탈 볼룸부터 야외 테라스까지 다채로운 연회 공간에 전문 플래너의 서비스가 더해져 완벽한 웨딩을 선사합니다. 도심속 휴양지, 반얀트리 클럽 앤 스파 서울의 아름다운 자연 풍경을 배경으로 나만의 프라이빗한 웨딩을 만들 수 있습니다.
                </h5>

                <div class="book">예약 및 문의 : Telephone    02-2250-8000</div>
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
                        <h3>오아시스</h3>
                        <div class="room-text-hover">
                            <p>도심 속 아름다운 남산의 전경이 펼쳐진</p>
                                <p>풀사이드 웨딩과 파티가 열리는 이국적인 공간</p>
                           
                            <h4>수용인원 350명</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/footer" flush="true" />
    
</body>
</html>