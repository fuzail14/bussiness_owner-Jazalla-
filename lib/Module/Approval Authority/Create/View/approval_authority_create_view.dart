import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Constants/Font/fonts.dart';
import '../../../../Widgets/AppBar/my_app_bar.dart';
import '../Model/AddApprovalAuthorityUser.dart';
import '../Model/AddApproverUser.dart';
import '../Model/AddModule.dart';
import '../Model/AddModuleAction.dart';
import '../Model/AddSubModule.dart';
import '../Notifier/approval_authority_create_notifier.dart';

// ignore: must_be_immutable
class ApprovalAuthorityCreateScreen extends ConsumerWidget {
  int buildcheck = 0;

  ApprovalAuthorityCreateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print(person!.data!.id!);

    final controller = ref.watch(approvalAuthorityCreateProvider.notifier);
    final state = ref.watch(approvalAuthorityCreateProvider);
    print('build check  ${buildcheck++}');

    return Scaffold(
      appBar: MyAppBar(
        showFilter: false,
        title: "Administrator Center",
        showBell: false,
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 25,
              ).r,
              child: Center(
                child: Text('Add New Approval Authority',
                    style: FontManagment()
                        .montserrat18HeadingEmployeeCenterAllModules),
              ),
            ),
            15.ph,
            Container(
              // height: 429.h,
              padding: const EdgeInsets.only(
                      top: 13, left: 33, right: 29, bottom: 30)
                  .r,
              margin: const EdgeInsets.only(left: 23, right: 33, bottom: 73).r,

              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(7).r,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: const Offset(
                      2.0,
                      2.0,
                    ),
                    blurRadius: 12.0,
                    spreadRadius: 2.5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Select Module*',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff131925),
                      )),
                  5.ph,
                  Container(
                      // height: 42.h,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(6).r,
                        // border: Border.all(
                        //   color: const Color(0xffE4E4E4),
                        // ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(
                              2.0,
                              6.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<Moduleforadd>(
                          isExpanded: true,
                          style: GoogleFonts.montserrat(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w800,
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xffBEBEC2),
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10)
                                .r,
                            border: InputBorder.none,
                          ),
                          items: state.moduleforadd
                              .map<DropdownMenuItem<Moduleforadd>>(
                                  (Moduleforadd value) {
                            return DropdownMenuItem<Moduleforadd>(
                              value: value,
                              child: AutoSizeText(value.name ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff131925),
                                  )),
                            );
                          }).toList(),
                          onTap: () {
                            //controller.clearSubModule();
                          },
                          onChanged: (Moduleforadd? newValue) {
                            if (newValue != null) {
                              print(newValue.name);

                              controller.setSelectedmoduleNameAndId(newValue);
                              controller.submoduleViewApi(
                                  moduleId: newValue.id);
                            }
                          },
                        ),
                      )),
                  15.ph,
                  Text('Select Function*',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff131925),
                      )),
                  5.ph,
                  Container(
                      // height: 42.h,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(6).r,
                        // border: Border.all(
                        //   color: const Color(0xffE4E4E4),
                        // ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(
                              2.0,
                              6.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<Submoduleforadd?>(
                          isExpanded: true,
                          value: state.selectedSubmodule,
                          style: GoogleFonts.montserrat(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w800,
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xffBEBEC2),
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10)
                                .r,
                            border: InputBorder.none,
                          ),
                          items: state.submoduleforadd
                              .map<DropdownMenuItem<Submoduleforadd?>>(
                                  (Submoduleforadd? value) {
                            return DropdownMenuItem<Submoduleforadd?>(
                              value: value,
                              child: AutoSizeText(value?.name ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff131925),
                                  )),
                            );
                          }).toList(),
                          onTap: () {
                            // controller.clearUser();
                          },
                          onChanged: (Submoduleforadd? newValue) {
                            controller.setSelectedSubModuleId(newValue!);

                            controller.userViewApi(
                                companyId: controller.person!.data!.companyId,
                                type: state.selectedmodule);
                            controller.actionViewApi(
                                moduleFunctionId: newValue.id);
                          },
                        ),
                      )),
                  15.ph,
                  Text('Select User*',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff131925),
                      )),
                  5.ph,
                  Container(
                      // height: 42.h,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(6).r,
                        // border: Border.all(
                        //   color: const Color(0xffE4E4E4),
                        // ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(
                              2.0,
                              6.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<Approvalauthorityuser>(
                          isExpanded: true,
                          // value: state.ApprovalAuthorityType,
                          value: state.selectedApprovalauthorityuser,
                          style: GoogleFonts.montserrat(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w800,
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xffBEBEC2),
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10)
                                .r,
                            border: InputBorder.none,
                          ),
                          items: state.approvalauthorityuser
                              .map<DropdownMenuItem<Approvalauthorityuser>>(
                                  (Approvalauthorityuser value) {
                            return DropdownMenuItem<Approvalauthorityuser>(
                              value: value,
                              child: AutoSizeText(value.name ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff131925),
                                  )),
                            );
                          }).toList(),
                          onChanged: (Approvalauthorityuser? newValue) {
                            controller.setSelectedUserId(newValue);
                          },
                        ),
                      )),
                  15.ph,
                  Text('Select Action*',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff131925),
                      )),
                  5.ph,
                  Container(
                      // height: 42.h,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(6).r,
                        // border: Border.all(
                        //   color: const Color(0xffE4E4E4),
                        // ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(
                              2.0,
                              6.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<Moduleactionforadd>(
                          isExpanded: true,
                          value: state.selectedmoduleactionforadd,
                          style: GoogleFonts.montserrat(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w800,
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xffBEBEC2),
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10)
                                .r,
                            border: InputBorder.none,
                          ),
                          items: state.moduleactionforadd
                              .map<DropdownMenuItem<Moduleactionforadd>>(
                                  (Moduleactionforadd value) {
                            return DropdownMenuItem<Moduleactionforadd>(
                              value: value,
                              child: AutoSizeText(value.name ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff131925),
                                  )),
                            );
                          }).toList(),
                          onChanged: (Moduleactionforadd? newValue) {
                            controller.setSelectedActionId(newValue!);
                            if (state.approveruser.isEmpty) {
                              controller.firstNFinalApproverViewApi(
                                  companyId:
                                      controller.person!.data!.companyId);
                            }
                            print('approver user data there in List');
                          },
                        ),
                      )),
                  15.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Select Condition*',
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff131925),
                              )),
                          5.ph,
                          Container(
                              // height: 42.h,
                              width: 120.w,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(6).r,
                                // border: Border.all(
                                //   color: const Color(0xffE4E4E4),
                                // ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: const Offset(
                                      2.0,
                                      6.0,
                                    ),
                                    blurRadius: 10.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  isExpanded: true,
                                  value: state.selectedCondition,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Color(0xffBEBEC2),
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10)
                                        .r,
                                    border: InputBorder.none,
                                  ),
                                  items: controller.conditionList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: AutoSizeText(value,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff131925),
                                          )),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    controller.setSelectedCondition(newValue!);
                                  },
                                ),
                              )),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Select Amount*',
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff131925),
                              )),
                          5.ph,
                          Row(
                            children: [
                              Container(
                                // height: 42.h,
                                width: 90.w,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(6).r,
                                  // border: Border.all(
                                  //   color: const Color(0xffE4E4E4),
                                  // ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      offset: const Offset(
                                        2.0,
                                        6.0,
                                      ),
                                      blurRadius: 10.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  //readOnly: true, // Remove this line
                                  controller:
                                      controller.totalPriceAmountController,
                                  cursorHeight: 16,
                                  keyboardType: TextInputType.number,

                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '0.00',
                                    fillColor: whiteColor,
                                    hintStyle: FontManagment().montserrat14,
                                    // enabledBorder: const OutlineInputBorder(
                                    //   borderSide: BorderSide(
                                    //     color: Color(0xffE4E4E4),
                                    //   ),
                                    // ),
                                    // focusedBorder: const OutlineInputBorder(
                                    //   borderSide: BorderSide(
                                    //     color: Color(0xffE4E4E4),
                                    //   ),
                                    // ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal: 10.0,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 30.w,
                                height: 42.h,
                                decoration:
                                    BoxDecoration(color: Color(0xffF1F1F1)),
                                child: Center(
                                    child: Text(
                                  '\$',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14.sp,
                                      color: Color(0xff131925),
                                      fontWeight: FontWeight.w500),
                                )),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  15.ph,
                  Text('Select First Approver*',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff131925),
                      )),
                  5.ph,
                  Container(
                      // height: 42.h,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(6).r,
                        // border: Border.all(
                        //   color: const Color(0xffE4E4E4),
                        // ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(
                              2.0,
                              6.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<Approveruser>(
                          isExpanded: true,
                          //value: state.ApprovalAuthorityType,
                          style: GoogleFonts.montserrat(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w800,
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xffBEBEC2),
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10)
                                .r,
                            border: InputBorder.none,
                          ),
                          items: state.firstApproverUsers
                              .map<DropdownMenuItem<Approveruser>>(
                                  (Approveruser value) {
                            return DropdownMenuItem<Approveruser>(
                              value: value,
                              child: AutoSizeText(value.name ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff131925),
                                  )),
                            );
                          }).toList(),
                          onChanged: (Approveruser? newValue) {
                            controller.updateFirstApprover(newValue);
                          },
                        ),
                      )),
                  15.ph,
                  Text('Select Final Approver*',
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff131925),
                      )),
                  5.ph,
                  Container(
                      // height: 42.h,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(6).r,
                        // border: Border.all(
                        //   color: const Color(0xffE4E4E4),
                        // ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(
                              2.0,
                              6.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<Approveruser>(
                          isExpanded: true,
                          // value: state.ApprovalAuthorityType,
                          style: GoogleFonts.montserrat(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w800,
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xffBEBEC2),
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10)
                                .r,
                            border: InputBorder.none,
                          ),
                          items: state.finalApproverUsers
                              .map<DropdownMenuItem<Approveruser>>(
                                  (Approveruser value) {
                            return DropdownMenuItem<Approveruser>(
                              value: value,
                              child: AutoSizeText(value.name ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff131925),
                                  )),
                            );
                          }).toList(),
                          onChanged: (Approveruser? newValue) {
                            controller.updateFinalApprover(newValue);
                          },
                        ),
                      )),
                  56.ph,
                  state.isLoading
                      ? const CircularProgressIndicator()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 25.h,
                                width: 90.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5).r,
                                    color: Color(0xffF6F6F6)),
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: GoogleFonts.montserrat(
                                      color: const Color(0xff504A4A),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.saveApprovalAuthority(
                                    companyId:
                                        controller.person!.data!.companyId,
                                    moduleId: state.selectedmoduleId,
                                    moduleFunctionId:
                                        state.selectedSubmodule!.id,
                                    moduleActionId:
                                        state.selectedmoduleactionforadd!.id,
                                    userId:
                                        state.selectedApprovalauthorityuser!.id,
                                    amount: controller
                                        .totalPriceAmountController.text,
                                    condOperator:
                                        state.selectedConditionOperator,
                                    firstApproverId:
                                        state.selectedFirstApproverId,
                                    finalApproverId:
                                        state.selectedFinalApproverId,
                                    createdBy: controller.person!.data!.id,
                                    context: context);
                              },
                              child: Container(
                                height: 25.h,
                                width: 90.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5).r,
                                    gradient: const LinearGradient(colors: [
                                      Color(0xff2751A1),
                                      Color(0xff4BB3CF)
                                    ])),
                                child: Center(
                                  child: Text(
                                    'Save',
                                    style: GoogleFonts.montserrat(
                                      color: whiteColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ),
    );
  }
}
