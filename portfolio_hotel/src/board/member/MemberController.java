package board.member;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.qna.QnaService;
import board.qna.QnaVO;
import dining_res.Dining_resService;
import dining_res.Dining_resVO;
import pkg.res.Pkg_resService;
import pkg.res.Pkg_resVO;
import room.res.Room_opt_resVO;
import room.res.Room_resService;
import room.res.Room_resVO;
import util.Function;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private Pkg_resService pkg_resService;
	
	@Autowired
	private Room_resService room_resService;
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private Dining_resService dining_resService;
	
//=======================================================관리자=================================================================================	
	
	/**
	 * 관리자 회원 목록
	 * @param model
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/member/index")
	public String index(Model model, MemberVO param) throws Exception {
		int[] rowPageCount = memberService.count(param);
		ArrayList<MemberVO> list = memberService.list(param);

		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);

		return "manage/member/index";
	}

	/**
	 * 관리자 회원 상세
	 * @param model
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/member/read")
	public String read(Model model, MemberVO param) throws Exception {
		MemberVO data = memberService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);

		return "manage/member/read";
	}
	
	/**
	 * 관리자 회원 수정
	 * @param model
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/member/edit")
	public String edit(Model model, MemberVO param) throws Exception {
		MemberVO data = memberService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);

		return "manage/member/edit";
	}
	
	/**
	 * 사용자 회원 수정 
	 * @param model
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/member/memberEdit")
	public String memberEdit(Model model, MemberVO param) throws Exception {
		MemberVO data = memberService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);

		return "manage/member/memberEdit";
	}
	
	/**
	 * 사용자 회원 마이페이지
	 * @param model
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/member/memberMypage")
	public String memberMypage(Model model, MemberVO param) throws Exception {
		MemberVO data = memberService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);

		return "manage/member/memberMypage";
	}
	
	/**
	 * 사용자 메인페이지 회원 정보
	 * @param model
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/member/memberIndex")
	public String memberIndex(Model model, MemberVO param) throws Exception {
		MemberVO data = memberService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);

		return "manage/member/memberIndex";
	}
	
	/**
	 * 사용자 회원 탈퇴
	 * @param model
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/member/memberDelete")
	public String memberDelete(Model model, MemberVO param) throws Exception {
		MemberVO data = memberService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);

		return "manage/member/memberDelete";
	}
	
//	@RequestMapping("/manage/member/pwedit")
//	public String PWedit(Model model, MemberVO param) throws Exception {
//		MemberVO data = memberService.read(param.getNo());
//		model.addAttribute("data", data);
//		model.addAttribute("vo", param);
//
//		return "manage/member/pwedit";
//	}

	/**
	 * 관리자 회원 등록
	 * @param model
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/member/write")
	public String write(Model model, MemberVO param) throws Exception {
		model.addAttribute("vo", param);

		return "manage/member/write";
	}
	
	/**
	 * 관리자 회원 로그인
	 * @param model
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/member/loginForm")
	public String loginForm(Model model, MemberVO param) throws Exception {
		model.addAttribute("vo", param);

		return "manage/member/loginForm";
	}
	
	@RequestMapping("/manage/member/idcheck")
	public String idcheck(Model model, MemberVO param) throws Exception {
		model.addAttribute("vo", param);
		int value = memberService.idcheck(param);

		model.addAttribute("value", value);
		
		return "include/return";
	}
	
	@RequestMapping("/manage/member/idSrc")
	public String idSrc(Model model, MemberVO param) throws Exception {
		model.addAttribute("vo", param);

		return "manage/member/idSrc";
	}
	
	@RequestMapping("/manage/member/pwdSrc")
	public String pwdSrc(Model model, MemberVO param) throws Exception {
		model.addAttribute("vo", param);

		return "manage/member/pwdSrc";
	}

	/**
	 * 관리자 아이디 중복체크 사용자에서 저장 시 ajax로 체크
	 * 
	 * @param model
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/member/loginCheck")
	public String loginCheck(Model model, MemberVO param, HttpSession session) throws Exception {
		model.addAttribute("vo", param);

		return "manage/member/loginCheck";
	}
	
	
	
	
	
	
//	@RequestMapping("/manage/member/loginCheck")
//	public String loginCheck(Model model, MemberVO param, HttpSession session) throws Exception {
//		boolean result = memberService.loginCheck(param,session);
//		model.addAttribute("vo", param);
//		
//
//		return "manage/member/loginCheck";
//	}
//	
//	@RequestMapping("/manage/member/loginCheck")
//	public String loginCheck(Model model, MemberVO param) throws Exception {
//		model.addAttribute("vo", param);
//		int value = memberService.loginCheck(param);
//
//		model.addAttribute("value", value);
//		
//		return "include/return";
//	}
	
	
	/**
	 * 회원가입 이메일 체크
	 * @param model
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/member/emailcheck")
	public String emailcheck(Model model, MemberVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);

		int value = memberService.emailcheck(request.getParameter("email"));

		model.addAttribute("value", value);

		return "include/return";
	}
	
	/**
	 * 회원가입 비밀번호 체크
	 * @param model
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/member/pwdcheck")
	public String pwdcheck(Model model, MemberVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);

		int value = memberService.pwdcheck(request.getParameter("pwd"));

		model.addAttribute("value", value);

		return "include/return";
	}
	
	/**
	 * 회원가입 비밀번호 확인 체크
	 * @param model
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/member/samePwdcheck")
	public String samePwdcheck(Model model, MemberVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);

		int value = memberService.samePwdcheck(request.getParameter("samePwdcheck"));

		model.addAttribute("value", value);

		return "include/return";
	}
	
//=======================================================회원=================================================================================
	
	
	
	@RequestMapping("/membership/sign_in")  //로그인 페이지
	public String sign_in(Model model, MemberVO param) throws Exception {
		model.addAttribute("vo", param);

		return "membership/sign_in";
	}
	
	@RequestMapping("/membership/find_email")  //이메일 찾기 페이지
	public String find_email(Model model, MemberVO param) throws Exception {
		model.addAttribute("vo", param);
		

		return "membership/find_email";
	}
	
	@RequestMapping("/membership/find_pw")  //비밀번호 찾기 페이지
	public String find_pw(Model model, MemberVO param) throws Exception {
		model.addAttribute("vo", param);

		return "membership/find_pw";
	}
	
	
	
	@RequestMapping("/membership/find_pw_change")  //비밀번호 찾기/변경 페이지
	public String find_pw_change(Model model, MemberVO param,int r) throws Exception {
		MemberVO data = memberService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		model.addAttribute("r", r);

		return "membership/find_pw_change";
	}

	
	@RequestMapping("/membership/mypage")
	public String mypage(Model model, MemberVO param, Pkg_resVO prparam, Room_resVO rvo, QnaVO qparam, HttpSession session, Dining_resVO drvo) throws Exception {
		/*고객 정보*/
		MemberVO data = memberService.read(param.getNo());
		MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
		
		/*패키지 예약*/
		prparam.setMember_pk(memberInfo.getNo());
		int[] rowPageCount = pkg_resService.count(prparam);
		ArrayList<Pkg_resVO> plist = pkg_resService.list(prparam);
		
		/*객실 예약*/
		ArrayList<Room_resVO> mdata = room_resService.read_list(memberInfo.getNo());
		ArrayList<ArrayList<Room_opt_resVO>> modata = new ArrayList<ArrayList<Room_opt_resVO>>();
		
		for(int i=0; i<mdata.size(); i++) {
			ArrayList odata = new ArrayList();
			ArrayList<Room_opt_resVO> olist = room_resService.list_opt(mdata.get(i).getNo());
			
			for(int j=0; j<olist.size(); j++) {
				odata.add(olist.get(j));
			}
			modata.add(odata);
		}
		
		/*다이닝 예약*/
		ArrayList<Dining_resVO> ddata = dining_resService.read_list(memberInfo.getNo()); 
		
		/*포인트*/
		ArrayList<HashMap> pdata = room_resService.point(memberInfo.getNo());
		
		// ============= qna ======================== 
		qparam.setMember_pk(memberInfo.getNo());
		int[] qrowPageCount = qnaService.count(qparam);
		ArrayList<QnaVO> qlist = qnaService.Mylist(qparam);
		// ============= qna ======================== 
		
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		model.addAttribute("memberInfo", memberInfo);
		
		/*패키지 예약*/
		model.addAttribute("prparam",prparam);
		
		model.addAttribute("ptotCount", rowPageCount[0]);
		model.addAttribute("ptotPage", rowPageCount[1]);
		model.addAttribute("plist",plist);
		
		/*객실 예약*/
		model.addAttribute("mdata", mdata);
		model.addAttribute("modata", modata);
		
		/*다이닝 예약*/
		model.addAttribute("ddata", ddata);
		
		/*포인트*/
		model.addAttribute("pdata", pdata);
		
		// ============= qna ======================== 
		model.addAttribute("qtotCount", qrowPageCount[0]);
		model.addAttribute("qtotPage", qrowPageCount[1]);
		model.addAttribute("qlist",qlist);
		// ============= qna ======================== 
		
		return "membership/mypage";
	}
	
	@RequestMapping("/membership/mypage_resList")
	public String mypage_resList(Model model) throws Exception {
		
		return "membership/mypage_resList";
	}
	
	@RequestMapping("/membership/edit_account")
	public String edit_account(Model model, MemberVO param/* ,HttpSession session */) throws Exception {
//		MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
//		MemberVO data = memberService.read(memberInfo.getNo());
		MemberVO data = memberService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);

		return "/membership/edit_account";
	}
	
	@RequestMapping("/membership/edit_password")
	public String edit_password(Model model, MemberVO param) throws Exception {
		MemberVO data = memberService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);

		return "/membership/edit_password";
	}
	
	@RequestMapping("/membership/delete_account")
	public String delete_account(Model model, MemberVO param) throws Exception {
		MemberVO data = memberService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);

		return "/membership/delete_account";
	}
	
	@RequestMapping("/membership/choice_join")
	public String choice_join(Model model, MemberVO param) throws Exception {
		MemberVO data = memberService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);

		return "/membership/choice_join";
	}

	
	@RequestMapping("/membership/join")
	public String join(Model model, MemberVO param ) throws Exception {		
		model.addAttribute("vo", param);	
		return "/membership/join";
	}
	
	@RequestMapping("/membership/emailcheck") //회원 가입 이메일 체크
	public String membershipEmailcheck(Model model, MemberVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);

		int value = memberService.emailcheck(request.getParameter("email"));

		model.addAttribute("value", value);

		return "include/return";
	}
	
