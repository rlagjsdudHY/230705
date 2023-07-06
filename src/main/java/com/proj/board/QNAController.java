package com.proj.board;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.proj.board.dao.PCDao;
import com.proj.board.svc.QNAInf;

@Controller
public class QNAController {
	
	@Autowired
	private QNAInf qNAinf; //QNA DAO연결 객체
	
	@Autowired
	private PCDao pCDao; // 서비스없이 pcdao 직통연결
	
	@RequestMapping("/QNA") //QNA 게시글 불러오기
	public String QnAList(Model model,HttpServletRequest req,
			@RequestParam(defaultValue = "0") int pageNum,
            @RequestParam(defaultValue = "10") int pageSize) {
//		System.out.println(qNAinf.QNAList());
		try {
			model.addAttribute("QNAList", qNAinf.QNAList(pageNum,pageSize));
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("pageSize", pageSize);
			int totalNoticeCount = qNAinf.getTotalQNACount(); // 전체 게시글 수
			int maxPage = (int) Math.ceil((double) totalNoticeCount / pageSize);
//			int maxPage = 100;
			model.addAttribute("maxPage", maxPage);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "QNABoard/QNAlist";
	}
	
	@RequestMapping("/QNAwrite") //QNA 글쓰기 페이지
	public String QNAwrite(Model model,HttpServletRequest req) {
		HttpSession session = req.getSession();
	    String uid = (String) session.getAttribute("uidSession");
	    
	    System.out.println(uid);
		
		
		return "QNABoard/QNAwrite";
		
	}
	
	@RequestMapping("/QNAwriteProc") // QNA 글쓰기 로직
	public String noticeWriteProc(@RequestParam("fileName")  MultipartFile file, Model model,HttpServletRequest req) {
		String SAVEFILE = "D:\\AJR_20230126\\KSH\\silsp\\p11_SpringBoot\\ComputerSite\\bin\\main\\static\\uploadDir";
		String title = req.getParameter("title");
		String content = req.getParameter("content");
//		String uName = req.getParameter("uName");
		String fileName = "";
		HttpSession session = req.getSession();
	    String uid = (String) session.getAttribute("uidSession");
		
		System.out.println(title);
		System.out.println(content);
//		System.out.println(uName);
		
		String name = pCDao.QNAmodUname(uid);
		try {
			fileName = file.getOriginalFilename();
			File saveFile = new File(SAVEFILE, fileName);
		    file.transferTo(saveFile);
	     // 파일 저장이 성공한 경우에만 게시글 저장 로직을 실행하도록 수정
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println(fileName);
		qNAinf.QNAWrite(title,content,fileName,uid,name);
		
		return "redirect:/QNA";
	}
	@RequestMapping("/QNAresult") // 글자세히보기
	public String QNAresult(Model model, HttpServletRequest req) {
		String num = req.getParameter("num");
		HttpSession session = req.getSession();
	    String uid = (String) session.getAttribute("uidSession");
//		System.out.println(num);
	    //작성자 uid 반환 메서드 추가 팀프로젝트 남은기간 화이팅
	    String writer = (String)qNAinf.writerFind(num);
	    System.out.println(writer);
		try {
		 if (uid == null || (!uid.equals("admin") && !uid.equals(writer))) {
		            // 접근 권한이 없는 경우 처리
			 
				return "redirect:/QNA";
		        }
			
			model.addAttribute("QNAList",qNAinf.QNAresult(num));
			model.addAttribute("num",num);
			model.addAttribute("Commentlist",qNAinf.Commentlist(num));
			model.addAttribute("writer",writer);
			model.addAttribute("uid",uid);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
//		System.out.println(QNAresult.result(num));
		
		return "QNABoard/QNAresult";
	}
	
	@RequestMapping("/CommentInsert") //댓글등록
	public String CommentInsert(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
	    String uid = (String) session.getAttribute("uidSession");
	    String comment = req.getParameter("comment");
	    String num = req.getParameter("num"); // 페이지 리로딩용
//	    System.out.println(num);
//	    System.out.println(uid);
//		System.out.println(comment);
	    String uname = pCDao.QNAmodUname(uid);
		
		try {
			qNAinf.comment(num,comment,uname);
		} catch (Exception e) {
			
		}
		return "redirect:/QNAresult?num="+num;
	}
	
	@RequestMapping("/QNADel") //게시글 삭제
	public String QNADel(Model model, HttpServletRequest req) {
		String num = req.getParameter("num");
		System.out.println(num);
		try {
			qNAinf.QNAdel(num);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "redirect:/QNA";
	}
	
	@RequestMapping("/QNAmod")  // 게시글 수정페이지
	public String QNAmod(Model model ,HttpServletRequest req) {
		String num = req.getParameter("num");
		System.out.println(num);
		try {
			model.addAttribute("QNAmod",qNAinf.QNAmod(num));
			System.out.println(qNAinf.QNAmod(num));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "/QNABoard/QNAmod";
	}
	
	@RequestMapping("/QNAmodProc") //게시글 수정 로직
	public String QNAmodProc(@RequestParam("fileName")  MultipartFile file,Model model, HttpServletRequest req) {
		String SAVEFILE = "D:\\AJR_20230126\\KSH\\silsp\\p11_SpringBoot\\ComputerSite\\bin\\main\\static\\uploadDir";
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String num = req.getParameter("num");
		
//		String uName = req.getParameter("uName");
		String fileName = "";
		HttpSession session = req.getSession();
	    String uid = (String) session.getAttribute("uidSession");
		
		System.out.println(title);
		System.out.println(content);
//		System.out.println(uName);
		String name = pCDao.QNAmodUname(uid);
		System.out.println(name);
		try {
			fileName = file.getOriginalFilename();
			File saveFile = new File(SAVEFILE, fileName);
		    file.transferTo(saveFile);
	     // 파일 저장이 성공한 경우에만 게시글 저장 로직을 실행하도록 수정
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println(fileName);
		System.out.println(num);
		qNAinf.QNAmodProc(title,content,fileName,uid,name,num);
		
		return "redirect:/QNA";
	}
	@RequestMapping("/QNAreadCnt") //조회수 증가
	public String QNAreadCnt (Model model,HttpServletRequest req) {
		String num = req.getParameter("num");
		System.out.println(num);
		try {
			qNAinf.QNAreadCnt(num);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "";
	}
	
	
 }