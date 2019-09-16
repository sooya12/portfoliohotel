package board.member;

import java.sql.SQLException;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import manage.admin.AdminVO;
import util.Page;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDao; //주입을 받음
	
	public int[] count(MemberVO param) throws SQLException {
		int rowCount = memberDao.count(param);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(MemberVO param) throws SQLException {
		ArrayList list = memberDao.list(param);
		return list;
	}

	public int insert(MemberVO vo) throws SQLException {
		int no = memberDao.insert(vo);
		return no;
	}
	
	public int insertSns(MemberVO vo) throws SQLException {
		int no = memberDao.insertSns(vo);
		return no;
	}

	public int update(MemberVO vo) throws SQLException {
		int cnt = memberDao.update(vo);
		return cnt;
	}
	
	public int password(MemberVO vo) throws SQLException {
		int cnt = memberDao.password(vo);
		return cnt;
	}
	
	public int logindate(MemberVO vo) throws SQLException{
		int cnt = memberDao.logindate(vo);
		return cnt;
	}
	
	public int delete_account(MemberVO vo) throws SQLException {
		int cnt = 0;
		if (memberDao.checkPassword(vo)) {
			cnt = memberDao.delete_account(vo);
		}
		return cnt;
	}
	
	public String find_email(MemberVO vo) throws SQLException {
		String cnt = memberDao.find_email(vo);
		return cnt;
	}
	
	public int find_pw(MemberVO vo) throws SQLException {
		int cnt = memberDao.checkInfo(vo);
		
		return cnt;
	}
	
	public int find_pw_change(MemberVO vo)throws SQLException{
		int no = memberDao.find_pw_change(vo);
		return no;
	}
	
	
	public MemberVO snsCheck(MemberVO vo)throws SQLException{
		MemberVO no = memberDao.snsCheck(vo);
		return no;
	}


	public int delete(int no) throws SQLException {
		int cnt = memberDao.delete(no);
		return cnt;
	}

	public MemberVO read(int no) throws SQLException {
		MemberVO vo = memberDao.read(no);
		return vo;
	}
	
	public MemberVO mypage(int no) throws SQLException {
		MemberVO vo = memberDao.read(no);
		return vo;
	}
	
	public MemberVO memberIndex(int no) throws SQLException {
		MemberVO vo = memberDao.read(no);
		return vo;
	}
	
	public MemberVO memberEdit(int no) throws SQLException {
		MemberVO vo = memberDao.read(no);
		return vo;
	}

	public boolean loginCheck(MemberVO param) throws SQLException {
		int cnt = memberDao.loginCheck(param);
		boolean result = false;
		if (cnt == 1) {
			result = true;
		}
		return result;
	}

	public int idcheck(MemberVO param) throws SQLException {
		return memberDao.idcheck(param);
	}
	
//	public int join(MemberVO param) throws SQLException {
//		return memberDao.insert(param);
//	}

	public MemberVO getLoginSessionInfo(MemberVO param) throws SQLException {
		MemberVO vo = memberDao.getLoginSessionInfo(param);
		vo.setIp(param.getIp());	// 아이피 추가
		//vo.setLogindate(param.getLogindate());
		return vo;
	}
	

//	public int[] countLoginHistory(MemberVO param) throws SQLException {
//		int rowCount = memberDao.countLoginHistory(param);
//		int[] rowPageCount = new int[2];
//		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
//		rowPageCount[0] = rowCount;
//		rowPageCount[1] = pageCount;
//		return rowPageCount;
//	}
//
//	public ArrayList listLoginHistory(MemberVO param) throws SQLException {
//		ArrayList list = memberDao.listLoginHistory(param);
//		return list;
//	}
//
//	public void insertLoginHistory(MemberVO param) throws SQLException {
//		memberDao.insertLoginHistory(param);
//	}

	public int emailcheck(String email) throws SQLException {
		return memberDao.emailcheck(email);
		
	}
	
	public int pwdcheck(String pwd) throws SQLException {
		return memberDao.pwdcheck(pwd);
		
	}
	public int samePwdcheck(String samePwd) throws SQLException {
		return memberDao.samePwdcheck(samePwd);
		
	}

	public int groupDelete(HttpServletRequest request) throws SQLException {
		String[] no = request.getParameterValues("no");
		int r = 0;
		for (int i=0; i<no.length; i++) {
			int nos = Integer.parseInt(no[i]);
			r += memberDao.delete(nos);
		}
		return r;
	}

	public void grade(MemberVO vo) throws SQLException {
		memberDao.grade(vo);
	}
	
}
