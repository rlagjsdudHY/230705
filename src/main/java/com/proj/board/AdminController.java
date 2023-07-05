package com.proj.board;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proj.board.svc.PCInf;

@Controller
public class AdminController {
	
	@Autowired // 멤버테이블 DAO 객체
	private PCInf pCInf;
	
	// admin메인페이지
	@RequestMapping("/adminMain") 
	public String adminMain(HttpServletRequest req) {
		HttpSession session = req.getSession();
	    String uid = (String) session.getAttribute("uidSession");
		if (uid == null || (!uid.equals("admin"))) {
            // 접근 권한이 없는 경우 처리
	 
		return "redirect:/main";
        }
		return "/admin/admin";
	}
	
	// 회원목록 관리
	@RequestMapping("/memList") 
	public String memList(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
	    String uid = (String) session.getAttribute("uidSession");
		if (uid == null || (!uid.equals("admin"))) {
            // 접근 권한이 없는 경우 처리
	 
		return "redirect:/main";
        }
		model.addAttribute("memList", pCInf.memList());
		
		return "/admin/memList";
	}

	// 회원목록 개별 삭제 실행(어드민 페이지)
	@RequestMapping("/memDel")
	public String memDel(HttpServletRequest req) throws Exception {
		
		String num="";
		
		try {
			req.setCharacterEncoding("UTF-8");
			num = req.getParameter("num");
			
			// 서비스 호출
			pCInf.memDel(num);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "redirect:adminMain";
	}	
	
	// 회원 수정페이지(어드민)
	@RequestMapping("/AdMemModi")
	public String AdMemModi(Model model, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
	    String uid = (String) session.getAttribute("uidSession");
		if (uid == null || (!uid.equals("admin"))) {
            // 접근 권한이 없는 경우 처리
	 
		return "redirect:/main";
        }
		
		try {
			req.setCharacterEncoding("UTF-8");
			int num = Integer.parseInt(req.getParameter("num"));
			// 서비스 호출
			model.addAttribute("AdMemModi", pCInf.AdMemModi(num));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "/admin/adMemModi";
	}
	
	
	// 회원 수정(어드민)
	@RequestMapping("/AdMemModiProc") 
	public String AdMemModiProc(HttpServletRequest req) { 
		
		String num = "";
		
		try {
			req.setCharacterEncoding("UTF-8");
			String uname = req.getParameter("uname"); 
			String phone = req.getParameter("phone"); 
			String address = req.getParameter("address"); 
			String email = req.getParameter("email"); 
			num = req.getParameter("num");
	  
	 
			Map<String, String> map = new HashMap<>(); 
			map.put("item1", uname);
			map.put("item2", phone); 
			map.put("item3", address); 
			map.put("item4", email);
			map.put("item5", num);
	
			pCInf.AdMemModiProc(map); 
		} catch (Exception e) {
			System.out.println(e.getMessage()); 
		}
	 
	 return "redirect:/adminMain"; 
	 }
	 
}
