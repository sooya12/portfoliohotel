<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="board.qna.*"%>
<%@ page import="board.member.*"%>
<%@ page import="util.*"%>
<%@ page import="property.*"%>
<%
	QnaVO param = (QnaVO) request.getAttribute("param");
	QnaVO qdata = (QnaVO) request.getAttribute("qdata");
%>
<!DOCTYPE html>

<html lang="ko">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/smarteditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/function.js"></script>
<script type="text/javascript">
	function goPassword() {
		$("#PwCheckBtn").show(); // 비밀번호 입력칸 보이기
		$("#editBtn2").show(); // 값 넘기는 버튼 생성
		$("#editBtn1").hide(); // 비밀번호 입력칸 보이게 하는 버튼 사라짐
		$("#password").focus();
	}

	function goPassword2() {
		$("#PwCheckBtn").show(); // 비밀번호 입력칸 보이기
		$("#deleteBtn2").show(); // 값 넘기는 버튼 생성
		$("#deleteBtn1").hide(); // 비밀번호 입력칸 보이게 하는 버튼 사라짐
		$("#password").focus();
	}

	function goEdit() {
		if ($("#password").val() == "") {
			alert("비밀번호를 입력해주세요")
			$("#password").focus();
			return false;
		}
	}

	$(function() {
		var cmd = $('#cmd');
		$('#deleteBtn2').click(function() {
			cmd.attr('value', 'delete');
		});
	});

	function goSave() {
		if ($("#name").val() == "") {
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return false;
		}
		if ($("#id").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#id").focus();
			return false;
		}
	}

	$(function() {
		if ($("#Rcontents").val == null) {
			$('#ReplyBtn').hide();
		} else {
			$('#ReplyBtn').click(function() {
				$('#Rcontents').show();
			});
		}
	});
</script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/default.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/qna_q.css">
<link rel="stylesheet" href="/css/footer.css">
<script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/js/gnb.js"></script>
<title>Tree_qna</title>
</head>
<body>

	<jsp:include page="/header_menu" flush="true" />

	<div id="container">

		<div class="banner">
			<div class="qna_q-section">
				<h2>Support</h2>
				<h3>Q&A</h3>
				<h4>
					반얀트리 공지사항과<br /> 놓칠 수 없는 이벤트 정보를 알려드립니다.
				</h4>
			</div>
		</div>
		<div class="qna_q">
			<div class="support-list">
				<ul class="support-list-center">
					<li><a href="/support/notice/notice">공지사항</a></li>
					<li><a href="/support/faq/faq">FAQ</a></li>
					<li class="on"><a href="qna">Q&A</a></li>
				</ul>
			</div>
			<div class="qna_q-table">
				<div class="qna_q-box">

					<form method="POST" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/processU" enctype="multipart/form-data" onsubmit="return goEdit();">

						<label for="">제목</label> 
						<input type="text" id="title" name="title" title="제목을 입력해주세요" value="<%=qdata.getTitle()%>" readonly /> 
						<label for="">내용</label>
						<!-- <textarea name="qna-cont" id="qna-cont"></textarea> -->
						<!-- <textarea id="contents" name="contents" title="내용을 입력해주세요" style="width:100%; height:300px;"></textarea> -->
						<textarea name="contents" id="contents" readonly><%=qdata.getContents()%></textarea>
						<label for="">첨부파일</label>
						<div class="attachfile">
							<!-- <input type="file" id="filename_tmp" name="filename_tmp" style="width:894px;height:45px;border: 2px solid #eee;" title="첨부파일을 업로드 해주세요." /> -->
							<%
								if (qdata.getFile() == null) {
							%>
							첨부파일이 없습니다.
							<!-- <input type="file" id="filename_tmp" name="filename_tmp" style="width:894px;height:45px;border: 2px solid #eee;" value="첨부파일이 없습니다." readonly/>  -->
							<%
								} else {
							%>

							<p>
								기존파일 : <a href="<%=Function.downloadUrl(SiteProperty.QNA_UPLOAD_PATH, java.net.URLEncoder.encode(qdata.getFile_org(), "UTF-8"), qdata.getFile())%>" target="_blank"><%=Function.checkNull(qdata.getFile_org())%></a><br />
							</p>

							<%
								}
							%>
							</br>
						</div>
						<input type="button" class="ReplyBtn" id="ReplyBtn" value="답변확인">
						<textarea name="Rcontents" id="Rcontents" readonly><%if(qdata.getReply_contents() != null) {%><%=qdata.getReply_contents()%><%} else {%>등록된 답변이 없습니다.	<%}%></textarea>
						<div class="pwCheck" id="PwCheckBtn" hidden>
							<label for="qna-title">비밀번호 확인</label> <input type="password"
								name="password" id="password"
								style="width: 300px; height: 45px; border: 2px solid #eee;" />
						</div>
						<ul class="base_info clear">
							<li>
								<div class="btnLeft" id="editBtn1">
									<input type="submit" class="editBtn1" onclick="goPassword();"
										value="수정" style="float: left;">
									<!-- <input type="submit" class="deleteBtn1" onclick="goPassword();" value="삭제" style="float:right;">
                        		<input type="submit" class="editBtn2" href="javascript:$('#frm').submit();" value="수정" style="display:none;"></a>
                        		<input type="submit" class="deleteBtn2" href="javascript:$('#frm').submit();" value="삭제" style="display:none;"></a> -->
								</div>
								<div></div>
								<div class="btnLeft" id="editBtn2" style="display: none;">
									<input type="submit" class="editBtn" href="javascript:$('#frm').submit();" value="수정" style="width: 140px; height: 50px; display: block; margin: 0 auto; margin-top: 70px; background-color: #0e693f; color: #fff;"></a>
								</div>
								<div class="btnRight" id="deleteBtn1">
									<input type="submit" class="deleteBtn" onclick="goPassword2();" value="삭제" style="float: right;">
								</div>
								<div class="btnRight" id="deleteBtn2" style="display: none;">
									<input type="submit" class="deleteBtn" href="javascript:$('#frm').submit();" value="삭제" style="float: right;">
								</div>

							</li>
						</ul>

						<!--======== 필요값 히든처리================ -->
						<input type="hidden" id="cmd" name="cmd" value="checkPW" /> 
						<input type="hidden" name="reply" value="0" /> 
						<input type="hidden" name="send_email" value="0" /> <input type="hidden" name="no" value="<%=qdata.getNo()%>" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/footer" flush="true" />
</body>
</html>