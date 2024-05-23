import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/Person/person_controller.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../../Data/Api Resp/api_response.dart';
import '../../../../../../Widgets/Loader/loader.dart';
import '../../../../Constants/Font/fonts.dart';
import '../../../../Widgets/AppBar/my_app_bar.dart';
import '../Notifier/salary_payslip_notifier.dart';

// ignore: must_be_immutable
class SalaryPaySlipScreen extends ConsumerWidget {
  int buildcheck = 0;

  SalaryPaySlipScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print(person!.data!.id!);

    final controller = ref.watch(salaryPaySlipProvider.notifier);
    final state = ref.watch(salaryPaySlipProvider);
    print('build check  ${buildcheck++}');

    return Scaffold(
      appBar: MyAppBar(
        showFilter: false,
        title: "Employee Center",
        bellOnTap: () {
          GoRouter.of(context).pushNamed(notificationsScreen);
        },
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 25,
            ).r,
            child: Text('Salary PaySlip',
                style: FontManagment()
                    .montserrat18HeadingEmployeeCenterAllModules),
          ),
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            10.ph,
            if (state.payslips.isEmpty) ...[
              Center(
                child: Text(
                  'No Requests Found.',
                  style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: HexColor('#EB2F2F')),
                ),
              ),
            ] else
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.payslips.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          GoRouter.of(context).pushNamed(
                            salaryPaySlipDetailPage,
                            pathParameters: {'id': '4'},
                          );
                        },
                        child: Container(
                          //width: 360.w,
                          // height: 224.h,
                          margin: const EdgeInsets.only(
                                  bottom: 20, left: 26, right: 25, top: 10)
                              .r,
                          padding: const EdgeInsets.only(
                                  left: 28, right: 27, bottom: 21, top: 19)
                              .r,

                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(14).r,
                              border:
                                  Border.all(color: const Color(0xffDCE2EF))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 180.w,
                                        child: Text(
                                          state.payslips[index].employee!
                                                  .name ??
                                              "",
                                          maxLines: 1,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 24.sp,
                                            color: blackColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        state.payslips[index].id.toString(),
                                        style: GoogleFonts.montserrat(
                                          fontSize: 12.sp,
                                          color: const Color(0xff636363),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    (state.payslips[index].status == 1)
                                        ? 'Paid'
                                        : 'Unpaid',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14.sp,
                                      color: (state.payslips[index].status == 1)
                                          ? const Color(0xff22A527)
                                          : const Color(0xffBA1717),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              8.ph,
                              const Divider(
                                color: Color(0xffEEEEEE),
                              ),
                              13.ph,
                              SalaryPaySlipCardText(
                                  title: 'Payroll Type',
                                  subTitle: 'Monthly Payslip'),
                              10.ph,
                              SalaryPaySlipCardText(
                                title: 'Salary',
                                subTitle: state.payslips[index].basicSalary
                                    .toString(),
                              ),
                              10.ph,
                              SalaryPaySlipCardText(
                                title: 'Net Salary',
                                subTitle:
                                    state.payslips[index].netPayble.toString(),
                              ),
                              10.ph,
                              SalaryPaySlipCardText(
                                title: 'Salary For',
                                subTitle: state.payslips[index].salaryMonth
                                    .toString(),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
          ] else
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "No Data Found",
                style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: HexColor('#EB2F2F')),
              ),
            ),
        ],
      ),

      // ),
    );
  }
}

Widget SalaryPaySlipCardText(
    {required String title, required String subTitle}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 13.sp,
          color: const Color(0xff9FA2AB),
          fontWeight: FontWeight.w600,
        ),
      ),
      Text(
        subTitle,
        style: GoogleFonts.montserrat(
            fontSize: 14.sp,
            color: const Color(0xff313131),
            fontWeight: FontWeight.bold),
      ),
    ],
  );
}
