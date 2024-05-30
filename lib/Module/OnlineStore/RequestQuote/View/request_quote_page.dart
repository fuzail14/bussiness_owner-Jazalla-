import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:bussines_owner/Widgets/CustomButton/custom_button.dart';
import 'package:bussines_owner/Widgets/Loader/loader.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Constants/constants.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Widgets/DescriptionTextField/description_field_attachment.dart';
import '../../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../Controller/request_quote_controller.dart';
import '../Model/ProductWithTemplate.dart';

class RequestQuoteScreen extends ConsumerStatefulWidget {
  const RequestQuoteScreen({super.key});

  @override
  _RequestQuoteScreenState createState() => _RequestQuoteScreenState();
}

class _RequestQuoteScreenState extends ConsumerState<RequestQuoteScreen> {
  late TextEditingController quantityController;
  late FocusNode quantityFocusNode;
  @override
  void initState() {
    super.initState();

    final requestQuoteState = ref.read(requestQuoteProvider);
    int initialQuantity =
        int.tryParse(requestQuoteState.productDetail?.minQty ?? '0') ?? 0;
    quantityController =
        TextEditingController(text: initialQuantity.toString());
    quantityFocusNode = FocusNode();

    // Add listener to focus node
    quantityFocusNode.addListener(() {
      if (!quantityFocusNode.hasFocus) {
        enforceMinQuantity();
      }
    });
  }

  @override
  void dispose() {
    quantityController.dispose();
    quantityFocusNode.dispose();
    super.dispose();
  }

  void enforceMinQuantity() {
    int currentQuantity = int.tryParse(quantityController.text) ?? 0;
    int minQty = int.tryParse(
            ref.read(requestQuoteProvider).productDetail?.minQty ?? "0") ??
        0;

    if (currentQuantity < minQty) {
      Fluttertoast.showToast(
          msg: 'Quantity cannot be less than $minQty',
          gravity: ToastGravity.CENTER);
      quantityController.text = minQty.toString();
    }
  }

  void onQuantityChanged(String newQuantityStr) {
    if (newQuantityStr.isEmpty) {
      // Allow the field to be empty to enable user to enter a new value
      return;
    }

    int newQuantity = int.tryParse(newQuantityStr) ?? 0;
    int minQty = int.tryParse(
            ref.read(requestQuoteProvider).productDetail?.minQty ?? "0") ??
        0;

    if (newQuantity < minQty) {
      Fluttertoast.showToast(
          msg: 'Quantity cannot be less than $minQty',
          gravity: ToastGravity.CENTER);

      setState(() {
        quantityController.text = minQty.toString(); // Reset to minQty
      });
    }
  }

  int buiuld = 0;

