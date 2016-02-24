'use strict';

App.factory('CompanyService', ['$http', '$q', function($http, $q){
	return {
		
		fetchAllCompanies: function(){
			return $http.get('http://localhost:8080/MyTinyCompany/mycompany/api/')
					.then(
							function(response){
								return response.data;
							},
							function(errResponse){
								console.error('Error while fetching companies');
								return $q.reject(errResponse);
							}
					);
		},
		
		createCompany: function(company){
			return $http.post('http://localhost:8080/MyTinyCompany/mycompany/api/', company)
					.then(
							function(response){
								return response.data;
							},
							function(errResponse){
								console.error('Error while creating company');
								return $q.reject(errResponse);
							}
					);
		},
		
		updateCompany: function(company, id){
			return $http.put('http://localhost:8080/MyTinyCompany/mycompany/api/'+id, company)
					.then(
							function(response){
								return response.data;
							},
							function(errResponse){
								console.error('Error while creating company');
								return $q.reject(errResponse);
							}
					);
		}
	};
}]);