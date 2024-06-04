class ManageEmployeeInfoDetail {
  ManageEmployeeInfoDetail({
    required this.success,
    required this.employeeinformationdetail,
  });
  late final bool success;
  late final List<Employeeinformationdetail> employeeinformationdetail;

  ManageEmployeeInfoDetail.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    employeeinformationdetail = List.from(json['employeeinformationdetail'])
        .map((e) => Employeeinformationdetail.fromJson(e))
        .toList();
  }
}

class Employeeinformationdetail {
  Employeeinformationdetail({
    required this.id,
    required this.companyId,
    required this.userId,
    required this.name,
    required this.dob,
    required this.phone,
    required this.address,
    required this.email,
    required this.departmentId,
    required this.designationId,
    required this.companyDoj,
    required this.documents,
    required this.accountHolderName,
    required this.accountNumber,
    required this.bankName,
    required this.bankIdentifierCode,
    required this.branchLocation,
    required this.taxPayerId,
    required this.salary,
    required this.company,
    required this.department,
    required this.designation,
  });
  int? id;
  int? companyId;
  int? userId;
  String? name;
  String? dob;

  String? phone;
  String? address;
  String? email;

  int? departmentId;
  int? designationId;

  String? companyDoj;
  String? documents;
  String? accountHolderName;
  String? accountNumber;
  String? bankName;
  String? bankIdentifierCode;
  String? branchLocation;
  String? taxPayerId;

  int? salary;

  Company? company;
  Department? department;
  Designation? designation;

  Employeeinformationdetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    userId = json['user_id'];
    name = json['name'];
    dob = json['dob'];

    phone = json['phone'];
    address = json['address'];
    email = json['email'];

    departmentId = json['department_id'];
    designationId = json['designation_id'];
    companyDoj = json['company_doj'];
    documents = json['documents'];
    accountHolderName = json['account_holder_name'];
    accountNumber = json['account_number'];
    bankName = json['bank_name'];
    bankIdentifierCode = json['bank_identifier_code'];
    branchLocation = json['branch_location'];
    taxPayerId = json['tax_payer_id'];

    salary = json['salary'];

    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;

    department = json['department'] != null
        ? Department.fromJson(json['department'])
        : null;

    designation = json['designation'] != null
        ? Designation.fromJson(json['designation'])
        : null;
  }
}

class Company {
  Company({
    required this.id,
    required this.companyName,
  });
  int? id;
  String? companyName;

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
  }
}

class Department {
  Department({
    required this.id,
    required this.name,
  });
  int? id;
  String? name;

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class Designation {
  Designation({
    required this.id,
    required this.name,
  });
  int? id;
  String? name;

  Designation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
