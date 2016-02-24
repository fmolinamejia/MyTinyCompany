
package com.mycompany.service;

import java.util.List;

import com.mycompany.domain.Company;

/**
 * 
 * @author Fernando Molina
 * @version 1.0
 *
 */
public interface CompanyService {

	List<Company> findAllCompanies();
	Company findById(long id);
	Company findByName(String name);
	void saveCompany(Company company);
	void updateCompany(Company company);
	boolean isCompanyExist(Company company);
	
}
