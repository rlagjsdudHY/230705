package com.proj.board;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proj.board.svc.GoodsInf;

@Controller
public class GoodsController {
	
	@Autowired
	private GoodsInf goodsInf;
	
	// 상품 장바구니 등록 실행
	@RequestMapping("/goodsRegProc")
	public String orderProc(HttpServletRequest req) throws Exception {
		String test = req.getParameter("test");
		System.out.println("테스트값테스트"+test);
		
		try {
			req.setCharacterEncoding("UTF-8");
			String uid = req.getParameter("uid");
			String goodsName = req.getParameter("goodsName");
			String cnt = req.getParameter("cnt");
			String price = req.getParameter("price");
			
			System.out.println("uid : " + uid);
			System.out.println("goodsName : " + goodsName);
			System.out.println("cnt : " + cnt);
			System.out.println("price : " + price);
			System.out.println(price);
			
			Map<String, String> map = new HashMap<>();
			map.put("uid", uid);
			map.put("goodsName", goodsName);
			map.put("cnt", cnt);
			map.put("price", price);
			goodsInf.goodsRegProc(map);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "redirect:cart";
	}
	
	//장바구니
	@RequestMapping("/cart")
	public String cart(HttpServletRequest req, Model model) throws Exception {
		HttpSession session = req.getSession();
		String uid = (String) session.getAttribute("uidSession");
		try {
		model.addAttribute("cartList", goodsInf.cart(uid));
		} catch (Exception e) { 
			System.out.println(e.getMessage()); 
		}
		return "PCView/cart";
	}
	
	// 장바구니 리스트 삭제
	@RequestMapping("/listDel")
	public String listDel(String[] delIdx) {
		goodsInf.mtdDelete(delIdx);
		
		return "redirect:cart";
	}

	
	// 수정 실행
	@RequestMapping("/cntChange")
	public String cntChange(HttpServletRequest req) throws Exception {
		
		String num="";
		
		try {
			req.setCharacterEncoding("UTF-8");
			num = req.getParameter("num");
			String cnt = req.getParameter("cnt");
			
			
			// 서비스 호출
			goodsInf.cntChange(num, cnt);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "redirect:cart?num="+num;
	}	
	
	

}
