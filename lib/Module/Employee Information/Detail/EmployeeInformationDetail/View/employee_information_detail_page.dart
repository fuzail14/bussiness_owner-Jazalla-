import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../Constants/constants.dart';
import '../../../../../../Data/Api Resp/api_response.dart';

import '../../../../../Constants/Font/fonts.dart';
import '../../Widget/custom_card_for_empinfodetail.dart';
import '../Notifier/employee_information_detail_notifier.dart';

class EmployeeInformationDetailView extends ConsumerWidget {
  const EmployeeInformationDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(employeeInformationDetailProvider);
    final controller = ref.watch(employeeInformationDetailProvider.notifier);

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: MyAppBar(
        title: 'Manage Employee',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 10).r,
              child: Text('Manage Employee',
                  style: FontManagment()
                      .montserrat18HeadingEmployeeCenterAllModules),
            ),
            if (state.responseStatus == Status.loading)
              const Center(child: CircularProgressIndicator())
            else if (state.responseStatus == Status.completed) ...[
              CustomCardForEmpinfodetail(
                mainTitle: 'Personal Detail',
                firstRowTitle: 'Name',
                firstRowSubTitle:
                    state.employeeinformationdetail.first.name ?? "",
                secondRowTitle: 'Email',
                secondRowSubTitle:
                    state.employeeinformationdetail.first.email ?? "",
                thirdRowTitle: 'Date of Birth',
                thirdRowSubTitle:
                    state.employeeinformationdetail.first.dob ?? "",
                fourthRowTitle: 'Address',
                fourthRowSubTitle:
                    state.employeeinformationdetail.first.address ?? "",
                fivthRowTitle: 'Phone',
                fivthRowSubTitle:
                    state.employeeinformationdetail.first.phone ?? "",
                sixthRowShow: false,
              ),
              CustomCardForEmpinfodetail(
                mainTitle: 'Company Detail',
                firstRowTitle: 'Name',
                firstRowSubTitle: state
                        .employeeinformationdetail.first.company?.companyName ??
                    "",
                secondRowTitle: 'Department',
                secondRowSubTitle:
                    state.employeeinformationdetail.first.department?.name ??
                        "",
                thirdRowTitle: 'Designation',
                thirdRowSubTitle:
                    state.employeeinformationdetail.first.designation?.name ??
                        "",
                fourthRowTitle: 'Date Of Joining',
                fourthRowSubTitle:
                    state.employeeinformationdetail.first.companyDoj ?? "NA",
                sixthRowShow: false,
                // fivthRowTitle: 'Salary Type',
                // fivthRowSubTitle: "Monthly Payslip",
                fivthRowTitle: 'Basic Salary',
                fivthRowSubTitle:
                    state.employeeinformationdetail.first.salary.toString() ??
                        "NA",
              ),
              CustomCardForEmpinfodetail(
                mainTitle: 'Bank Detail',
                firstRowTitle: 'Account Holder Name',
                firstRowSubTitle:
                    state.employeeinformationdetail.first.name ?? "NA",
                secondRowTitle: 'Account Number',
                secondRowSubTitle:
                    state.employeeinformationdetail.first.accountNumber ?? "NA",
                thirdRowTitle: 'Bank Name',
                thirdRowSubTitle:
                    state.employeeinformationdetail.first.bankName ?? "NA",
                fourthRowTitle: 'Bank Identifier Code',
                fourthRowSubTitle:
                    state.employeeinformationdetail.first.bankIdentifierCode ??
                        "NA",
                fivthRowTitle: 'Branch Location',
                fivthRowSubTitle:
                    state.employeeinformationdetail.first.branchLocation ??
                        "NA",
                sixthRowTitle: 'Tax Payer Id',
                sixthRowSubTitle:
                    state.employeeinformationdetail.first.taxPayerId ?? "NA",
              ),
              Container(
                //width: 360.w,
                // height: 224.h,
                margin: const EdgeInsets.only(
                        bottom: 20, left: 23, right: 21, top: 10)
                    .r,
                padding: const EdgeInsets.only(
                        left: 23, right: 20, bottom: 26, top: 17)
                    .r,

                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: const Offset(
                        1.0,
                        3.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Document Detail',
                      style: GoogleFonts.montserrat(
                        fontSize: 16.sp,
                        color: const Color(0xff262422),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    15.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: Text('Certificate',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: titleStyle)),
                        10.pw,
                        Row(
                          children: [
                            const Icon(
                              Icons.download,
                              size: 20,
                              color: Color(0xff1F3996),
                            ),
                            10.pw,
                            Text('Download',
                                maxLines: 1,
                                textDirection: TextDirection.rtl,
                                style: subTitleStyle),
                          ],
                        ),
                      ],
                    ),
                    8.ph,
                    const Divider(
                      color: Color(0xffF1ECEC),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 100,
                            child: Text('Photo',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: titleStyle)),
                        10.pw,
                        Row(
                          children: [
                            const Icon(
                              Icons.download,
                              size: 20,
                              color: Color(0xff1F3996),
                            ),
                            10.pw,
                            Text('Download',
                                maxLines: 1,
                                textDirection: TextDirection.rtl,
                                style: subTitleStyle),
                          ],
                        ),
                      ],
                    ),
                    8.ph,
                    const Divider(
                      color: Color(0xffF1ECEC),
                    ),
                  ],
                ),
              ),
              20.ph,
            ] else
              Padding(
                padding: const EdgeInsets.only(top: 0).r,
                child: Center(
                  child: Text(
                    "No User Data Found",
                    style: GoogleFonts.montserrat(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),

      // ),
    );
  }
}
