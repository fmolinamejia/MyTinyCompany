/**
 * 
 */
package com.mycompany.service;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.domain.Company;

/**
 * 
 * @author Fernando Molina
 * @version 1.0
 *
 */
@Service("companyService")
@Transactional
public class CompanyServiceImpl implements CompanyService {
	
	private static final AtomicLong counter = new AtomicLong();
	private static List<Company> companies;
	
	static{
		companies = populateDummyCompanies();
	}

	@Override
	public List<Company> findAllCompanies(){
		return companies;
	}
	
	@Override
	public Company findById(long id){
		for(Company company:companies){
			if(company.getId() == id){
				return company;
			}
		}
		
		return null;
	}
	
	@Override
	public Company findByName(String name){
		for(Company company:companies){
			if(company.getName().equalsIgnoreCase(name)){
				return company;
			}
		}
		
		return null;
	}
	
	@Override
	public void saveCompany(Company company){
		company.setId(counter.incrementAndGet());
		companies.add(company);
	}
	
	@Override
	public void updateCompany(Company company){
		int index = companies.indexOf(company);
		companies.set(index, company);
	}
	
	public boolean isCompanyExist(Company company){
		return findByName(company.getName()) != null;
	}
	
	private static List<Company> populateDummyCompanies(){
		List<Company> companies = new ArrayList<Company>();
		companies.add(new Company(counter.incrementAndGet(), "ABC", "Av. 1", 
				"MO", "US", "abc@company.com", "1234567890", 
				new String[]{"PhD Alex"}));
		companies.add(new Company(counter.incrementAndGet(), "ROCHE", "Av. 3", 
				"CH", "US", "roche@company.com", "1234567890", 
				new String[]{"PhD Brad"}));
		companies.add(new Company(counter.incrementAndGet(), "LUZ", "Av. 5", 
				"GR", "US", "luz@company.com", "1234567890", 
				new String[]{"PhD Julia"}));
		return companies;
	}
}
