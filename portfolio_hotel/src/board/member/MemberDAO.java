package board.member;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.sun.org.apache.bcel.internal.generic.Select;

import db.SqlMapClientDAOSupport;


@Repository
public class MemberDAO extends SqlMapClientDAOSupport {

	public int count(MemberVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("member.count", param);
	}


	public ArrayList list(MemberVO param) throws SQLException {
		return (ArrayList) getSqlMapClient().queryForList("member.list", param);
	}

	public int insert(MemberVO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("member.insert", vo);
	}
	
	public int insertSns(MemberVO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("member.insertSns", vo);
	}

	public int update(MemberVO vo) throws SQLException {
		return getSqlMapClient().update("member.update", vo);
	}
	
	public int password(MemberVO vo) throws SQLException {
		return getSqlMapClient().update("member.password", vo);
	}
	
	public boolean checkPassword(MemberVO vo) throws SQLException {
		int cnt = (Integer)getSqlMapClient().queryForObject("member.checkPassword", vo);
		if (cnt > 0) return true; else return false;
	}
	
	public int logindate(MemberVO vo) throws SQLException{
		return getSqlMapClient().update("member.logindate", vo);
	}
	
	public int delete_account(MemberVO vo) throws SQLException {
		return getSqlMapClient().update("member.delete_account", vo);
	}

	public String find_email(MemberVO vo) throws SQLException{
		return (String)getSqlMapClient().queryForObject("member.find_email", vo);

	}
	
	public int checkInfo(MemberVO vo) throws SQLException{
		return (Integer)getSqlMapClient().queryForObject("member.checkInfo",vo);
	}	
		
	public int find_pw(MemberVO vo) throws SQLException{
		return (Integer)getSqlMapClient().queryForObject("member.find_pw",vo);
		
	}
	public int find_pw(int no) throws SQLException{
		return (Integer)getSqlMapClient().queryForObject("member.find_pw",no);
		
	}
	
	public int find_pw_change(MemberVO vo) throws SQLException{
		return getSqlMapClient().update("member.find_pw_change",vo);
	}
	
	
	public MemberVO snsCheck(MemberVO vo) throws SQLException{
		return (MemberVO)getSqlMapClient().queryForObject("member.snsCheck",vo);
		
	}
	


	/**
	 * 관리자 삭제
	 * 
	 * @param no
	 * @throws SQLException
	 */
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("member.delete", no);
	}

	/**
	 * 관리자 상세
	 * 
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public MemberVO read(int no) throws SQLException {
		return (MemberVO) getSqlMapClient().queryForObject("member.read", no);
	}
	
	public MemberVO loginForm(int no) throws SQLException {
		return (MemberVO) getSqlMapClient().queryForObject("member.loginForm", no);
	}
	public MemberVO memberEdit(int no) throws SQLException {
		return (MemberVO) getSqlMapClient().queryForObject("member.memberEdit", no);
	}
	
	


	/**
	 * 관리자 로그인체크 id, password로 조회 후 존재하면 true 리턴
	 * 
	 * @param id
	 * @param password
	 * @return boolean
	 * @throws SQLException
	 */
	public int loginCheck(MemberVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("member.loginCheck", param);
	}
	


	/**
	 * 관리자 아이디체크
	 * 
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	
	public int idcheck(MemberVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("member.idcheck", param);
	}
	
	public int emailcheck(String email) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("member.emailcheck", email);
	}
	public int pwdcheck(String pwd) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("member.pwdcheck", pwd);
	}
	
	public int samePwdcheck(String samePwd) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("member.samePwdcheck", samePwd);
	}

	public MemberVO getLoginSessionInfo(MemberVO param) throws SQLException {
		return (MemberVO) getSqlMapClient().queryForObject("member.loginSessionInfo", param);
	}
	
	/*-------------------------------------------------------------------------*/
	
	public void grade(MemberVO vo) throws SQLException {
		getSqlMapClient().update("member.grade", vo);
	}

	

	public static void main(String[] args) throws Exception {
		MemberDAO ad = new MemberDAO();
		MemberVO av = new MemberVO();
//		ad.count(av);
//		ad.list(av);
//		av.setEmail("hahc1");
//		av.setPassword("ha1234");
//		ad.loginCheck(av);
//		av.setName("하희철");
//		int no =ad.insert(av);
//		System.out.println(no);
	

	}

	
}
