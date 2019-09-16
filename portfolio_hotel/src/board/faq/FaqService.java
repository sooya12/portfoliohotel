package board.faq;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import db.SqlMapClientDAOSupport;
import util.Page;

@Service
public class FaqService extends SqlMapClientDAOSupport {
	
	@Autowired
	private FaqDAO faqDao;
	
	/**
	 * 총 개수
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	public int[] count(FaqVO param) throws SQLException {
		int rowCount = faqDao.count(param);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}
	
	/**
	 * 목록
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	public ArrayList list(FaqVO param) throws SQLException {
		ArrayList list = faqDao.list(param);
		return list;
	}
	
	/**
	 * 등록
	 * @param vo
	 * @param request
	 * @return
	 * @throws SQLException
	 * @throws IOException
	 */
	public int insert(FaqVO vo, HttpServletRequest request) throws SQLException, IOException {
		int no = faqDao.insert(vo);
		return no;
	}
	
	/**
	 * 수정
	 * @param vo
	 * @param request
	 * @return
	 * @throws SQLException
	 * @throws IOException
	 */
	public int update(FaqVO vo, HttpServletRequest request) throws SQLException, IOException {
		FaqVO data = faqDao.read(vo.getNo());
		int cnt = faqDao.update(vo);
		return cnt;
	}
	
	/**
	 * 삭제
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public int delete(int no) throws SQLException {
		int cnt = faqDao.delete(no);
		return cnt;
	}
	
	/**
	 * 상세
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public FaqVO read(int no) throws SQLException {
		FaqVO vo = faqDao.read(no);
		return vo;
	}
	
	/**
	 * 그룹 삭제
	 * @param request
	 * @return
	 * @throws SQLException
	 */
	public int groupDelete(HttpServletRequest request) throws SQLException {
		String[] no = request.getParameterValues("no");
		int r = 0;
		for (int i=0; i<no.length; i++) {
			int nos = Integer.parseInt(no[i]);
			r += faqDao.delete(nos);
		}
		return r;
	}

}