  @override
  Widget build(BuildContext context) {
    print('quote inquiry build check ${buiuld++}');
    final requestQuoteState = ref.watch(requestQuoteProvider);
    final requestQuotecontroller = ref.watch(requestQuoteProvider.notifier);

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: MyAppBar(
        title: 'Request For Quote',
        showBell: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 40).r,
          child: Form(
            key: requestQuotecontroller.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (requestQuoteState.responseStatus == Status.loading)
                  const Loader()
                else if (requestQuoteState.responseStatus ==
                    Status.completed) ...[
                  Text(
                    'Request Details*',
                    style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff4D4D4D)),
                  ),
                  10.ph,
                  Container(
                    height: 117.h,
                    padding: const EdgeInsets.only(
                            top: 12.5, left: 16, right: 16, bottom: 23)
                        .r,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(7).r,
                      border: Border.all(color: Color(0xffEFEFF2)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          offset: const Offset(
                            1.0,
                            1.0,
                          ),
                          blurRadius: 12.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: TextFormField(
                      validator: emptyStringValidator,
                      maxLines: 5,
                      controller: requestQuotecontroller.descriptionController,
                      decoration: InputDecoration(
                          hintText: 'Enter Your Details Here...',
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xffC8C7CC)),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),

                  16.ph,
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Quantity Needed *",
                              style: GoogleFonts.montserrat(
                                color: const Color(0xff4D4D4D),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              )),
                          7.ph,
                          Container(
                            width: 154.w,
                            height: 32.h,
                            padding: const EdgeInsets.only(
                                    top: 0, left: 16, right: 16, bottom: 0)
                                .r,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(7).r,
                              border: Border.all(color: Color(0xffEFEFF2)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  offset: const Offset(
                                    1.0,
                                    1.0,
                                  ),
                                  blurRadius: 12.0,
                                  spreadRadius: 1.0,
                                ),
                              ],
                            ),
                            child: TextFormField(
                              validator: emptyStringValidator,
                              maxLines: 1,
                              controller: quantityController,
                              focusNode: quantityFocusNode,
                              keyboardType: TextInputType.number,
                              cursorHeight: 10,
                              decoration: InputDecoration(
                                  hintText: 'Enter Quantity...',
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xffC8C7CC)),
                                  contentPadding: EdgeInsets.only(
                                    bottom: 10.h,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none),
                            ),
                          ),
                          // Container(
                          //   width: 140.w,
                          //   height: 43.h,
                          //   padding:
                          //       const EdgeInsets.symmetric(horizontal: 4.0),
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(6.0),
                          //     border:
                          //         Border.all(color: const Color(0xFF19A3A3)),
                          //   ),
                          //   child: TextFormField(
                          //     controller: quantityController,
                          //     focusNode: quantityFocusNode,
                          //     keyboardType: TextInputType.number,
                          //     decoration: const InputDecoration(
                          //       border: OutlineInputBorder(
                          //           borderSide: BorderSide.none),
                          //     ),
                          //     // onChanged: (value) {
                          //     //   onQuantityChanged(value);
                          //     // },
                          //   ),
                          // )
                        ],
                      ),
                      20.pw,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Item Unit*",
                                style: GoogleFonts.montserrat(
                                  color: const Color(0xff4D4D4D),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                )),
                            7.ph,
                            Container(
                              // width: 154.w,
                              height: 32.h,
                              padding: const EdgeInsets.only(
                                      top: 0, left: 16, right: 16, bottom: 0)
                                  .r,
                              decoration: BoxDecoration(
                                color: Color(0xffE4E4E4).withOpacity(0.4),
                                borderRadius: BorderRadius.circular(7).r,
                                border: Border.all(color: Color(0xffEFEFF2)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    offset: const Offset(
                                      1.0,
                                      1.0,
                                    ),
                                    blurRadius: 12.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: AutoSizeText(
                                  requestQuoteState.productDetail!.unit
                                      .toString(),
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            // Container(
                            //   width: 140.w,
                            //   height: 43.h,
                            //   padding: const EdgeInsets.symmetric(
                            //       vertical: 8.0, horizontal: 8.0),
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(8),
                            //     border:
                            //         Border.all(color: const Color(0xff19A3A3)),
                            //   ),
                            //   child: Center(
                            //     child: AutoSizeText(
                            //       requestQuoteState.productDetail!.unit
                            //           .toString(),
                            //       style: GoogleFonts.montserrat(
                            //           fontSize: 12.sp,
                            //           fontWeight: FontWeight.w400),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  20.ph,
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Delivery Date*",
                              style: GoogleFonts.montserrat(
                                color: const Color(0xff4D4D4D),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              )),
                          7.ph,
                          Container(
                            width: 154.w,
                            height: 32.h,
                            padding: const EdgeInsets.only(
                                    top: 0, left: 16, right: 0, bottom: 0)
                                .r,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(7).r,
                              border: Border.all(color: Color(0xffEFEFF2)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  offset: const Offset(
                                    1.0,
                                    1.0,
                                  ),
                                  blurRadius: 12.0,
                                  spreadRadius: 1.0,
                                ),
                              ],
                            ),
                            child: TextFormField(
                              onTap: () {
                                requestQuotecontroller.StartDate(context);
                              },
                              validator: emptyStringValidator,
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              controller: requestQuotecontroller.dateController,
                              cursorHeight: 10,
                              decoration: InputDecoration(
                                  suffixIcon: const Icon(Icons.calendar_month,
                                      size: 20, color: Color(0xFF19A3A3)),
                                  hintText: 'Delivery Date',
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xffC8C7CC)),
                                  contentPadding: EdgeInsets.only(
                                    bottom: 10.h,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none),
                            ),

                            //  MyTextFormField(
                            //   fillColor: Colors.transparent,
                            //   //borderSideColor: borderColor,
                            //   width: 150.w,
                            //   // height: 83.h,
                            //   onTap: () {
                            //     requestQuotecontroller.StartDate(context);
                            //   },
                            //   suffixIcon: const Icon(Icons.calendar_month,
                            //       size: 20, color: Color(0xFF19A3A3)),
                            //   controller: requestQuotecontroller.dateController,
                            //   validator: emptyStringValidator,
                            //   hintText: 'Delivery Date',
                            //   labelText: 'Date',
                            // ),
                          ),
                        ],
                      ),
                      20.pw,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Select Payment Mode*",
                                style: GoogleFonts.montserrat(
                                  color: const Color(0xff4D4D4D),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                )),
                            7.ph,
                            if (requestQuoteState.productDetail!.paymentMode ==
                                null) ...[
                              Container(
                                //  width: 154.w,
                                height: 32.h,
                                padding: const EdgeInsets.only(
                                        top: 0, left: 16, right: 0, bottom: 0)
                                    .r,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(7).r,
                                  border: Border.all(color: Color(0xffEFEFF2)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      offset: const Offset(
                                        1.0,
                                        1.0,
                                      ),
                                      blurRadius: 12.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ],
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField<String>(
                                    isExpanded: true,
                                    value: requestQuoteState.paymentValue,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 2.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    icon: const Icon(Icons.arrow_drop_down,
                                        color: Color(0xFF19A3A3)),
                                    decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(0, 0, 0, 20),
                                      border: InputBorder.none,
                                    ),
                                    items: requestQuotecontroller.paymentMode
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
                                                color:
                                                    const Color(0xFF657474))),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      requestQuotecontroller
                                          .updatePaymentModeValue(newValue!);
                                    },
                                  ),
                                ),
                              )
                            ] else
                              Container(
                                height: 32.h,
                                padding: const EdgeInsets.only(
                                        top: 0, left: 16, right: 0, bottom: 0)
                                    .r,
                                decoration: BoxDecoration(
                                  color: Color(0xffE4E4E4).withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(7).r,
                                  border: Border.all(color: Color(0xffEFEFF2)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      offset: const Offset(
                                        1.0,
                                        1.0,
                                      ),
                                      blurRadius: 12.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: AutoSizeText(
                                    requestQuoteState.productDetail!.paymentMode
                                        .toString(),
                                    maxLines: 2,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  20.ph,
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Shipping Mode*",
                              style: GoogleFonts.montserrat(
                                color: const Color(0xff4D4D4D),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              )),
                          7.ph,
                          Container(
                            width: 154.w,
                            height: 32.h,
                            padding: const EdgeInsets.only(
                                    top: 0, left: 16, right: 05, bottom: 0)
                                .r,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(7).r,
                              border: Border.all(color: Color(0xffEFEFF2)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  offset: const Offset(
                                    1.0,
                                    1.0,
                                  ),
                                  blurRadius: 12.0,
                                  spreadRadius: 1.0,
                                ),
                              ],
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField<String>(
                                isExpanded: true,
                                value: requestQuoteState.shippingModeValue,
                                style: GoogleFonts.montserrat(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                                icon: const Icon(Icons.arrow_drop_down,
                                    color: Color(0xFF19A3A3)),
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  border: InputBorder.none,
                                ),
                                items: requestQuotecontroller.shippingMode
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: AutoSizeText(value,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF657474))),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  requestQuotecontroller
                                      .updateShippingModeValue(newValue!);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      20.pw,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Select Template*',
                                style: GoogleFonts.montserrat(
                                  color: const Color(0xff4D4D4D),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                )),
                            7.ph,
                            Container(
                              // width: 154.w,
                              height: 32.h,
                              padding: const EdgeInsets.only(
                                      top: 0, left: 16, right: 05, bottom: 0)
                                  .r,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(7).r,
                                border: Border.all(color: Color(0xffEFEFF2)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    offset: const Offset(
                                      1.0,
                                      1.0,
                                    ),
                                    blurRadius: 12.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<int>(
                                  isExpanded: true,
                                  value: requestQuoteState.selectedTemplateId,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  icon: const Icon(Icons.arrow_drop_down,
                                      color: Color(0xFF19A3A3)),
                                  decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    border: InputBorder.none,
                                  ),
                                  items: requestQuoteState.quotationTemplate
                                      .map<DropdownMenuItem<int>>(
                                          (QuotationTemplate template) {
                                    return DropdownMenuItem<int>(
                                      value: template.id,
                                      child: AutoSizeText(
                                        template.title.toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xFF657474)),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (int? newValue) {
                                    print(newValue);
                                    requestQuotecontroller
                                        .updateTemplateValue(newValue!);
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  20.ph,

                  if (requestQuoteState.shippingModeValue ==
                      'DAP (Delivered at Place)') ...[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Shipping Address*",
                            style: GoogleFonts.montserrat(
                              color: const Color(0xff4D4D4D),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            )),
                        7.ph,
                        Container(
                          // width: 359.w,
                          // height: 43.h,

                          height: 32.h,
                          // padding: const EdgeInsets.only(
                          //         top: 0, left: 16, right: 0, bottom: 0)
                          //     .r,
                          padding: const EdgeInsets.only(
                                  top: 12.5, left: 16, right: 05, bottom: 23)
                              .r,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(7).r,
                            border: Border.all(color: Color(0xffEFEFF2)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                offset: const Offset(
                                  1.0,
                                  1.0,
                                ),
                                blurRadius: 12.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField<String>(
                              isExpanded: true,
                              value: requestQuoteState.shippingAddressValue,
                              style: GoogleFonts.montserrat(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w800,
                              ),
                              icon: const Icon(Icons.arrow_drop_down,
                                  color: Color(0xFF19A3A3)),
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(0, 0, 0, 10),
                                border: InputBorder.none,
                              ),
                              items: requestQuotecontroller.shippingAddress
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: AutoSizeText(value,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF657474))),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                requestQuotecontroller
                                    .updateShippingAddressValue(newValue!);
                              },
                            ),
                          ),
                        ),
                        20.ph,
                      ],
                    ),
                  ],

                  if (requestQuoteState.shippingModeValue ==
                          'DAP (Delivered at Place)' &&
                      requestQuoteState.shippingAddressValue ==
                          'Alternate Address') ...[
                    Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: CSCPicker(
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
                          requestQuotecontroller.countryName = val.toString();
                        },
                        onStateChanged: (val) {
                          requestQuotecontroller.stateName = val.toString();
                        },
                        onCityChanged: (val) {
                          requestQuotecontroller.cityName = val.toString();
                        },
                      ),
                    ),
                    20.ph,
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("District",
                                style: GoogleFonts.montserrat(
                                  color: const Color(0xff4D4D4D),
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
                                    requestQuotecontroller.districtController,

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
                                  color: const Color(0xff4D4D4D),
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
                                border:
                                    Border.all(color: const Color(0xff19A3A3)),
                              ),
                              child: TextFormField(
                                controller:
                                    requestQuotecontroller.streetController,
                                style: GoogleFonts.montserrat(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400),
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
                                  color: const Color(0xff4D4D4D),
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
                                    requestQuotecontroller.zipCodeController,

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
                                  color: const Color(0xff4D4D4D),
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
                                border:
                                    Border.all(color: const Color(0xff19A3A3)),
                              ),
                              child: TextFormField(
                                controller:
                                    requestQuotecontroller.buildingNoController,
                                style: GoogleFonts.montserrat(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400),
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
                              color: const Color(0xff4D4D4D),
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
                            border: Border.all(color: const Color(0xff19A3A3)),
                          ),
                          child: TextFormField(
                            controller: requestQuotecontroller.unitNoController,
                            style: GoogleFonts.montserrat(
                                fontSize: 12.sp, fontWeight: FontWeight.w400),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                        20.ph,
                      ],
                    ),
                  ],

                  //Pdf File

                  attachmentCustom(
                    pdfOnTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf'],
                      );

                      if (result != null) {
                        File file = File(result.files.single.path!);
                        ref
                            .read(requestQuoteProvider.notifier)
                            .setPdfFile(file);
                      }
                    },
                    fileName: requestQuoteState.pdfFile?.path.split('/').last,
                    browseButtonOnTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf'],
                      );

                      if (result != null) {
                        File file = File(result.files.single.path!);
                        ref
                            .read(requestQuoteProvider.notifier)
                            .setPdfFile(file);
                      }
                    },
                    buttonLoading: requestQuoteState.isLoading,
                    buttonName: 'Send Quotation',
                    buttonOnTap: () {
                      String rawCountryName =
                          requestQuotecontroller.countryName;

                      RegExp regExp = RegExp(r'[A-Za-z ]+$');
                      Match? match = regExp.firstMatch(rawCountryName);

                      String countryName = "";
                      if (match != null) {
                        countryName = match.group(0)!.trim();
                      }

                      print(countryName);

                      if (requestQuotecontroller.key.currentState!.validate()) {
                        ref.read(requestQuoteProvider.notifier).sendQuotation(
                              productId: requestQuotecontroller.productId,
                              userId: requestQuotecontroller.userId,
                              userCompanyId:
                                  requestQuotecontroller.userCompanyId,
                              companyId:
                                  requestQuoteState.productDetail!.companyId,
                              title: requestQuoteState.productDetail!.name,
                              description: requestQuotecontroller
                                  .descriptionController.text,
                              quantity: quantityController.text,
                              unit: requestQuoteState.productDetail!.unit,
                              paymentMode: requestQuoteState.paymentValue,
                              shippingMode: requestQuoteState.shippingModeValue,
                              templateId: requestQuoteState.selectedTemplateId,
                              shippingAddress:
                                  requestQuoteState.shippingAddressValue,
                              deliveryDate:
                                  requestQuotecontroller.dateController.text,
                              pdfFile: requestQuoteState.pdfFile,
                              context: context,
                              countryName: countryName,
                              stateName: requestQuotecontroller.stateName,
                              cityName: requestQuotecontroller.cityName,
                              district: requestQuotecontroller
                                  .districtController.text,
                              streetName:
                                  requestQuotecontroller.streetController.text,
                              zipCode:
                                  requestQuotecontroller.zipCodeController.text,
                              buildingNo: requestQuotecontroller
                                  .buildingNoController.text,
                              unitNo:
                                  requestQuotecontroller.unitNoController.text,
                            );
                      }
                    },
                  )

                  // Row(
                  //   children: [
                  //     Container(
                  //       width: 300.w,
                  //       height: 43.h,
                  //       decoration: BoxDecoration(
                  //           border: Border.all(color: const Color(0xff19A3A3))),
                  //       child: Row(
                  //         children: [
                  //           GestureDetector(
                  //             onTap: () async {
                  //               FilePickerResult? result =
                  //                   await FilePicker.platform.pickFiles(
                  //                 type: FileType.custom,
                  //                 allowedExtensions: ['pdf'],
                  //               );

                  //               if (result != null) {
                  //                 File file = File(result.files.single.path!);
                  //                 ref
                  //                     .read(requestQuoteProvider.notifier)
                  //                     .setPdfFile(file);
                  //               }
                  //             },
                  //             child: Container(
                  //               width: 76.w,
                  //               height: 43.h,
                  //               decoration: BoxDecoration(
                  //                   color: const Color(0xffF7F7F9),
                  //                   border: Border.all(
                  //                       color: const Color(0xff19A3A3))),
                  //               child: Center(
                  //                 child: Text(
                  //                   'Choose File',
                  //                   style: GoogleFonts.montserrat(
                  //                       fontWeight: FontWeight.w400,
                  //                       fontSize: 10.sp,
                  //                       color: const Color(0xff657474)),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           20.pw,
                  //           if (requestQuoteState.pdfFile != null) ...[
                  //             Container(
                  //               child: Text(
                  //                 requestQuoteState.pdfFile?.path
                  //                         .split('/')
                  //                         .last ??
                  //                     'No file selected',
                  //                 style: GoogleFonts.montserrat(
                  //                     fontWeight: FontWeight.w600,
                  //                     fontSize: 12.sp,
                  //                     color: const Color(0xff657474)),
                  //               ),
                  //             ),
                  //           ],
                  //         ],
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // 20.ph,
                  // requestQuoteState.isLoading
                  //     ? const Loader()
                  //     : CustomButton(
                  //         onTap: () {
                  //           String rawCountryName =
                  //               requestQuotecontroller.countryName;

                  //           RegExp regExp = RegExp(r'[A-Za-z ]+$');
                  //           Match? match = regExp.firstMatch(rawCountryName);

                  //           String countryName = "";
                  //           if (match != null) {
                  //             countryName = match.group(0)!.trim();
                  //           }

                  //           print(countryName);

                  //           if (requestQuotecontroller.key.currentState!
                  //               .validate()) {
                  //             ref
                  //                 .read(requestQuoteProvider.notifier)
                  //                 .sendQuotation(
                  //                   productId: requestQuotecontroller.productId,
                  //                   userId: requestQuotecontroller.userId,
                  //                   userCompanyId:
                  //                       requestQuotecontroller.userCompanyId,
                  //                   companyId: requestQuoteState
                  //                       .productDetail!.companyId,
                  //                   title:
                  //                       requestQuoteState.productDetail!.name,
                  //                   description: requestQuotecontroller
                  //                       .descriptionController.text,
                  //                   quantity: quantityController.text,
                  //                   unit: requestQuoteState.productDetail!.unit,
                  //                   paymentMode: requestQuoteState.paymentValue,
                  //                   shippingMode:
                  //                       requestQuoteState.shippingModeValue,
                  //                   templateId:
                  //                       requestQuoteState.selectedTemplateId,
                  //                   shippingAddress:
                  //                       requestQuoteState.shippingAddressValue,
                  //                   deliveryDate: requestQuotecontroller
                  //                       .dateController.text,
                  //                   pdfFile: requestQuoteState.pdfFile,
                  //                   context: context,
                  //                   countryName: countryName,
                  //                   stateName: requestQuotecontroller.stateName,
                  //                   cityName: requestQuotecontroller.cityName,
                  //                   district: requestQuotecontroller
                  //                       .districtController.text,
                  //                   streetName: requestQuotecontroller
                  //                       .streetController.text,
                  //                   zipCode: requestQuotecontroller
                  //                       .zipCodeController.text,
                  //                   buildingNo: requestQuotecontroller
                  //                       .buildingNoController.text,
                  //                   unitNo: requestQuotecontroller
                  //                       .unitNoController.text,
                  //                 );
                  //           }
                  //         },
                  //         width: 200.w,
                  //         height: 48.h,
                  //         color: const Color(0xff27BCEB),
                  //         text: 'Send Quotation',
                  //       ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
