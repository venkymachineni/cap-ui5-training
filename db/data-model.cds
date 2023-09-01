namespace employeemgmt.db;

using {
  cuid,
  managed
} from '@sap/cds/common';

using {reusable.types as types} from './ReusableTypes';

/**
 * context we use to sagregate the entities to different class
 * or section or groups. Like we have all Employee details
 * related entities in the Employee Details context.
 */
context EmployeeDetails {

  // employeemgmt.db.EmployeeDetails-Employee.csv
  @assert.unique: {
    email: [email],
    phone: [phone]
  }
  entity Employee : managed {
    key ID              : UUID;
        fName           : String(20);
        lName           : String(20);
        gender          : types.Gender not null;
        DOB             : Date;
        contractStarted : Date;
        email           : types.Email not null;
        phone           : types.PhoneNumber not null;
        age             : Integer;
        address         : Composition of many Address
                            on address.employee = $self; // Self means the Primary key of the current table
        department      : Association to one OrganizationDetails.Department;
        salary          : Composition of OrganizationDetails.Salary;
        designation     : Association to one OrganizationDetails.Designation;
  };

  // employeemgmt.db.EmployeeDetails-Address.csv
  entity Address : managed {
    key ID       : UUID;
        city     : String not null;
        address  : String not null;
        pincode  : Integer not null;
        street   : String;
        landmark : String;
        employee : Association to Employee
  }
}

context OrganizationDetails {

  //employeemgmt.db.OrganizationDetails-Department.csv
  entity Department : cuid {
    key ID           : UUID;
        name         : String;
        description  : String;
        headCount    : Integer;
        deliveryHead : Association to one EmployeeDetails.Employee;
        employee     : Association to many EmployeeDetails.Employee
                         on employee.department = $self;
  }

  // employeemgmt.db.OrganizationDetails-Salary.csv
  entity Salary {
    key ID            : UUID;
        costToCompany : types.Amount;
        employeePf    : types.Amount;
        employerPf    : types.Amount;
        nps           : types.Amount;
        vpf           : types.Amount;
  };

  // employeemgmt.db.OrganizationDetails-Designation.csv
  entity Designation {
    key ID          : UUID;
        name        : String;
        description : String;
        level       : String;
  }
}
