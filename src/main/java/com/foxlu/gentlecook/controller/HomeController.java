package com.foxlu.gentlecook.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.foxlu.gentlecook.entity.Cook;
import com.foxlu.gentlecook.service.CookManager;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private CookManager cm;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {	
		return "index";
	}
	
	@RequestMapping(value = "/cooks", method = RequestMethod.GET)
	public String cook() {
		return "cooks";
	}
	@RequestMapping("/usercenter")
	public String userCenter(String position,Model model){
		if(position == null) position = "";
		model.addAttribute("position",position);
		return null;
	}
	
	@RequestMapping("/ordercook")
	public ModelAndView orderPage(Long id,HttpSession session){
		logger.debug(id.toString());
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("currentUser")==null){
			mav.setViewName("login");
			return mav;
		}
		Cook c = cm.getCookById(id);
		mav.addObject("cook",c);
		mav.setViewName("ordercook");
		return mav;
	}
	
}
