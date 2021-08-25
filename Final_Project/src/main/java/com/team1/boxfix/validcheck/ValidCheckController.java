package com.team1.boxfix.validcheck;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ValidCheckController {

	@Autowired ValidCheckDAO Ldao;
	
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("b_id") String b_id) {
		
		return Ldao.userIdCheck(b_id);
		
	}
	
	@RequestMapping(value = "/companyIdCheck", method = RequestMethod.GET)
	@ResponseBody
	public int companyIdCheck(@RequestParam("c_id") String c_id) {
		
		
		return Ldao.companyIdCheck(c_id);
		
	}
	
}
