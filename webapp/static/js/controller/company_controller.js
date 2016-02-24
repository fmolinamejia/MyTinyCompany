'use strict';

App.controller('CompanyController', ['$scope', 'CompanyService', function($scope, CompanyService){
	
	var self = this;
	self.company = {id:null, name: '', address: '', city: '', country: '', email: '', phoneNumber: '', owners: []};
	self.companies=[];
	
	self.fetchAllCompanies = function(){
		CompanyService.fetchAllCompanies()
			.then(
					function(d){
						self.companies = d;
					},
					function(errResponse){
						console.error('Error while fetching Companies.');
					}
				);
	};
	
	self.createCompany = function(company){
		CompanyService.createCompany(company)
			.then(
					self.fetchAllCompanies,
					function(errResponse){
						console.error('Error while creating Company.');
					}
				);
	};
	
	self.updateCompany = function(company, id){
		CompanyService.updateCompany(company, id)
			.then(
					self.fetchAllCompanies,
					function(errResponse){
						console.error('Error while updating Company.');
					}
				);
	};
		
	self.fetchAllCompanies();
	
	self.submit = function(){
		if(self.company.id === null){
			console.log('Saving New Company', self.company);
			self.createCompany(self.company);
		}
		else{
			self.updateCompany(self.company, self.company.id);
			console.log('Company updated with id ', self.company.id);
		}
		self.reset();
	};
	
	self.edit = function(id){
		console.log('id to be edited', id);
		for(var i = 0; i < self.companies.length; i++){
			if(self.companies[i].id === id){
				self.company = angular.copy(self.companies[i]);
				break;
			}
		}
	};
		
	self.reset = function(){
		self.company = {id:null, name: '', address: '', city: '', country: '', email: '', phoneNumber: '', owners: []};
		$scope.myForm.$setPristine(); // reset form
	}
}]);