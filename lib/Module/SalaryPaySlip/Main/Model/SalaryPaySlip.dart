import 'dart:convert';

class SalaryPaySlip {
  SalaryPaySlip({
    required this.success,
    required this.payslips,
  });
  late final bool success;
  late final List<Payslips> payslips;

  SalaryPaySlip.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    payslips =
        List.from(json['payslips']).map((e) => Payslips.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['payslips'] = payslips.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Payslips {
  Payslips({
    required this.id,
    required this.companyId,
    required this.employeeId,
    required this.netPayble,
    required this.salaryMonth,
    required this.status,
    required this.basicSalary,
    // required this.allowance,
    // required this.commission,
    // required this.loan,
    // required this.saturationDeduction,
    // required this.otherPayment,
    // required this.overtime,
    // required this.createdBy,
    // required this.createdAt,
    // required this.updatedAt,
  });
  late final int id;
  late final int companyId;
  late final int employeeId;
  late final int netPayble;
  late final String salaryMonth;
  late final int status;
  late final int basicSalary;
  // late final String allowance;
  // late final List<Allowance> allowance;
  // late final String commission;
  // late final String loan;
  // late final String saturationDeduction;
  // late final String otherPayment;
  // late final String overtime;
  // late final int createdBy;
  // late final String createdAt;
  // late final String updatedAt;

  Payslips.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    employeeId = json['employee_id'];
    netPayble = json['net_payble'];
    salaryMonth = json['salary_month'];
    status = json['status'];
    basicSalary = json['basic_salary'];
    // allowance = json['allowance'];

    // allowance = (jsonDecode(json['allowance']) as List<dynamic>)
    //     .map((e) => Allowance.fromJson(e))
    //     .toList();

    // commission = json['commission'];
    // loan = json['loan'];
    // saturationDeduction = json['saturation_deduction'];
    // otherPayment = json['other_payment'];
    // overtime = json['overtime'];
    // createdBy = json['created_by'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['company_id'] = companyId;
    _data['employee_id'] = employeeId;
    _data['net_payble'] = netPayble;
    _data['salary_month'] = salaryMonth;
    _data['status'] = status;
    _data['basic_salary'] = basicSalary;
    // _data['allowance'] = allowance;
    // _data['allowance'] = allowance.map((x) => x.toJson()).toList();
    // _data['commission'] = commission;
    // _data['loan'] = loan;
    // _data['saturation_deduction'] = saturationDeduction;
    // _data['other_payment'] = otherPayment;
    // _data['overtime'] = overtime;
    // _data['created_by'] = createdBy;
    // _data['created_at'] = createdAt;
    // _data['updated_at'] = updatedAt;

    return _data;
  }
}

// class Allowance {
//   Allowance({
//     required this.id,
//     required this.companyId,
//     required this.employeeId,
//     required this.allowanceOption,
//     required this.title,
//     required this.amount,
//     required this.type,
//     required this.createdBy,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   late final int id;
//   late final int companyId;
//   late final int employeeId;
//   late final int allowanceOption;
//   late final String title;
//   late final String amount;
//   late final String type;
//   late final int createdBy;
//   late final String createdAt;
//   late final String updatedAt;

//   Allowance.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     companyId = json['company_id'];
//     employeeId = json['employee_id'];
//     allowanceOption = json['allowance_option'];
//     title = json['title'];
//     amount = json['amount'];
//     type = json['type'];
//     createdBy = json['created_by'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['company_id'] = companyId;
//     _data['employee_id'] = employeeId;
//     _data['allowance_option'] = allowanceOption;
//     _data['title'] = title;
//     _data['amount'] = amount;
//     _data['type'] = type;
//     _data['created_by'] = createdBy;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     return _data;
//   }
// }
