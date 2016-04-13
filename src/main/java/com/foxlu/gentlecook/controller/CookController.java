package com.foxlu.gentlecook.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.foxlu.gentlecook.dto.CookDto;
import com.foxlu.gentlecook.entity.Comment;
import com.foxlu.gentlecook.entity.Cook;
import com.foxlu.gentlecook.entity.User;
import com.foxlu.gentlecook.service.CookManager;
import com.foxlu.gentlecook.service.UserManager;

@Controller
@RequestMapping("/cook")
public class CookController {
	private static final Logger logger = LoggerFactory.getLogger(CookController.class);
	@Autowired
	private CookManager cm;
	@Autowired
	private UserManager um;
	
	@RequestMapping("/getcooks.pub")
	@ResponseBody
	public List<CookDto> getCooks(){
		List<CookDto> result = cm.getAllCookDtos();
		logger.debug("浏览厨师: " + result.size() + "条");
		return cm.getAllCookDtos();
	}
	@RequestMapping("/getcookcomments.pub")
	@ResponseBody
	public Map<String,Object> getCookComments(Long id,HttpSession session){
		System.out.println(id);
		Map<String,Object> result = new HashMap<>();
		if(session.getAttribute("currentUser")!=null){
			result.put("isLogin", true);
		}else{
			result.put("isLogin",false);
		}
		List<Comment> list = cm.getAllCommentsByCookId(id);
		logger.debug(list.toString());
		result.put("result", list);
		return result;
	}
	@RequestMapping("/submitcomment.do")
	@ResponseBody
	public String submitCommit(String content,Long id,Boolean type,HttpSession session){
		logger.debug("接受评价:" + id + "  " + content + "  " + type);
		Long userId = ((User)session.getAttribute("currentUser")).getId();
		cm.saveComment(userId,id,content,type);
		return "success";
	}
//	@RequestMapping("/order")
//	public ModelAndView orderPage(Long cookId,HttpSession session){
//		ModelAndView mav = new ModelAndView();
//		if(session.getAttribute("currentUser")==null){
//			mav.setViewName("register");
//			return mav;
//		}
//		Cook c = cm.getCookById(cookId);
//		mav.addObject("cook",c);
//		mav.setViewName("ordercook");
//		return mav;
//	}
	@RequestMapping("/submitorder.do")
	@ResponseBody
	public boolean submitOrder(Long cookId,String trueName,String phone,String orderDate,String address,Boolean daimai,String type,int price,HttpSession session){
		Long userId = ((User)session.getAttribute("currentUser")).getId();
		return um.submitOrder(userId,cookId, trueName, phone,orderDate, address, daimai, type, price);
	}
}
