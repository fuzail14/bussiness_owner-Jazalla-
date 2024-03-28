import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Module/GeneralServices/RequestProposal/Model/ServiceWithTemplate.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:bussines_owner/Widgets/CustomButton/custom_button.dart';
import 'package:bussines_owner/Widgets/Loader/loader.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Constants/constants.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../Controller/request_proposal_controller.dart';

class RequestProposalScreen extends ConsumerWidget {
  int buiuld = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('quote inquiry build check ${buiuld++}');
    final requestProposalState = ref.watch(requestProposalProvider);
    final requestProposalcontroller =
        ref.watch(requestProposalProvider.notifier);

    print('service id  ${requestProposalcontroller.serviceId}');
    print("user id ${requestProposalcontroller.userId}");
    print(
        'service provider company id ${requestProposalcontroller.serviceCompanyId}');
    print("buyer id ${requestProposalcontroller.userCompanyId}");

    return Scaffold(
      appBar: MyAppBar(
        title: 'Request For Proposal',
        showBell: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 20, right: 40, bottom: 40).r,
          child: Form(
            key: requestProposalcontroller.key,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (requestProposalState.responseStatus == Status.loading)
                const Loader()
              else if (requestProposalState.responseStatus ==
                  Status.completed) ...[
                Text(
                  'Request Details*',
                  style: GoogleFonts.montserrat(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff4D4D4D)),
                ),
                5.ph,
                Container(
                  height: 117.h,
                  //width: 311.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xff19A3A3)),
                  ),
                  child: TextFormField(
                    maxLines: 5,
                    controller: requestProposalcontroller.descriptionController,
                    validator: emptyStringValidator,
                    decoration: const InputDecoration(
                      hintText: 'Enter your description here',
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                16.ph,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Service Type*",
                            style: GoogleFonts.montserrat(
                              color: Color(0xff4D4D4D),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            )),
                        7.ph,
                        Container(
                          width: 145.w,
                          height: 43.h,
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            border: Border.all(color: const Color(0xFF19A3A3)),
                          ),
                          child: Center(
                            child: Text(requestProposalState
                                .serviceDetailForProposal!.serviceType!
                                .toString()),
                          ),
                        )
                      ],
                    ),
                    20.pw,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Payment Mode*",
                            style: GoogleFonts.montserrat(
                              color: Color(0xff4D4D4D),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            )),
                        7.ph,
                        Container(
                          width: 145.w,
                          height: 43.h,
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            border: Border.all(color: const Color(0xFF19A3A3)),
                          ),
                          child: Center(
                            child: Text(requestProposalState
                                .serviceDetailForProposal!.paymentMode
                                .toString()),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                20.ph,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Delivery Date*",
                        style: GoogleFonts.montserrat(
                          color: Color(0xff4D4D4D),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        )),
                    7.ph,
                    MyTextFormField(
                      enableBorderSideRadius: 6.0,
                      fillColor: Colors.transparent,
                      borderSideColor: borderColor,
                      width: double.infinity.w,
                      // height: 83.h,
                      onTap: () {
                        requestProposalcontroller.StartDate(context);
                      },
                      suffixIcon: const Icon(Icons.calendar_month,
                          size: 20, color: Color(0xFF19A3A3)),
                      controller: requestProposalcontroller.dateController,
                      validator: emptyStringValidator,
                      hintText: 'Delivery Date',
                      labelText: 'Date',
                    ),
                  ],
                ),

                20.ph,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Proposed Duration Time*",
                        style: GoogleFonts.montserrat(
                          color: Color(0xff4D4D4D),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        )),
                    7.ph,
                    MyTextFormField(
                      fillColor: Colors.transparent,
                      borderSideColor: borderColor,
                      enableBorderSideRadius: 6.0,
                      width: double.infinity.w,
                      textInputType: TextInputType.number,
                      // height: 83.h,
                      onTap: () {},
                      suffixIcon: const Icon(Icons.timelapse,
                          size: 20, color: Color(0xFF19A3A3)),
                      controller:
                          requestProposalcontroller.proposedDurationController,
                      validator: emptyStringValidator,
                      hintText: 'Proposed Duration Time',
                      labelText: '10',
                    ),
                  ],
                ),

                20.ph,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Proposed Duration Unit *",
                        style: GoogleFonts.montserrat(
                          color: Color(0xff4D4D4D),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        )),
                    7.ph,
                    Container(
                      width: double.infinity.w,
                      // height: 43.h,
                      padding: const EdgeInsets.only(left: 4.0, right: 4.0).r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0).r,
                        border: Border.all(color: borderColor),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          value: requestProposalState.proposedDurationValue,
                          style: GoogleFonts.montserrat(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w800,
                          ),
                          icon: const Icon(Icons.arrow_drop_down,
                              color: Color(0xFF19A3A3)),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            border: InputBorder.none,
                          ),
                          items: requestProposalcontroller.proposedDurationItems
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: AutoSizeText(value,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF657474))),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            requestProposalcontroller
                                .updateProposedDurationValue(newValue!);
                          },
                        ),
                      ),
                    )
                  ],
                ),
                if (requestProposalState.proposedDurationValue == 'Others') ...[
                  20.ph,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Other Proposed Duration Unit *",
                          style: GoogleFonts.montserrat(
                            color: Color(0xff4D4D4D),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          )),
                      7.ph,
                      MyTextFormField(
                        fillColor: Colors.transparent,
                        borderSideColor: borderColor,
                        width: double.infinity.w,
                        enableBorderSideRadius: 6.0,
                        textInputType: TextInputType.number,
                        // height: 83.h,
                        onTap: () {},
                        suffixIcon: const Icon(Icons.ac_unit,
                            size: 20, color: Color(0xFF19A3A3)),
                        controller: requestProposalcontroller
                            .otherproposedDurationUnitController,
                        validator: emptyStringValidator,
                        hintText: 'Other Proposed Duration Unit',
                        labelText: 'Proposed Duration Unit',
                      ),
                    ],
                  ),
                ],

                20.ph,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Service Location (Address) *",
                        style: GoogleFonts.montserrat(
                          color: Color(0xff4D4D4D),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        )),
                    7.ph,
                    Container(
                      width: double.infinity.w,
                      // height: 43.h,
                      padding: const EdgeInsets.only(left: 4.0, right: 4.0).r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0).r,
                        border: Border.all(color: borderColor),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          value: requestProposalState.locationAddressValue,
                          style: GoogleFonts.montserrat(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w800,
                          ),
                          icon: const Icon(Icons.arrow_drop_down,
                              color: Color(0xFF19A3A3)),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            border: InputBorder.none,
                          ),
                          items: requestProposalcontroller.shippingAddress
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: AutoSizeText(value,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF657474))),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            requestProposalcontroller
                                .updatelocationAddressValue(newValue!);
                          },
                        ),
                      ),
                    )
                  ],
                ),

                if (requestProposalState.locationAddressValue ==
                    'Alternate Address') ...[
                  20.ph,
                  CSCPicker(
                    defaultCountry: CscCountry.Saudi_Arabia,
                    showStates: true,
                    showCities: true,
                    flagState: CountryFlag.ENABLE,
                    dropdownDecoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                        border: Border.all(color: borderColor, width: 1)),
                    disabledDropdownDecoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        // color: Colors.grey.shade300,
                        border: Border.all(color: borderColor, width: 1)),
                    stateSearchPlaceholder: "State",
                    citySearchPlaceholder: "City",
                    stateDropdownLabel: "*State",
                    cityDropdownLabel: "*City",
                    selectedItemStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    dropdownHeadingStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                    dropdownItemStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    dropdownDialogRadius: 10.0,
                    searchBarRadius: 10.0,
                    onCountryChanged: (val) {
                      requestProposalcontroller.countryName = val.toString();
                    },
                    onStateChanged: (val) {
                      requestProposalcontroller.stateName = val.toString();
                    },
                    onCityChanged: (val) {
                      requestProposalcontroller.cityName = val.toString();
                    },
                  ),
                  20.ph,
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("District",
                              style: GoogleFonts.montserrat(
                                color: Color(0xff4D4D4D),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              )),
                          7.ph,
                          Container(
                            width: 140.w,
                            height: 43.h,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              border:
                                  Border.all(color: const Color(0xFF19A3A3)),
                            ),
                            child: TextFormField(
                              controller:
                                  requestProposalcontroller.districtController,

                              keyboardType: TextInputType.number,

                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                              // onChanged: (value) {
                              //   onQuantityChanged(value);
                              // },
                            ),
                          )
                        ],
                      ),
                      20.pw,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Street",
                              style: GoogleFonts.montserrat(
                                color: Color(0xff4D4D4D),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              )),
                          7.ph,
                          Container(
                            width: 140.w,
                            height: 43.h,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xff19A3A3)),
                            ),
                            child: TextFormField(
                              controller:
                                  requestProposalcontroller.streetController,
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp, fontWeight: FontWeight.w400),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  20.ph,
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Zip Code",
                              style: GoogleFonts.montserrat(
                                color: Color(0xff4D4D4D),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              )),
                          7.ph,
                          Container(
                            width: 140.w,
                            height: 43.h,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              border:
                                  Border.all(color: const Color(0xFF19A3A3)),
                            ),
                            child: TextFormField(
                              controller:
                                  requestProposalcontroller.zipCodeController,

                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                              // onChanged: (value) {
                              //   onQuantityChanged(value);
                              // },
                            ),
                          )
                        ],
                      ),
                      20.pw,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Building No",
                              style: GoogleFonts.montserrat(
                                color: Color(0xff4D4D4D),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              )),
                          7.ph,
                          Container(
                            width: 140.w,
                            height: 43.h,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xff19A3A3)),
                            ),
                            child: TextFormField(
                              controller: requestProposalcontroller
                                  .buildingNoController,
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.sp, fontWeight: FontWeight.w400),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  20.ph,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Unit No",
                          style: GoogleFonts.montserrat(
                            color: Color(0xff4D4D4D),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          )),
                      7.ph,
                      Container(
                        //width: 140.w,
                        height: 43.h,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Color(0xff19A3A3)),
                        ),
                        child: TextFormField(
                          controller:
                              requestProposalcontroller.unitNoController,
                          style: GoogleFonts.montserrat(
                              fontSize: 12.sp, fontWeight: FontWeight.w400),
                          decoration: const InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],

                20.ph,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Select Template*',
                        style: GoogleFonts.montserrat(
                          color: Color(0xff4D4D4D),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        )),
                    7.ph,
                    Container(
                      width: double.infinity.w,
                      padding: const EdgeInsets.only(left: 4.0, right: 4.0).r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0).r,
                        border: Border.all(color: borderColor),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<int>(
                          isExpanded: true,
                          value: requestProposalState.selectedTemplateId,
                          style: GoogleFonts.montserrat(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w800,
                          ),
                          icon: const Icon(Icons.arrow_drop_down,
                              color: Color(0xFF19A3A3)),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            border: InputBorder.none,
                          ),
                          items: requestProposalState.proposalTemplate
                              .map<DropdownMenuItem<int>>(
                                  (ProposalTemplate template) {
                            return DropdownMenuItem<int>(
                              value: template.id,
                              child: AutoSizeText(
                                template.title.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.montserrat(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF657474)),
                              ),
                            );
                          }).toList(),
                          onChanged: (int? newValue) {
                            print(newValue);
                            requestProposalcontroller
                                .updateTemplateValue(newValue!);
                          },
                        ),
                      ),
                    )
                  ],
                ),

                20.ph,

                //Pdf File
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Choose Pdf File",
                            style: GoogleFonts.montserrat(
                              color: Color(0xff4D4D4D),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            )),
                        7.ph,
                        Container(
                          width: 311.w,
                          height: 43.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff19A3A3))),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['pdf'],
                                  );

                                  if (result != null) {
                                    File file = File(result.files.single.path!);
                                    ref
                                        .read(requestProposalProvider.notifier)
                                        .setPdfFile(file);
                                  }
                                },
                                child: Container(
                                  width: 76.w,
                                  height: 43.h,
                                  decoration: BoxDecoration(
                                      color: Color(0xffF7F7F9),
                                      border:
                                          Border.all(color: Color(0xff19A3A3))),
                                  child: Center(
                                    child: Text(
                                      'Choose File',
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10.sp,
                                          color: Color(0xff657474)),
                                    ),
                                  ),
                                ),
                              ),
                              20.pw,
                              if (requestProposalState.pdfFile != null) ...[
                                Container(
                                  child: Text(
                                    requestProposalState.pdfFile?.path
                                            .split('/')
                                            .last ??
                                        'No file selected',
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                        color: Color(0xff657474)),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                20.ph,
                requestProposalState.isLoading
                    ? Loader()
                    : Center(
                        child: CustomButton(
                          onTap: () {
                            String rawCountryName =
                                requestProposalcontroller.countryName;

                            RegExp regExp = RegExp(r'[A-Za-z ]+$');
                            Match? match = regExp.firstMatch(rawCountryName);

                            String countryName = "";
                            if (match != null) {
                              countryName = match.group(0)!.trim();
                            }

                            print(countryName);

                            if (requestProposalcontroller.key.currentState!
                                .validate()) {
                              ref
                                  .read(requestProposalProvider.notifier)
                                  .sendProposal(
                                    serviceId:
                                        requestProposalcontroller.serviceId,
                                    userId: requestProposalcontroller.userId,
                                    userCompanyId:
                                        requestProposalcontroller.userCompanyId,
                                    companyId: requestProposalState
                                        .serviceDetailForProposal!.companyId,
                                    title: requestProposalState
                                        .serviceDetailForProposal!.name,
                                    description: requestProposalcontroller
                                        .descriptionController.text,
                                    // quantity: quantityController.text,
                                    proposedDurationTime:
                                        requestProposalcontroller
                                            .proposedDurationController.text,
                                    proposedDurationUnit: requestProposalState
                                        .proposedDurationValue,
                                    otherProposedDurationUnit:
                                        requestProposalcontroller
                                            .otherproposedDurationUnitController
                                            .text,

                                    paymentMode: requestProposalState
                                        .serviceDetailForProposal!.paymentMode,

                                    templateId:
                                        requestProposalState.selectedTemplateId,
                                    location: requestProposalState
                                        .locationAddressValue,

                                    startDate: requestProposalcontroller
                                        .dateController.text,
                                    pdfFile: requestProposalState.pdfFile,
                                    context: context,
                                    countryName: countryName,
                                    stateName:
                                        requestProposalcontroller.stateName,
                                    cityName:
                                        requestProposalcontroller.cityName,
                                    district: requestProposalcontroller
                                        .districtController.text,
                                    streetName: requestProposalcontroller
                                        .streetController.text,
                                    zipCode: requestProposalcontroller
                                        .zipCodeController.text,
                                    buildingNo: requestProposalcontroller
                                        .buildingNoController.text,
                                    unitNo: requestProposalcontroller
                                        .unitNoController.text,
                                  );
                            }
                          },
                          width: 200.w,
                          height: 48.h,
                          color: Color(0xff27BCEB),
                          text: 'Send Quotation',
                        ),
                      ),
              ]
            ]),
          ),
        ),
      ),
    );
  }
}
