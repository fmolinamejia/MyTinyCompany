/**
 * 
 */
package com.mycompany.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.mycompany.domain.Company;
import com.mycompany.service.CompanyServiceImpl;

/**
 * @author Fernando Molina
 * @version 1.0
 *
 */
@RestController
@RequestMapping("/mycompany/api")
public class CompanyApiController {
	
	@Autowired
	private CompanyServiceImpl companyService;

	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<Void> createCompany(@RequestBody Company company, UriComponentsBuilder ucBuilder){
		
		if(companyService.isCompanyExist(company)){
			return new ResponseEntity<Void>(HttpStatus.CONFLICT);
		}
		
		companyService.saveCompany(company);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/mycompany/api/{companyId}").buildAndExpand(company.getId()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
		
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<List<Company>> listAllCompanies(){
		
		List<Company> companies = companyService.findAllCompanies();
		
		if(companies == null){
			return new ResponseEntity<List<Company>>(HttpStatus.NO_CONTENT);
		}
		
		return new ResponseEntity<List<Company>>(companies, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/{companyId}", method = RequestMethod.GET)
	public ResponseEntity<Company> getCompanyDetail(@PathVariable("companyId") long id){
		
		Company company = companyService.findById(id);
		
		if(company == null){
			return new ResponseEntity<Company>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<Company>(company, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/{companyId}", method = RequestMethod.PUT)
	public ResponseEntity<Company> updateCompany(@PathVariable("companyId") long id, @RequestBody Company company){
		
		Company currentCompany = companyService.findById(id);
		
		if(currentCompany == null){
			return new ResponseEntity<Company>(HttpStatus.NOT_FOUND);
		}
		
		currentCompany.setAddress(company.getAddress());
		currentCompany.setCity(company.getCity());
		currentCompany.setCountry(company.getCountry());
		currentCompany.setEmail(company.getEmail());
		currentCompany.setName(company.getName());
		currentCompany.setOwners(company.getOwners());
		currentCompany.setPhoneNumber(company.getPhoneNumber());
		companyService.updateCompany(currentCompany);
		
		return new ResponseEntity<Company>(currentCompany, HttpStatus.OK);
	}
	
//	@RequestMapping(value = "/{companyId}/owner", method = RequestMethod.POST)
//	public String createCompanyOwner(@PathVariable("companyId") long id){
//		return "Company owner created";
//	}
}
