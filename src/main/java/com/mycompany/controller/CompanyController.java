/**
 * 
 */
package com.mycompany.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Fernando Molina
 * @version 1.0
 *
 */
@Controller
@RequestMapping("/")
public class CompanyController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String getIndexPage(){
		return "CompanyManagement";
	}

}
