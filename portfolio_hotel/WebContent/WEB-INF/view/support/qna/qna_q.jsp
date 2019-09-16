<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="board.qna.*" %>
<%@ page import="board.member.*" %>
<%@ page import="util.*" %>
<%
QnaVO param = (QnaVO)request.getAttribute("vo");
MemberVO member_vo = (MemberVO)session.getAttribute("memberInfo");
%>
<!DOCTYPE html>

<html lang="ko">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/smarteditor/js/HuskyEZCreator.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/function.js"></script> 
<script type="text/javascript">


 	/* var oEditors; // 에디터 객체 담을 곳
	jQuery(window).load(function(){
		oEditors = setEditor("contents"); // 에디터 셋팅
		initCal({id:"regdate",type:"day",today:"y",timeYN:"y"});
	}); */
	var chknum = /[0-9]/;
	var chkat = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
	function goSave() {
		if ($("#fisrtName").val() ==""){
			alert("성을 입력해 주세요");
			$("#fisrtName").focus();
			return false;
		}
		if ($("#lastName").val() ==""){
			alert("이름을 입력해 주세요");
			$("#lastName").focus();
			return false;
		}
		if ($("#tel1").val() ==""){
			alert("번호를 입력해 주세요");
			$("#tel1").focus();
			return false;
		}
		if ($("#tel2").val() ==""){
			alert("번호를 확인해 주세요");
			$("#tel2").focus();
			return false;
		}
		if ($("#tel3").val() ==""){
			alert("번호를 확인해 주세요");
			$("#tel3").focus();
			return false;
		}
		if ($("#email").val() ==""){
			alert("이메일을 입력해 주세요");
			$("#email").focus();
			return false;
		}
		if ($("#title").val() =="") {
			alert('제목을 입력하세요.');
			$("#title").focus();
			return false;
		}
		if ($("#contents").val() ==""){
			alert("내용 입력해 주세요");
			$("#contents").focus();
			return false;
		}  
		
		if ($("#password").val() ==""){
			alert("비밀번호를 입력해 주세요");
			$("#password").focus();
			return false;
		}
		if($("#tel1").val()=="" || !chknum.test($("#tel1").val())){
			alert("숫자만 입력해 주세요");
			$("#tel1").focus();
			return false;
		}
		if($("#tel2").val()=="" || !chknum.test($("#tel2").val())){
			alert("숫자만 입력해 주세요");
			$("#tel2").focus();
			return false;
		}
		if($("#tel3").val()=="" || !chknum.test($("#tel3").val())){
			alert("숫자만 입력해 주세요");
			$("#tel3").focus();
			return false;
		}
		if($("#email").val()=="" || !chkat.test($("#email").val())){
			alert("이메일 주소를 확인해주세요")
			$("#guest_email").focus();
			return false;
		
		}
		
		
		return true;
		
	}
	
	
	
