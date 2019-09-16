<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/slick.css">
<link rel="stylesheet" href="css/slick-theme.css">
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/facilities.css">
<link rel="stylesheet" href="css/footer.css">
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/gnb.js"></script>
<script type="text/javascript" src="js/slick.js"></script>
<script type="text/javascript" src="js/slick-slide.js"></script>
<script type="text/javascript" src="js/aos.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		//AOS 플러그인 시작구문
		AOS.init();

		//마우스 휠 플러그인 사용구문

		//delta 라는 변수는 마우스 휠 올리고 내렸을때 휠 감도 알아내는 변수

		$("#container > div").mousewheel(function(event, delta) {
			event.preventDefault();

			//마우스 휠을 올렸을때	
			if (delta > 0) {
				var prev = $(this).prev().offset().top; // 휠을 걸어준 대상 다음구역의 시작하는 위치값 변수
				$("html,body").stop().animate({
					"scrollTop" : prev
				});
			}

			//마우스 휠을 내렸을때	
			else if (delta < 0) {
				var next = $(this).next().offset().top; // 휠을 걸어준 대상 다음구역의 시작하는 위치값 변수
				$("html,body").stop().animate({
					"scrollTop" : next
				});
			}
		});
	});
</script>
<title>테스트</title>
</head>
<body>

	<jsp:include page="/header_menu" flush="true" />
	<div id="container">
		<div class="banner">
			<h2>
				THE PLACES FOR YOUR<br /> HEALTH AND RELAXATION
			</h2>
		</div>
		<div class="contents">
			<div class="contents-center">
				<h3>FACILITIES</h3>
				<div class="facilities-box">
					<div id="f1" class="facilities1 clear">
						<div class="facilities-bg"></div>
						<div class="facilities-text">
							<h4>
								오아시스<span>The Oasis</span>
							</h4>
							<p>
								남산의 아름다운 전경 속에 자리한 오아시스는<br /> 도심 속 한가로운 휴양을 위한 최적의 장소입니다. <br />쾌적한
								온도로 유지되는 온수풀, 해외 반얀트리 리조트 풀빌라의 분위기를 느낄 수 있는<br /> 프라이빗 카바나가 선사하는
								여름의 여유를 즐길 수 있습니다.
							</p>
							<table>
								<tr>
									<td>위치</td>
									<td class="table-a">야외공간</td>
								</tr>
								<tr>
									<td>운영시간</td>
									<td class="table-a">기간별 상이</td>
								</tr>
								<tr>
									<td>문의</td>
									<td class="table-a">02-2250-8230</td>
								</tr>
							</table>
						</div>
					</div>
					<div id="f2" class="facilities2 clear">
						<div class="facilities-text">
							<h4>
								실내 수영장<span>Indoor Swimming Pool</span>
							</h4>
							<p>
								반얀트리 브랜드 고유의 자연친화적인 컨셉으로 디자인된 실내 수영장은 성인은 물론<br /> 영유아까지 안전한 수영을
								즐길 수 있습니다. 안전을 고려하여 설계된 연령대에 맞는 <br />선베드와 자쿠지에서 여유로운 시간을 즐겨보세요.
							</p>
							<table>
								<tr>
									<td>위치</td>
									<td class="table-a">더클럽 3층 (로비층)</td>
								</tr>
								<tr>
									<td>운영시간</td>
									<td class="table-a">06:00 - 21:00</td>
								</tr>
								<tr>
									<td>문의</td>
									<td class="table-a">02-2250-8105</td>
								</tr>
							</table>
						</div>
						<div class="facilities-bg"></div>
					</div>
					<div id="f3" class="facilities3 clear">
						<div class="facilities-bg"></div>
						<div class="facilities-text">
							<h4>
								피트니스 센터<span>Fitness Centre</span>
							</h4>
							<p>
								세계 최고 수준의 운동 기구와 인공 암벽, 다양한 프로그램이<br /> 운영된 스튜디오가 마련되어 있습니다. <br />따사로운
								자연 채광과 수려한 남산의 전경을 감상하며 몸과 마음이 상쾌해지는 <br /> 시간을 경험 해보세요.
							</p>
							<table>
								<tr>
									<td>위치</td>
									<td class="table-a">더클럽 1층,2층,루프탑</td>
								</tr>
								<tr>
									<td>운영시간</td>
									<td class="table-a">06:00-22:00 (매월 첫째 주 화요일 정기 휴관)</td>
								</tr>
								<tr>
									<td>문의</td>
									<td class="table-a">02-2250-8162</td>
								</tr>
							</table>
						</div>
					</div>
					<div id="f4" class="facilities4 clear">
						<div class="facilities-text">
							<h4>
								사우나<span>Sauna</span>
							</h4>
							<p>
								특별 제작된 독립 샤워 부스에서 수업, 색체, 음악을 이용한 테라피 샤워를<br /> 즐길 수 있는
								'Experiece Shower'와 건식, 습식 사우나가 마련된 사우나 시설에서 <br />일상에서의 피로를
								녹여보시기 바랍니다.
							</p>
							<table>
								<tr>
									<td>위치</td>
									<td class="table-a">더클럽 2층</td>
								</tr>
								<tr>
									<td>운영시간</td>
									<td class="table-a">06:00 - 22:00(매월 첫째 주 화요일 정기 휴관)</td>
								</tr>
								<tr>
									<td>문의</td>
									<td class="table-a">02-2250-8118</td>
								</tr>
							</table>
						</div>
						<div class="facilities-bg"></div>
					</div>
					<div id="f5" class="facilities5 clear">
						<div class="facilities-bg"></div>
						<div class="facilities-text">
							<h4>
								트룬 골프 아카데미<br/><span>Troon Golf Academy</span>
							</h4>
							<p>
								전세계 30개국에 200여 개의 골프 코스를 보유한 트룬 골프의 국내 최초 공식 아카데미 <br /> 
								입니다. 도심을 향한 탁 트인 전망이 펼쳐진 골프 타석을 비롯해 최첨단 3D 스크린 <br /> 
								골프장, 맞춤형 스윙 분석기 등 체계적인 골프 레슨을 경험하실 수 있습니다.<br /> 
							</p>
							<table>
								<tr>
									<td>위치</td>
									<td class="table-a">더 페스타 우측</td>
								</tr>
								<tr>
									<td>운영시간</td>
									<td class="table-a">06:00-21:50 (매월 첫째 주 화요일 정기 휴관)</td>
								</tr>
								<tr>
									<td>문의</td>
									<td class="table-a">02-2250-8125</td>
								</tr>
							</table>
						</div>
					</div>
					<div id="f6" class="facilities6 clear">
						<div class="facilities-text">
							<h4>
								테니스 코트<span>Tennis Court</span>
							</h4>
							<p>
								야외 스포츠 공간에 위치한 테니스 코트는 최고급 재질로 만든 국제 규격의 테니스 <br /> 
								코트로 프로페셔널한 스포츠 경기를 즐기실 수 있습니다. 테니스 실력을 향상 시킬 수 <br /> 
								있도록 실력에 따라 세분화한 클래스를 수시 운영하고 있으며 성인부터 어린이 회원까지 <br /> 
								다양하게 참여할 수 있습니다.   
							</p>
							<table>
								<tr>
									<td>위치</td>
									<td class="table-a">야외 공간</td>
								</tr>
								<tr>
									<td>운영시간</td>
									<td class="table-a">07:00 - 21:00(매월 첫째 주 화요일 정기 휴관)</td>
								</tr>
								<tr>
									<td>문의</td>
									<td class="table-a">02-2250-8118</td>
								</tr>
							</table>
						</div>
						<div class="facilities-bg"></div>
					</div>
					<div id="f7" class="facilities7 clear">
						<div class="facilities-bg"></div>
						<div class="facilities-text">
							<h4>
								풋살 필드<span>Futsal Field</span>
							</h4>
							<p>
								남산의 자연 환경 속에 조성된 풋살 필드는 반얀트리의 야외 스포츠 공간에 위치하고 <br />
								있습니다. 최고급 소재로 만든 국제 규격의 필드로 어린이에서부터 성인까지 풋살을 <br /> 
								즐기시기에 최적화된 장소입니다.
							</p>
							<table>
								<tr>
									<td>위치</td>
									<td class="table-a">야외 공간</td>
								</tr>
								<tr>
									<td>운영시간</td>
									<td class="table-a">07:00-21:00 (매월 첫째 주 화요일 정기 휴관)</td>
								</tr>
								<tr>
									<td>문의</td>
									<td class="table-a">02-2250-8118</td>
								</tr>
							</table>
						</div>
					</div>
					<div id="f8" class="facilities8 clear">
						<div class="facilities-text">
							<h4>
								농구 코트<span>Basketball Court</span>
							</h4>
							<p>
								숲 속에 조성된 농구 코트는 반얀트리의 야외 스포츠 공간에 위치하고 있습니다. <br /> 
								남산의 시원한 바람을 맞으며 농구 코트에서 가족 또는 지인들과 즐거운 농구 경기를 <br /> 
								즐겨보시기 바랍니다.
							</p>
							<table>
								<tr>
									<td>위치</td>
									<td class="table-a">야외 공간</td>
								</tr>
								<tr>
									<td>운영시간</td>
									<td class="table-a">07:00 - 21:00(매월 첫째 주 화요일 정기 휴관)</td>
								</tr>
								<tr>
									<td>문의</td>
									<td class="table-a">02-2250-8118</td>
								</tr>
							</table>
						</div>
						<div class="facilities-bg"></div>
					</div>
					<div id="f9" class="facilities9 clear">
						<div class="facilities-bg"></div>
						<div class="facilities-text">
							<h4>
								아이스링크<span>Ice Rink</span>
							</h4>
							<p>
								아름다운 남산의 설경으로 둘러 싸인 아이스링크는 도심 속 겨울 스포츠를 즐길 수 있는 <br /> 
								공간입니다. 아이스링크는 총 길이 63m, 폭 15m로 호텔 아이스링크 중 최대 규모이며 <br /> 
								눈썰매장과 아웃도어 키친 등 다양한 부대시설이 마련되어 있습니다. 도심 속 <br /> 
								아이스링크에서 소중한 사람들과 아름다운 겨울 추억을 만들어보시기 바랍니다.
							</p>
							<table>
								<tr>
									<td>위치</td>
									<td class="table-a">야외 공간</td>
								</tr>
								<tr>
									<td>운영시간</td>
									<td class="table-a">11:00-19:00 (매월 첫째 주 화요일 정기 휴관)</td>
								</tr>
								<tr>
									<td>문의</td>
									<td class="table-a">02-2250-8230</td>
								</tr>
							</table>
						</div>
					</div>
					<div id="f10" class="facilities10 clear">
						<div class="facilities-text">
							<h4>
								포레스타<span>Foresta</span>
							</h4>
							<p>
								자연 친화적인 반얀트리 브랜드 철학을 닮은 ‘포레스타’ 뷰티 살롱은 세계적인 친환경 <br /> 
								브랜드 ‘아베다’의 최상 등급인 라이프 스타일 살롱으로 아베다의 미션과 철학을 그대로 <br /> 
								실천하며 우수한 품질의 서비스를 제공합니다. 포레스타(Foresta)는 ‘숲’이라는 뜻의 <br /> 
								이탈리아어에서 유래하였으며 큰 숲 안에 살아 숨 쉬는 생명의 무한한 에너지와 숲과 <br /> 
								같은 휴식 공간을 상징합니다. 
							</p>
							<table>
								<tr>
									<td>위치</td>
									<td class="table-a">더클럽 3층</td>
								</tr>
								<tr>
									<td>운영시간</td>
									<td class="table-a">10:00 - 19:00(매월 첫째 주 화요일 정기 휴관)</td>
								</tr>
								<tr>
									<td>문의</td>
									<td class="table-a">02-2250-8098</td>
								</tr>
							</table>
						</div>
						<div class="facilities-bg"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/footer" flush="true"/>

</body>
</html>