//	@RequestMapping("/membership/logindate")
//	public String logindate(Model model, MemberVO param, HttpSession session) throws Exception {
//		MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
//		MemberVO data = memberService.read(memberInfo.getNo());
//		model.addAttribute("data", data);
//		model.addAttribute("vo", param);
//	
//		return "membership/logindate";
//	}
	
	
	@RequestMapping("/membership/join_complete")
	public String join_complete(Model model, MemberVO param, HttpSession session) throws Exception {
		MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
		MemberVO data = memberService.read(memberInfo.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
	
		return "membership/join_complete";
	}
	
	@RequestMapping("/membership/join_insert")
	public String join_insert(Model model, MemberVO param, HttpSession session) throws Exception {
		int r = memberService.insert(param);
		MemberVO data = memberService.read(r);
		session.setAttribute("memberInfo", data);
	
		return "redirect:/membership/join_complete";
	}
	
	@RequestMapping("/login/naver")
	public String naver(Model model, MemberVO param) throws Exception {
		
		model.addAttribute("vo", param);	
		return "/login/naver";
	}
	
	@RequestMapping("/login/naverCallback")
	public String naverCallback(Model model, MemberVO param) throws Exception {
		MemberVO data = memberService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);	
		return "/login/naverCallback";
	}

	/**
	 * 등록, 수정, 삭제 cmd값으로 구분해서 처리
	 * 
	 * @param model
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/member/process")
	public String process(Model model, MemberVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);

		if ("write".equals(param.getCmd())) {
			int r = memberService.insert(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");

		} else if ("edit".equals(param.getCmd())) {
			int r = memberService.update(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));

		} else if ("groupDelete".equals(param.getCmd())) {
			int r = memberService.groupDelete(request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 " + r + "건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));

		} else if ("delete".equals(param.getCmd())) {
			int r = memberService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}

		return "include/alert";
	}
	
	@RequestMapping("/membership/process")
	public String membershipProcess(Model model, MemberVO param, HttpServletRequest request, HttpSession session) throws Exception {
		model.addAttribute("vo", param);
		
		String returnJsp = "include/alert";

		if ("edit_account".equals(param.getCmd())) {
			int r = memberService.update(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다. 다시 로그인 해주세요.", "수정실패"));
			session.invalidate();
			model.addAttribute("url", param.getTargetURLParam("/index", param, 0));
			
		} else if ("edit_password".equals(param.getCmd())) {
			int r = memberService.password(param);
			
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다. 다시 로그인 해주세요.", "수정실패"));
			session.invalidate();
			model.addAttribute("url", param.getTargetURLParam("/index", param, 0));

		} else if ("delete_account".equals(param.getCmd())) {
			
			int r = memberService.delete_account(param);
			
			if (r > 0) {
				model.addAttribute("code", "alertMessageUrl");
				model.addAttribute("message", "정상적으로 탈퇴요청이 되었습니다.");
				session.invalidate();
				model.addAttribute("url", "/index");
			} else {
				model.addAttribute("code", "alertMessageBack");
				model.addAttribute("message", "비밀번호가 맞지 않습니다.");
			}
			
		} else if ("find_email".equals(param.getCmd())) {
			String r = memberService.find_email(param);  //r에 결과에 맞는 이메일이 들어감
			//System.out.println(r);
			String msg = "";
			
			if (r == null) {
				msg = "이메일이 존재하지 않습니다.";
			} else {
				msg = "당신의 이메일은 "+r+"입니다.";
			}
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", msg);			
			model.addAttribute("url", param.getTargetURLParam("find_email", param, 0));
			

		} else if("find_pw".equals(param.getCmd())){
			int r = memberService.find_pw(param);
			
			System.out.println(r);
			
			
			if(r > 0) {
				
				model.addAttribute("r", r);
				returnJsp = "redirect:find_pw_change";
				
			}
			else {
				model.addAttribute("code", "alertMessageBack");
				model.addAttribute("message","존재하지 않는 정보입니다.");
				
				
			}
			
		} else if ("find_pw_change".equals(param.getCmd())) {
			int r = memberService.find_pw_change(param);
			
			System.out.println(r);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다. 다시 로그인 해주세요.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("sign_in", param, 0));
		}


		return returnJsp;
	}

	@RequestMapping("/member/insertSns.do")
	public String insertSns(Model model, MemberVO param, HttpServletRequest request) throws Exception {
		int value = memberService.insertSns(param);
		model.addAttribute("value", value);
		return "include/return";
	}
	
	@RequestMapping("/member/snsCheck.do")
	public String snsCheck(Model model, MemberVO param, HttpServletRequest request, HttpSession session) throws Exception {
		MemberVO data = memberService.snsCheck(param);
		String value = "";
		if (data != null) {
			session.setAttribute("memberInfo", data);
			value = "ok";
		} else {
			value = "fail";
		}
		model.addAttribute("value", value);
		return "include/return";
	}
	
	
	
//	@RequestMapping("/manage/member/loginHistory")
//	public String loginHistory(Model model, MemberVO param) throws Exception {
//		int[] rowPageCount = memberService.countLoginHistory(param);
//		ArrayList<MemberVO> list = memberService.listLoginHistory(param);
//		
//		model.addAttribute("totCount", rowPageCount[0]);
//		model.addAttribute("totPage", rowPageCount[1]);
//		model.addAttribute("list", list);
//		model.addAttribute("vo", param);
//		
//		return "manage/member/loginHistory";
//	}
}
