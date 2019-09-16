package room.res;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.member.MemberService;
import board.member.MemberVO;
import manage.admin.AdminVO;
import property.SiteProperty;
import room.RoomService;
import room.RoomVO;
import room.Room_imageVO;
import room.Room_optVO;
import util.DateUtil;
import util.Function;

@Controller
public class Room_resController {

	@Autowired
	Room_resService room_resService;
	
	@Autowired
	RoomService roomService;
	
	@Autowired
	MemberService memberService;
	
	/**
	 * 관리자 객실 예약 목록
	 * @param model
	 * @param vo
	 * @param rvo
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/room/res/index")
	public String index(Model model, Room_resVO vo, RoomVO rvo, HttpServletRequest req) throws Exception {
		int[] rowPageCount = room_resService.count(vo);
		if (req.getParameter("category") == null) {
			vo.setCategory(2);
		} else {
			vo.setCategory(Integer.parseInt(req.getParameter("category")));
		}
		ArrayList<Room_resVO> list = room_resService.index(vo);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		model.addAttribute("rvo", rvo);
		
		return "manage/room/res/index";
	}
	
	/**
	 * 관리자 객실 예약 목록_일자별
	 * @param model
	 * @param vo
	 * @param rvo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/room/res/list")
	public String list(Model model, Room_resVO vo, @RequestParam(value="yearMonth", required = false) String yearMonth) throws Exception {
		if ("".equals(yearMonth) || yearMonth == null) {
			yearMonth = DateUtil.getFullToday().substring(0,7);
		}
		String nextMonth = DateUtil.getYearMonth(yearMonth, 1);
		String prevMonth = DateUtil.getYearMonth(yearMonth, -1);
		
		ArrayList<HashMap> map = room_resService.list(yearMonth);
		
		model.addAttribute("vo", vo);
		model.addAttribute("map", map);
		model.addAttribute("yearMonth", yearMonth);
		model.addAttribute("nextMonth", nextMonth);
		model.addAttribute("prevMonth", prevMonth);
		
		return "manage/room/res/list";
	}
	
	/**
	 * 미예약 객실 수량 체크 (객실당 최대 10)
	 * @param model
	 * @param vo
	 * @param req
	 * @param rvo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/room/res/check")
	public String check(Model model, Room_resVO vo, HttpServletRequest req, RoomVO rvo) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("checkin", (String)req.getParameter("checkin"));
		map.put("checkout", (String)req.getParameter("checkout"));
		
		ArrayList<HashMap> map_c = room_resService.check(map);
		ArrayList<RoomVO> list_r = roomService.list(rvo);
		model.addAttribute("map_c", map_c);
		model.addAttribute("list_r", list_r);
		return "manage/room/res/check";
	}
	
	/**
	 * 관리자 객실 예약 등록
	 * @param model
	 * @param vo
	 * @param rvo
	 * @param ovo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/room/res/write")
	public String write(Model model, Room_resVO vo, RoomVO rvo, Room_optVO ovo) throws Exception {
		ArrayList<RoomVO> list = roomService.list(rvo);
		ArrayList<Room_optVO> list_o = roomService.list_opt(ovo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("rvo", rvo);
		model.addAttribute("ovo", ovo);
		model.addAttribute("list", list);
		model.addAttribute("list_o", list_o);
		
		return "manage/room/res/write";
	}
	
	/**
	 * 관리자 객실 예약 상세
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/room/res/read")
	public String read(Model model, Room_resVO vo) throws Exception {
		Room_resVO read = room_resService.read(vo);
		ArrayList<Room_opt_resVO> list_o = room_resService.list_opt(vo.getNo());
		
		model.addAttribute("read", read);
		model.addAttribute("vo", vo);
		model.addAttribute("list_o", list_o);
		
		return "manage/room/res/read";
	}
	
	/**
	 * 관리자 객실 예약 수정
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/room/res/edit")
	public String edit(Model model, Room_resVO vo) throws Exception {
		Room_resVO read = room_resService.read(vo);
		ArrayList<Room_opt_resVO> list_o = room_resService.list_opt(read.getNo());

		model.addAttribute("vo", vo);
		model.addAttribute("read", read);
		model.addAttribute("list_o", list_o);
		
		return "manage/room/res/edit";
	}
	
	/**
	 * 관리자 객실 예약 취소
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/room/res/cancel")
	public String cancel(Model model, Room_resVO vo) throws Exception {
		int r = room_resService.cancel(vo.getNo());
		model.addAttribute("value",r);
		return "include/return";
	}
	
	/**
	 * 등록, 수정, 예약 취소, 개별 삭제, 단체 삭제
	 * @param model
	 * @param vo
	 * @param request
	 * @param ovo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/room/res/process")
	public String process(Model model, Room_resVO vo, HttpServletRequest request, Room_opt_resVO ovo) throws Exception {
		model.addAttribute("vo", vo);
		model.addAttribute("ovo", ovo);
		
		if ("write".equals(vo.getCmd())) {
			int r = room_resService.insert(vo, ovo, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "/manage/room/res/index");
		} else if("edit".equals(vo.getCmd())) {
			int r = room_resService.update(vo);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", "/manage/room/res/read?no="+vo.getNo());
		} else if("cancel".equals(vo.getCmd())) {
			int r = room_resService.cancel(vo.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 취소되었습니다.", "취소실패"));
			model.addAttribute("url", "/manage/room/res/read?no="+vo.getNo());
		} else if("delete".equals(vo.getCmd())) {
			int r = room_resService.delete(vo);
			model.addAttribute("code", "alertMessageUrl"); 
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패")); 
			model.addAttribute("url", vo.getTargetURLParam("/manage/room/res/index", vo, 0));
		} else if("groupDelete".equals(vo.getCmd())) {
			int r = room_resService.groupDelete(request); 
			model.addAttribute("code", "alertMessageUrl"); 
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패")); 
			model.addAttribute("url", vo.getTargetURLParam("/manage/room/res/index", vo, 0)); 
		}
		return "include/alert";
	}

	
	
	/**
	 * 객실 예약 - 추가 옵션
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/book/room/add_option")
	public String add_option(Model model, Room_optVO vo) throws Exception {
		ArrayList<Room_optVO> list_o = roomService.list_opt(vo);
		model.addAttribute("list_o", list_o);

		return "book/room/add_option";
	}
	
	/**
	 * 객실 예약 - 숙박 고객 정보 등록
	 * @param model
	 * @param vo
	 * @param mvo
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/book/room/personal_info")
	public String personal_info(Model model, Room_optVO vo, MemberVO mvo, HttpSession session) throws Exception {
		if (memberService.loginCheck(mvo)) {
			MemberVO memberInfo = memberService.getLoginSessionInfo(mvo);
			memberInfo.setIp(mvo.getIp());
			
			session.setAttribute("memberInfo", memberInfo);	// 세션 저장
		}
		return "book/room/personal_info";
	}
	
	/**
	 * 객실 예약 - 예약 확정
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/book/room/confirm_room")
	public String confirm_room(Model model, Room_resVO vo, HttpServletRequest req) throws Exception {
		int r = Integer.parseInt(req.getParameter("r"));
		vo.setNo(r);
		Room_resVO read = room_resService.read(vo);
		ArrayList<Room_opt_resVO> list_o = room_resService.list_opt(r);
		
		String[] start = read.getCheckin().split("-");
		String[] end = read.getCheckout().split("-");
		String checkin = "";
		String checkout = "";
		
		for(int i=0; i<start.length; i++) {
			checkin += start[i];
			checkout += end[i];
		}
		
		int day_stay = Integer.parseInt(String.valueOf(Function.diffOfDate(checkin, checkout)));
		
		model.addAttribute("day_stay", day_stay);
		model.addAttribute("read", read);
		model.addAttribute("list_o", list_o);
		return "book/room/confirm_room";
	}

	/**
	 * 객실 검색 - 객실별 조회
	 * @param model
	 * @param rvo
	 * @param rivo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/book/room/check_room")
	public String check_room(Model model, RoomVO rvo, Room_imageVO rivo) throws Exception {
		ArrayList<RoomVO> list_r = (ArrayList<RoomVO>)roomService.list(rvo);
		
		model.addAttribute("list_r", list_r);
		return "book/room/check_room";
	}

	/**
	 * 객실 검색 - 요금별 조회
	 * @param model
	 * @param rvo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/book/room/price_room")
	public String price_room(Model model, RoomVO rvo) throws Exception {
		ArrayList<RoomVO> list_rp = (ArrayList<RoomVO>)roomService.list_price(rvo);
		
		model.addAttribute("list_rp", list_rp);
		return "book/room/price_room";
	}
	
	/**
	 * 객실 검색 - 객실별 조회 - 미예약 객실 수량 체크
	 * @param model
	 * @param vo
	 * @param req
	 * @param rvo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/book/room/check_cr")
	public String check_cr(Model model, Room_resVO vo, HttpServletRequest req, RoomVO rvo) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("checkin", (String)req.getParameter("checkin"));
		map.put("checkout", (String)req.getParameter("checkout"));
		
		ArrayList<HashMap> map_c = room_resService.check(map);
		ArrayList<RoomVO> list_r = roomService.list(rvo);
		model.addAttribute("map_c", map_c);
		model.addAttribute("list_r", list_r);
		return "book/room/check_cr";
	}
	
	/**
	 * 객실 검색 - 요금별 조회 - 미예약 객실 수량 체크
	 * @param model
	 * @param vo
	 * @param req
	 * @param rvo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/book/room/check_pr")
	public String check_pr(Model model, Room_resVO vo, HttpServletRequest req, RoomVO rvo) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("checkin", (String)req.getParameter("checkin"));
		map.put("checkout", (String)req.getParameter("checkout"));
		
		ArrayList<HashMap> map_c = room_resService.check_pr(map);
		ArrayList<RoomVO> list_rp = roomService.list_price(rvo);
		model.addAttribute("map_c", map_c);
		model.addAttribute("list_rp", list_rp);
		return "book/room/check_pr";
	}
	
	/**
	 * detail_sub에서 객실 검색 시, 미예약 객실 수량 체크
	 * @param model
	 * @param vo
	 * @param req
	 * @param rvo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/book/room/check_ds")
	public String check_ds(Model model, Room_resVO vo, HttpServletRequest req, RoomVO rvo) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("no", req.getParameter("no"));
		map.put("checkin", (String)req.getParameter("checkin"));
		map.put("checkout", (String)req.getParameter("checkout"));
		
		ArrayList<HashMap> map_c = room_resService.check_ds(map);
		model.addAttribute("map_c", map_c);
		return "book/room/check_ds";
	}

	/**
	 * 객실 예약 등록
	 * @param model
	 * @param vo
	 * @param orvo
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/room/res/submit")
	public String submit(Model model, Room_resVO vo, Room_opt_resVO orvo, HttpServletRequest req) throws Exception {
		
		int r = room_resService.insert(vo, orvo, req);
		
		return "redirect:/book/room/confirm_room?r="+r;
	}
	
	/**
	 * 비회원 객실 예약 검색
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/book/room/guest")
	public String guest(Model model, Room_resVO vo) throws Exception {
		
		return "book/room/guest";
	}
	
	/**
	 * 비회원 객실 예약 조회
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/book/room/guest_res")
	public String guest_res(Model model, Room_resVO vo) throws Exception {
		Room_resVO mdata = room_resService.nonmember(vo);
		
		if(mdata == null) {
			model.addAttribute("code", "alertMessageUrl"); 
			model.addAttribute("message", Function.message(1, "일치하는 정보가 존재하지 않습니다.", "삭제실패")); 
			model.addAttribute("url", vo.getTargetURLParam("/book/room/guest", vo, 0));
		} else {
			ArrayList<Room_opt_resVO> odata = room_resService.list_opt(mdata.getNo());
			model.addAttribute("mdata", mdata);
			model.addAttribute("odata", odata);
			
			return "book/room/guest_res";
		}
		return "include/alert";
	}
	
	/**
	 * 비회원 객실 예약 취소
	 * @param model
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/book/room/guest_res/cancel")
	public String guest_cancel(Model model, Room_resVO vo) throws Exception {
		int r = room_resService.cancel(vo.getNo());
		model.addAttribute("value",r);
		return "index";
	}

}
