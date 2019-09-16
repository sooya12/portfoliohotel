package board.member;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import property.SiteProperty;
import room.res.Room_resService;

@Controller
public class MainController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	Room_resService room_resService;

	@RequestMapping("/membership")
	public String main(Model model) throws Exception {

		return "membership";
	}

	/**
	 * 로그인
	 * @param model
	 * @param login_url
	 * @param login_param
	 * @param vo
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/membership/login")
	public String login(Model model, @RequestParam(value="login_url", required=false) String login_url, @RequestParam(value="login_param", required=false) String login_param, MemberVO vo, HttpSession session) throws Exception {
		if (memberService.loginCheck(vo)) {
			
			MemberVO memberInfo = memberService.getLoginSessionInfo(vo);
			
			memberInfo.setIp(vo.getIp());
			memberInfo.setLogindate(vo.getLogindate());
//			memberService.insertLoginHistory(memberInfo);		// 로그인히스토리 저장
			session.setAttribute("memberInfo", memberInfo);	// 세션 저장
			String redirectUrl = SiteProperty.INDEX_PAGE; // 시작페이지
			
			if(room_resService.count_res(memberInfo.getNo()) > 0) {
				HashMap map_m = room_resService.count_use(memberInfo.getNo());
				if(map_m.get("useNumber") != null && map_m.get("dayStay") != null) {
					int useN = Integer.parseInt(String.valueOf(map_m.get("useNumber"))); //예약 횟수			
					int dayS = Integer.parseInt(String.valueOf(map_m.get("dayStay"))); //숙박일수
					int grade = 0;
					//classic
					if((useN >= 1 && useN < 3) || (dayS >= 3 && dayS < 6)) {
						grade = 1;
					//vip	
					} else if((useN >= 3 && useN < 7) || (dayS >= 6 && dayS < 12)) {
						grade = 2;
					//vvip
					} else if(useN >= 7 || dayS >= 12) {
						grade = 3;
					}
					
					MemberVO mvo = new MemberVO();
					mvo.setGrade(grade);
					mvo.setNo(memberInfo.getNo());
					memberService.grade(mvo);
				}
			}
			
			// 로그인 이전페이지 존재하는 경우
			if(login_url != null && !"".equals(login_url)) {
				redirectUrl = login_url;
				
				if(login_param != null && !"".equals(login_param)) {
					redirectUrl = redirectUrl + "?" + login_param;					
				}
			}
			
			return "redirect:"+redirectUrl;
		} else {
			model.addAttribute("code", "alertMessageBack");
			model.addAttribute("message", "이메일 또는 비밀번호가 올바르지 않습니다.");
			return "include/alert";
		}
	}
	
	/**
	 * 로그아웃 처리
	 * @param model
	 * @return
	 */
	@RequestMapping("/membership/logout")
	public String logout(Model model , HttpSession session) {
		//loginInfoProvider.get().remove();
		session.invalidate();
		model.addAttribute("code", "alertMessageUrl");
		model.addAttribute("message", "정상적으로 로그아웃 되었습니다.");
		model.addAttribute("url", "/index");
		
		return "include/alert";		
	}
}