/* 	
	$(function() {
		
		if($("#hideEmailOpt").val() == "@") {
		$("#hideEmailOpt").hide();
		var pass = $("#1234").val();
		 console.log(pass);
		 $("#email2").attr("disabled",false);
		 $("#selectEmail").val("1").prop("selected", true);
		}
			
			
		$('#selectEmail').change(function(){ 
			   $("#selectEmail option:selected").each(function () { 
			      if($(this).val()== '1'){ //직접입력일 경우
			         $("#email2").val('@'); //값 초기화
			         $("#email2").attr("disabled",false); //활성화
			         }else{ //직접입력이 아닐경우
			            $("#email2").val($(this).text()); //선택값 입력
			            $("#email2").attr("disabled",true); //비활성화
			         } 
			    }); 
		}); */
	
	
	
	
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
<jsp:include page="/header_menu" flush="true"/>
    
    <div id="container">
        
        <div class="banner">
            <div class="qna_q-section">
                    <h2>Support</h2>
                    <h3>Q&A</h3>
                    <h4>반얀트리 공지사항과<br/>
                            놓칠 수 없는 이벤트 정보를 알려드립니다.</h4>
                </div>
        </div>
        <div class="qna_q">
            <div class="support-list">
                <ul class="support-list-center">
                    <li><a href="notice.html">공지사항</a></li>
                    <li><a href="faq.html">FAQ</a></li>
                    <li class="on"><a href="qna">Q&A</a></li>
                </ul>
            </div>
            <div class="qna_q-table">
                <div class="qna_q-box">
     
                	<%
                	
                	String email1 = "";
                	String tel1 = "";
                	String tel2 = "";
                	String tel3 = "";
                	String FName = "";
                	String LName = "";
                	
                	
                	if(member_vo != null) {
                		String Email= member_vo.getEmail();
                		email1 = Email;
                		String TelF= member_vo.getF_tel();
                		String TelM= member_vo.getM_tel();
                		String TelL= member_vo.getL_tel();
                		tel1 = TelF;
                		tel2 = TelM;
                		tel3 = TelL;
                		String NameL = member_vo.getL_name();
                		String NameF = member_vo.getF_name();
                		FName = NameL;
                		LName = NameF;
                		int Memberpk = member_vo.getNo();
                		
                	} 
                	%>
           
						<form method="POST"name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/processU" enctype="multipart/form-data" onsubmit="return goSave();" >
                   
                    	<ul class="base_info clear">
                            <li>
                                <label for="">카테고리</label>
                               	<select name="category" style="height:30px;">
									<option value="1"> 예약 </option>
									<option value="2"> 멤버쉽 </option>
									<option value="3"> 기타 </option>
								</select>
                            </li>
                            <li>
                                <label for="">공개여부</label>
                               	<select name="open" style="height:30px;">
									<%=CodeUtil.getOpenOption(0) %>
								</select>
                            </li>
                        </ul>
                        <ul class="base_info clear">
                            <li>
                                <label for="qna-title">이름</label>
                               		<input type="text" style="width:100px;height:45px;" id="lastName" name="lastName"  title="성을 입력해주세요" placeholder="성" value="<%=LName %>"/>
									<input type="text" style="width:150px;height:45px;" id="firstName" name="firstName"  title="이름을 입력해주세요" placeholder="이름" value="<%=FName %>"/>
                                 
                            </li>
                            <li>
                                <label for="qna-title">연락처</label>
                                <input type="text" style="width:100px;height:45px;" id="tel1" name="tel1"  title="연락처를 입력해주세요"  maxlength=3 value="<%=tel1 %>"/>
								<input type="text" style="width:100px;height:45px;" id="tel2" name="tel2"  title="연락처를 입력해주세요"  maxlength=4 value="<%=tel2 %>"/>	
								<input type="text" style="width:100px;height:45px;" id="tel3" name="tel3"  title="연락처를 입력해주세요"  maxlength=4 value="<%=tel3 %>"/>
                            </li> 
                        </ul>
                        <label for="">이메일</label>
                       		<input type="text" name="email" id="email" style="width:200px" value="<%=email1 %>"/>  
						
					
						<label for="">게시글 비밀번호</label>
							<input type="password" id="password" name="password" style="width:150px;height:45px;border: 2px solid #eee;" maxlength="12" title="비밀번호를 입력해주세요" />
							
						<label for="">제목</label>
                       		<input type="text" id="title" name="title" style="width:894px;height:45px;border: 2px solid #eee;" title="제목을 입력해주세요" />	
								
                        <label for="">내용</label>
                       		<!-- <textarea name="qna-cont" id="qna-cont"></textarea> -->
                        	<!-- <textarea id="contents" name="contents" title="내용을 입력해주세요" style="width:100%; height:300px;"></textarea> -->
                        	<textarea name="contents" id="contents" 
                        			style="resize: none; width: 100%;height: 400px;padding: 10px 10px; border: 2px solid #eee;font-size: 14px;
    								color: #454545;font-family: 'Noto Sans KR', sans-serif;font-weight: 300;letter-spacing: 0.5px;"></textarea>
                        <label for="">첨부파일</label>
                        	<input type="file" id="filename_tmp" name="filename_tmp" style="width:894px;height:45px;border: 2px solid #eee;" title="첨부파일을 업로드 해주세요." />
                        		
                       <!--  <ul class="base_info clear">
                            <li>
                                <label for="qna-title">작성자 이름</label>
                                <input type="text" id="qna-title" name="qna-title">
                            </li>
                            <li>
                                <label for="qna-title">비밀번호</label>
                                <input type="text" id="qna-title" name="qna-title">
                            </li>
                        </ul>
                        <label for="qna-title">이메일</label>
                        <input type="text" id="email" name="email" placeholder="회원님의 질문을 이메일로 발송해드립니다.">-->
                        <!-- <input type="submit" value="질문하기" class="btns" href="javascript:$('#frm').submit();"> --> 
                        
                       		<div>
								<input type="submit" class="btns" href="javascript:$('#frm').submit();"></a> 
								<!-- <a class="btns" href="#" onclick="goSave();"><strong>저장</strong></a> -->
							</div>
						
                        <!--======== 필요값 히든처리================ -->
                        <input type="hidden" name="cmd" value="write" />
						<input type="hidden" name="reply" value="0" />
						<input type="hidden" name="send_email" value="0" />
						
						<% if(member_vo == null){ %>
						<input type="hidden" name="member_pk" value="0" />
						<% } else { %>
						<input type="hidden" name="member_pk" value="<%=member_vo.getNo() %>" />
						<% } %>
                    </form>
                </div>
            </div>
        </div>
    </div>
    	<jsp:include page="/footer" flush="true"/>
</body>
</html>