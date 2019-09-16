package property;

public class SiteProperty {
	/*
	 * 기본정보
	 */
	/**
	 * 업체명
	 */
	public static final String 	COMPANY_NAME			= "Portfolio Hotel";
	/**
	 * 관리자 시작페이지
	 */
	public static final String	INDEX_PAGE				= "/index";
	
	public static final String MEMBERINDEX				="/manage/member/index";
			
//			"/manage/member/memberIndex";
	/**
	 * 보안서버인증서(SSL)사용여부
	 */
	public static final boolean	SSL_USE					= false;
	/**
	 * URL http
	 */
	public static final String 	COMPANY_URL				= "http://localhost:8080";
//	public static final String 	COMPANY_URL_MO			= "http://m.bigbang";

	/**
	 * URL https SSL
	 */
	public static final String 	COMPANY_SSL_URL			= "https://localhost:8080";
	public static final String 	COMPANY_SSL_URL_MO		= "https://localhost:8080";
	
	/**
	 * JSP 파일경로위치
	 */
	public static final String	JSP_HOME				= "/WEB-INF/view";

	/**
	 * mysql 비밀번호 암호화 방식
	 * password, old_password, md5, sha
	 */
	public static final String	DB_ENCRYPTION			= "password";
	/**
	 * 대표 이메일
	 */
	public static final String 	COMPANY_EMAIL			= "withsky999@gmail.com";

	/*
	 * 메일관련
	 */
	/**
	 * 메일서버
	 */
	public static final String 	SMTP_HOST				= "smtp.naver.com";
	/**
	 * 메일포트
	 */
	public static final String 	SMTP_PORT				= "465";
	/**
	 * 메일계정 아이디
	 */
	public static final String 	SMTP_USER				= "joonoh94";
	/**
	 * 메일계정 패스워드
	 */
	public static final String 	SMTP_PASSWORD			= "fnehfvm890";
	/**
	 * 이메일 기본 폼
	 */
	public static final String 	EMAIL_FORM				= "/include/emailForm.jsp";

	/**
	 * 에디터 이미지 업로드 경로
	 */
	public static final String	EDITOR_UPLOAD_PATH		= "/upload/editor/";

	/**
	 * 에디터 이미지 업로드 용량제한
	 */
	public static final int		EDITOR_MAXSIZE 			= 10*1024*1024;

	/**
	 * 처리페이지 (process.jsp)에서 레퍼러(이전페이지값) 비교여부
	 */
	public static final boolean	CHECK_REFERER			= true;

	public static final String	REFERER_URL				= "localhost";

	public static boolean getCHECK_REFERER(){
		return CHECK_REFERER;
	}
	
	public static String getREFERER_URL(){
		return REFERER_URL;
	}
	
	// 파일업로드 경로
		/**
		 * 로컬 홈디렉토리경로 (실서버 변경 필요)
		 */

	public static final String LOCAL_PATH = "D:\\java\\git\\java1904t1\\portfoliohotel\\WebContent";
	
	public static final String REAL_PATH = "/home/hosting_users/hyeon012/tomcat/webapps/ROOT";
	


	/**

	 * �������� ÷������ ���
=======
	 * 객실 사진 경로

	 */

	public static final String NOTICE_UPLOAD_PATH		= "/upload/notice/";
	
	public static final String DINING_UPLOAD_PATH		= "/upload/dining/";

	public static final String ROOM_UPLOAD_PATH         = "/upload/room/";
	
	/**
	 * 객실 옵션 사진 경로
	 */
	public static final String ROOM_OPT_UPLOAD_PATH = "/upload/room_opt/";
	
	
	public static final String QNA_UPLOAD_PATH = "/upload/qna/";

}
