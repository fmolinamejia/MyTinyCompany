<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>  
    <title>My Tiny Company</title>  
    <style>
      .name.ng-valid {
          background-color: lightgreen;
      }
      .name.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .name.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }
      
      .address.ng-valid {
          background-color: lightgreen;
      }
      .address.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .address.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }
      
      .city.ng-valid {
          background-color: lightgreen;
      }
      .city.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .city.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }
      
      .country.ng-valid {
          background-color: lightgreen;
      }
      .country.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .country.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }
  
    </style>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
     <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
  </head>
  <body ng-app="myTinyCompany" class="ng-cloak">
      <div class="generic-container" ng-controller="CompanyController as ctrl">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Company Registration Form </span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.company.id" />
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="cname">Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.company.name" id="cname" class="name form-control input-sm" placeholder="Enter name" required ng-minlength="2"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.cname.$error.required">This is a required field</span>
                                      <span ng-show="myForm.cname.$error.minlength">Minimum length required is 2</span>
                                      <span ng-show="myForm.cname.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                         
                       
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="caddress">Address</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.company.address" id="caddress" class="address form-control input-sm" placeholder="Enter Address." required ng-minlength="2"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.caddress.$error.required">This is a required field</span>
                                      <span ng-show="myForm.caddress.$error.minlength">Minimum length required is 2</span>
                                      <span ng-show="myForm.caddress.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="ccity">City</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.company.city" id="ccity" class="city form-control input-sm" placeholder="Enter City." required ng-minlength="2"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.ccity.$error.required">This is a required field</span>
                                      <span ng-show="myForm.ccity.$error.minlength">Minimum length required is 2</span>
                                      <span ng-show="myForm.ccity.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="ccountry">Country</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.company.country" id="ccountry" class="country form-control input-sm" placeholder="Enter Country." required ng-minlength="2"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.ccountry.$error.required">This is a required field</span>
                                      <span ng-show="myForm.ccountry.$error.minlength">Minimum length required is 2</span>
                                      <span ng-show="myForm.ccountry.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="email">Email</label>
                              <div class="col-md-7">
                                  <input type="email" ng-model="ctrl.company.email" id="email" class="form-control input-sm" placeholder="Enter Email"/>                                  
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="phoneNumber">Phone Number</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.company.phoneNumber" id="phoneNumber" class="form-control input-sm" placeholder="Enter Phone Number"/>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="owners">Owners</label>
                              <div class="col-md-7">
                                  <input ng-list ng-model="ctrl.company.owners" id="owners" class="form-control input-sm" placeholder="Enter Owner(s)"/>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.company.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
          <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">List of Companies </span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>ID.</th>
                              <th>Name</th>
                              <th>Address</th>
                              <th>City</th>
                              <th>Country</th>
                              <th>Email</th>
                              <th>Phone Number</th>
                              <th>Owners</th>
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="c in ctrl.companies">
                              <td><span ng-bind="c.id"></span></td>
                              <td><span ng-bind="c.name"></span></td>
                              <td><span ng-bind="c.address"></span></td>
                              <td><span ng-bind="c.city"></span></td>
                              <td><span ng-bind="c.country"></span></td>
                              <td><span ng-bind="c.email"></span></td>
                              <td><span ng-bind="c.phoneNumber"></span></td>
                              <td><span ng-bind="c.owners"></span></td>
                              <td>
                              <button type="button" ng-click="ctrl.edit(c.id)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(c.id)" class="btn btn-danger custom-width">Remove</button>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
       
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="<c:url value='/static/js/app.js' />"></script>
      <script src="<c:url value='/static/js/service/company_service.js' />"></script>
      <script src="<c:url value='/static/js/controller/company_controller.js' />"></script>
  </body>
</html>