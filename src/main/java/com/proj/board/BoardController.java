package com.proj.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.proj.board.svc.NoticeInf;
import com.proj.board.svc.PCInf;


@Controller
public class BoardController {
	
	@Autowired //게시판 DAO 객체
	private NoticeInf noticeInf;
	
	@Autowired // 멤버테이블 DAO 객체
	private PCInf pCInf;
	
	@RequestMapping("/noticeDel") //공지사항 글삭제 어드민전용
	public String noticeDel(Model model,HttpServletRequest req) {
		String num = req.getParameter("num");
		System.out.println(num);
		noticeInf.noticeDel(num);
		
		return "redirect:/notice";
	}
	
	@RequestMapping("/notice") // 공지사항 게시글 목록 불러오기
	public String notice(Model model,HttpServletRequest req,
			@RequestParam(defaultValue = "1") int pageNum,
            @RequestParam(defaultValue = "10") int pageSize
			) {
		
		model.addAttribute("NoticeList", noticeInf.NoticeList(pageNum,pageSize));
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pageSize", pageSize);
		int totalNoticeCount = noticeInf.getTotalNoticeCount(); // 전체 게시글 수
		int maxPage = (int) Math.ceil((double) totalNoticeCount / pageSize);
//		int maxPage = 100;
		model.addAttribute("maxPage", maxPage);
		return "notice/notice";
	}
	
	@RequestMapping("/write") // 공지사항 글쓰기 페이지
	public String noticeWrite(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
	    String uid = (String) session.getAttribute("uidSession");
	    
	    System.out.println(uid);
	    
	    model.addAttribute("uName", pCInf.uName(uid));
		
		return "notice/write";
	}
	
	@RequestMapping("/writeProc") // 공지사항 글쓰기 로직
	public String noticeWriteProc(Model model,HttpServletRequest req) {
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String uName = req.getParameter("uName");
		
		System.out.println(title);
		System.out.println(content);
		System.out.println(uName);
		
		try {
			noticeInf.noticeWrite(title,content,uName);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	
		
		return "redirect:/notice";
	}
	
	@RequestMapping("/result") // 글자세히보기
	public String result(Model model, HttpServletRequest req) {
		String num = req.getParameter("num");
		System.out.println(num);
		try {
			model.addAttribute("noticeList",noticeInf.result(num));
			model.addAttribute("num",num);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println(noticeInf.result(num));
		
		return "notice/result";
	}
	
	@RequestMapping("/readCnt") //조회수 증가
	public String readCntmtd (Model model,HttpServletRequest req) {
		String num = req.getParameter("num");
		System.out.println(num);
		try {
			noticeInf.readCnt(num);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "";
	}
	@RequestMapping("/noticeSearch") //공지사항 검색기능
	public String noticeSearch(Model model,HttpServletRequest req) {
		String searchName = req.getParameter("searchName");
		System.out.println(searchName);
		  try {
		   if (searchName == null || searchName == ""){
//			  model.addAttribute("NoticeList",noticeInf.NoticeList());
		  }	  else  if (searchName != null) {
		        	model.addAttribute("NoticeList",noticeInf.noticeSearch(searchName));
		    }
		   
		  } catch (Exception e) {
		        System.out.println(e.getMessage());
		    }
		return "notice/notice";
	}
	
	//FAQ 게시판
	@RequestMapping("/mainnotice") // 전체 고객센터 게시판
	public String MainNotice() {

		return "/notice/MainNotice";
	}
	
	
	
	
	//FAQ 게시판
	@RequestMapping("/FAQ")
	public String QnA() {

		return "/notice/FAQ";
	}
	
	
	
}
