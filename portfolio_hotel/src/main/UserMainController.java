package main;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dining.DiningService;
import dining.DiningVO;
import pkg.PkgService;
import pkg.PkgVO;
import pkg.res.Pkg_resService;
import room.RoomService;
import room.RoomVO;

@Controller
public class UserMainController {
	
	@Autowired
	RoomService roomService;
	
	@Autowired
	PkgService pkgService;
	
	@Autowired
	Pkg_resService pkg_resService;
	
	@Autowired
	DiningService diningService;

	
	@RequestMapping("/header_menu")
	public String header_menu(Model model, PkgVO param, RoomVO rvo, DiningVO dvo) throws Exception {
		param.setTablename("pkg");
		int[] rowPageCount = pkgService.count(param);
		ArrayList<PkgVO> plist = pkgService.list2(param);
		
		model.addAttribute("ptotCount", rowPageCount[0]);
		model.addAttribute("ptotPage", rowPageCount[1]);
		model.addAttribute("plist", plist);
		model.addAttribute("pvo", param);
		
		ArrayList<RoomVO> rlist = roomService.list(rvo);
			
		model.addAttribute("rlist", rlist);
		
		ArrayList<DiningVO> dlist = diningService.list_asc(dvo);
		
		model.addAttribute("dlist", dlist);
		
		return "header_menu";
	}
	
	@RequestMapping("/footer")
	public String footer(Model model) throws Exception {
		return "footer";
	}

	@RequestMapping("/index")
	public String index(Model model, RoomVO rvo, DiningVO dvo) throws Exception {
		ArrayList<RoomVO> list_r = roomService.list(rvo);
		
		model.addAttribute("list_r", list_r);
		
		ArrayList<DiningVO> list_d = diningService.list_asc(dvo);
		
		model.addAttribute("list_d", list_d);
		return "index";
	}
	
	@RequestMapping("/meeting_wedding/meeting")
	public String meeting(Model model) throws Exception {
		
		return "meeting_wedding/meeting";
	}
	
	@RequestMapping("/meeting_wedding/wedding")
	public String wedding(Model model) throws Exception {
		
		return "meeting_wedding/wedding";
	}
	
	@RequestMapping("/meeting_wedding/familyparty")
	public String familyparty(Model model) throws Exception {
		
		return "meeting_wedding/familyparty";
	}
	
	@RequestMapping("/facilities")
	public String facilities(Model model) throws Exception {
		
		return "facilities";
	}
	
	@RequestMapping("/hotel_info")
	public String hotel_info(Model model) throws Exception {
		
		return "hotel_info";
	}
	
}
