package kz.uts.corp.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import kz.uts.corp.domain.Guestbook;
import kz.uts.corp.service.GuestbookService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GuestbookController {

	@Autowired 
	private GuestbookService guestbookService;
        
	@RequestMapping("/index")
	public String listGuestbook(Map<String, Object> map, HttpServletRequest request) {
                String ipAddress = request.getHeader("X-FORWARDED-FOR");  
                if (ipAddress == null) {  
                        ipAddress = request.getRemoteAddr();  
                }
                map.put("guestbook", new Guestbook());
                map.put("guestbookList", guestbookService.listGuestbook());
                map.put("ipAddress",ipAddress);
                return "guestbook";
	}
	
	@RequestMapping("/")
	public String home() {
               
		return "redirect:/index";
	}
        
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addGuestbook(@ModelAttribute("guestbook") Guestbook guestbook,
			BindingResult result) {
		guestbookService.addGuestbook(guestbook);
		return "redirect:/index";
	}
}
