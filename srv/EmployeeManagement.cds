using employeemgmt.db as db from '../db/data-model';

@path: '/EMPMgmtSRV'
service EmployeeManagement {

    entity Employee  as projection on db.EmployeeDetails.Employee;

    entity Address as projection on db.EmployeeDetails.Address;

    entity Designation  as projection on db.OrganizationDetails.Designation;

    entity Salary as projection on db.OrganizationDetails.Salary;

    entity Department as projection on db.OrganizationDetails.Department;
}
