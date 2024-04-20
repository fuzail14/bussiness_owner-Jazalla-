import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../Constants/Font/fonts.dart';
import '../../../../../Constants/constants.dart';
import '../../../../../Widgets/My Button/my_button.dart';
import '../Notifier/send_rfp_response_notifier.dart';

class SendRFPResponse extends ConsumerWidget {
  const SendRFPResponse({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sendRFPResponseProvider);
    final controller = ref.watch(sendRFPResponseProvider.notifier);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: MyAppBar(
        showBell: false,
        showFilter: false,
        title: "Send RFP Response",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 26, right: 26, bottom: 53).r,
          child: Form(
            //  key: inquirycontroller.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Client', style: FontManagment().poppins16),
                15.ph,
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 23, vertical: 14)
                          .r,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(7).r,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(
                          2.0,
                          2.0,
                        ),
                        blurRadius: 12.0,
                        spreadRadius: 2.5,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          'Khobar Company',
                          style: FontManagment().poppins16,
                        ),
                      ),
                      SvgPicture.asset('assets/images/forward_arrow.svg')
                    ],
                  ),
                ),
                20.ph,
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 12)
                          .r,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(7).r,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
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
                      Text(
                        'RFP Title',
                        style: FontManagment().montserrat14,
                      ),
                      Text(
                        'Swimming pool Construction',
                        maxLines: 2,
                        style: FontManagment().quicksand4,
                      ),
                      const Divider(),
                      13.ph,
                      Text(
                        'Service Start Date',
                        maxLines: 2,
                        style: FontManagment().montserrat14,
                      ),
                      Text(
                        '04 April 2022',
                        maxLines: 2,
                        style: FontManagment().quicksand4,
                      ),
                      const Divider(),
                      13.ph,
                      Text(
                        'Proposed Duration',
                        style: FontManagment().montserrat14,
                      ),
                      Text(
                        '50',
                        maxLines: 2,
                        style: FontManagment().quicksand4,
                      ),
                      const Divider(),
                      13.ph,
                      Text(
                        'Proposed Duration Unit',
                        style: FontManagment().montserrat14,
                      ),
                      Text(
                        'Hour/s',
                        maxLines: 2,
                        style: FontManagment().quicksand4,
                      ),
                    ],
                  ),
                ),
                20.ph,
                Text('Pricing', style: FontManagment().poppins16),
                11.ph,
                Container(
                  // height: 429.h,
                  padding: const EdgeInsets.only(
                          top: 12.5, left: 16, right: 16, bottom: 23)
                      .r,

                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(7).r,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
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
                      Text(
                        'Response Services Start Date*',
                        style: FontManagment().quicksand4,
                      ),
                      5.ph,
                      Container(
                        // height: 32.h,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(6).r,
                          border: Border.all(
                            color: const Color(0xffE4E4E4).withOpacity(0.5),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              offset: const Offset(
                                1.0,
                                1.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        child: TextField(
                          //readOnly: true, // Remove this line
                          controller: controller.dateController,
                          cursorHeight: 16,
                          onTap: () {
                            controller.StartDate(context);
                          },
                          decoration: InputDecoration(
                            hintText: 'value',
                            fillColor: whiteColor,
                            hintStyle: FontManagment().montserrat14,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffE4E4E4),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffE4E4E4),
                              ),
                            ),
                            suffixIcon: Icon(
                              Icons.calendar_month,
                              color: const Color(0xffBEBEC2),
                              size: 20.h,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0,
                            ),
                          ),
                        ),
                      ),
                      15.ph,
                      Text(
                        'Response Duration Time*',
                        style: FontManagment().quicksand4,
                      ),
                      5.ph,
                      Container(
                        // height: 32.h,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(6).r,
                          border: Border.all(
                            color: const Color(0xffE4E4E4).withOpacity(0.5),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              offset: const Offset(
                                1.0,
                                1.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        child: TextField(
                          //readOnly: true, // Remove this line
                          controller: controller.timeController,
                          onTap: () {
                            controller.DurationTime(context);
                          },
                          cursorHeight: 16,

                          decoration: InputDecoration(
                            hintText: '20',
                            fillColor: whiteColor,
                            hintStyle: FontManagment().montserrat14,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffE4E4E4),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffE4E4E4),
                              ),
                            ),
                            suffixIcon: Icon(
                              Icons.timer,
                              color: const Color(0xffBEBEC2),
                              size: 20.h,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0,
                            ),
                          ),
                        ),
                      ),
                      15.ph,
                      Text(
                        'Response Duration Time Unit*',
                        style: FontManagment().quicksand4,
                      ),
                      5.ph,
                      Container(
                          // height: 42.h,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(6).r,
                            border: Border.all(
                              color: const Color(0xffE4E4E4),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                offset: const Offset(
                                  1.0,
                                  1.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField<String>(
                              isExpanded: true,
                              value: state.responseDurationTimeUnit,
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
                              items: controller.responseDurationTimeUnitLists
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
                                controller
                                    .updateresponseDurationTimeUnit(newValue!);
                              },
                            ),
                          )),
                      15.ph,
                      Text(
                        'Total Price Amount',
                        style: FontManagment().quicksand4,
                      ),
                      5.ph,
                      Container(
                        // height: 32.h,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(6).r,
                          border: Border.all(
                            color: const Color(0xffE4E4E4).withOpacity(0.5),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              offset: const Offset(
                                1.0,
                                1.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        child: TextField(
                          //readOnly: true, // Remove this line
                          controller: controller.totalPriceAmountController,
                          cursorHeight: 16,
                          keyboardType: TextInputType.number,

                          decoration: InputDecoration(
                            hintText: '0.00',
                            fillColor: whiteColor,
                            hintStyle: FontManagment().montserrat14,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffE4E4E4),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffE4E4E4),
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0,
                            ),
                          ),
                        ),
                      ),
                      15.ph,
                      Text(
                        'Currrency',
                        style: FontManagment().quicksand4,
                      ),
                      5.ph,
                      Container(
                        // height: 32.h,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(6).r,
                          border: Border.all(
                            color: const Color(0xffE4E4E4).withOpacity(0.5),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              offset: const Offset(
                                1.0,
                                1.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        child: TextField(
                          //readOnly: true, // Remove this line
                          // controller: controller.quantityController,
                          cursorHeight: 16,

                          decoration: InputDecoration(
                            hintText: 'SAR',
                            fillColor: whiteColor,
                            hintStyle: FontManagment().montserrat14,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffE4E4E4),
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffE4E4E4),
                              ),
                            ),
                            suffixIcon: Icon(
                              Icons.currency_exchange_rounded,
                              color: const Color(0xffBEBEC2),
                              size: 20.h,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0,
                            ),
                          ),
                        ),
                      ),
                      15.ph,
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (val) {},
                            side: const BorderSide(color: Color(0xffCDC2C2)),
                          ),
                          Text(
                            'Price Are Negotiable',
                            style: FontManagment().interColor10,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (val) {},
                            side: const BorderSide(color: Color(0xffCDC2C2)),
                          ),
                          SizedBox(
                            width: 200.w,
                            child: Text(
                              'Price Are Inclusive of Value Added Tax (VAT)',
                              style: FontManagment().interColor10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                20.ph,
                Text('Response Details', style: FontManagment().poppins16),
                15.ph,
                Container(
                  // height: 100.h,
                  padding: const EdgeInsets.only(
                          top: 12.5, left: 16, right: 16, bottom: 23)
                      .r,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(7).r,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(
                          2.0,
                          2.0,
                        ),
                        blurRadius: 12.0,
                        spreadRadius: 2.5,
                      ),
                    ],
                  ),
                  child: const TextField(
                    maxLines: 2,
                    decoration: InputDecoration(
                        hintText: 'Enter Response Details',
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
                16.ph,
                Text('Attachment', style: FontManagment().poppins16),
                15.ph,
                InkWell(
                  onTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['pdf'],
                    );

                    if (result != null) {
                      File file = File(result.files.single.path!);
                      ref
                          .read(sendRFPResponseProvider.notifier)
                          .setPdfFile(file);
                    }
                  },
                  child: SizedBox(
                    height: 114.h,
                    width: double.infinity,
                    child: DottedBorder(
                      color: const Color(0xff1849D6),
                      dashPattern: const [8, 4],
                      radius: const Radius.circular(8).r,
                      stackFit: StackFit.expand,
                      strokeWidth: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/upload_icon.svg',
                            height: 24.h,
                            width: 24.h,
                            fit: BoxFit.fitHeight,
                          ),
                          5.ph,
                          Text(
                              state.pdfFile?.path.split('/').last ??
                                  'Your file(s) to start uploading',
                              style: FontManagment().inter10),
                          5.ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 50.w,
                                child: const Divider(
                                  color: Color(0xffE7E7E7),
                                  thickness: 2,
                                ),
                              ),
                              20.pw,
                              Text(
                                'OR',
                                style: FontManagment().interColor10,
                              ),
                              20.pw,
                              SizedBox(
                                  width: 50.w,
                                  child: const Divider(
                                    color: Color(0xffE7E7E7),
                                    thickness: 2,
                                  ))
                            ],
                          ),
                          8.ph,
                          InkWell(
                            onTap: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['pdf'],
                              );

                              if (result != null) {
                                File file = File(result.files.single.path!);
                                ref
                                    .read(sendRFPResponseProvider.notifier)
                                    .setPdfFile(file);
                              }
                            },
                            child: Container(
                              width: 62.w,
                              height: 22.h,
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(5).r,
                                  border: Border.all(
                                    color: const Color(0xff1849D6),
                                  )),
                              child: Center(
                                child: Text(
                                  'Browse File',
                                  style: GoogleFonts.inter(
                                      fontSize: 8.sp,
                                      color: const Color(0xff1849D6),
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                45.ph,
                Center(
                  child: MyButton(
                    //width: 160.w,

                    height: 28.h,
                    name: 'Send Response',

                    style: FontManagment().quicksand12,
                    color: const Color(0xff27BCEB),
                    //textColor: HexColor('#8518FF'),

                    onPressed: () {
                      //  GoRouter.of(context).pushNamed(sendRFQResponse);
                      // if (controller.key.currentState!.validate()) {
                      //   state.phoneNumber =
                      //       "+${state.countryCode}${controller.phoneNumberController.text}";
                      //   if (!state.isLoading) {
                      //     controller.verifyUserPhoneNumber(context);
                      //   }
                      // }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// class SendRFQResponse extends ConsumerStatefulWidget {
//   @override
//   _SendRFQResponseState createState() => _SendRFQResponseState();
// }

// class _SendRFQResponseState extends ConsumerState<SendRFQResponse> {
 
//   @override
//   Widget build(BuildContext context) {
    
//     final sendRFQResponseState = ref.watch(sendRFQResponseProvider);
//     final sendRFQResponseController = ref.watch(sendRFQResponseProvider.notifier);

//     return Scaffold(
//       appBar: MyAppBar(
//         title: 'Request For Quote',
//         showBell: false,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding:
//               const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 40).r,
//           child: Form(
//             //key: requestQuotecontroller.key,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // if (requestQuoteState.responseStatus == Status.loading)
//                 //   const Loader()
//                 // else if (requestQuoteState.responseStatus ==
//                 //     Status.completed) ...[
//                   Text(
//                     'Request Details*',
//                     style: GoogleFonts.montserrat(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xff4D4D4D)),
//                   ),
//                   5.ph,
//                   Container(
//                     height: 117.h,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(color: Color(0xff19A3A3)),
//                     ),
//                     child: TextFormField(
//                       maxLines: 5,
//                       controller: requestQuotecontroller.descriptionController,
//                       validator: emptyStringValidator,
//                       decoration: const InputDecoration(
//                         hintText: 'Enter your description here',
//                         border: OutlineInputBorder(borderSide: BorderSide.none),
//                       ),
//                     ),
//                   ),
//                   16.ph,
//                   Row(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Quantity Needed *",
//                               style: GoogleFonts.montserrat(
//                                 color: Color(0xff4D4D4D),
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w400,
//                               )),
//                           7.ph,
//                           Container(
//                             width: 140.w,
//                             height: 43.h,
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 4.0),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(6.0),
//                               border:
//                                   Border.all(color: const Color(0xFF19A3A3)),
//                             ),
//                             child: TextFormField(
//                               controller: quantityController,
//                               focusNode: quantityFocusNode,
//                               keyboardType: TextInputType.number,
//                               decoration: const InputDecoration(
//                                 border: OutlineInputBorder(
//                                     borderSide: BorderSide.none),
//                               ),
//                               // onChanged: (value) {
//                               //   onQuantityChanged(value);
//                               // },
//                             ),
//                           )
//                         ],
//                       ),
//                       20.pw,
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Item Unit*",
//                               style: GoogleFonts.montserrat(
//                                 color: Color(0xff4D4D4D),
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w400,
//                               )),
//                           7.ph,
//                           Container(
//                             width: 140.w,
//                             height: 43.h,
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 8.0, horizontal: 8.0),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(8),
//                               border: Border.all(color: Color(0xff19A3A3)),
//                             ),
//                             child: Center(
//                               child: AutoSizeText(
//                                 requestQuoteState.productDetail!.unit
//                                     .toString(),
//                                 style: GoogleFonts.montserrat(
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   20.ph,
//                   Row(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Delivery Date*",
//                               style: GoogleFonts.montserrat(
//                                 color: Color(0xff4D4D4D),
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w400,
//                               )),
//                           7.ph,
//                           MyTextFormField(
//                             fillColor: Colors.transparent,
//                             borderSideColor: borderColor,
//                             width: 150.w,
//                             // height: 83.h,
//                             onTap: () {
//                               requestQuotecontroller.StartDate(context);
//                             },
//                             suffixIcon: const Icon(Icons.calendar_month,
//                                 size: 20, color: Color(0xFF19A3A3)),
//                             controller: requestQuotecontroller.dateController,
//                             validator: emptyStringValidator,
//                             hintText: 'Delivery Date',
//                             labelText: 'Date',
//                           ),
//                         ],
//                       ),
//                       20.pw,
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Select Payment Mode*",
//                               style: GoogleFonts.montserrat(
//                                 color: const Color(0xff4D4D4D),
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w400,
//                               )),
//                           7.ph,
//                           if (requestQuoteState.productDetail!.paymentMode ==
//                               null) ...[
//                             Container(
//                               width: 140.w,
//                               // height: 43.h,
//                               padding:
//                                   const EdgeInsets.only(left: 4.0, right: 4.0)
//                                       .r,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(6.0).r,
//                                 border: Border.all(color: borderColor),
//                               ),
//                               child: DropdownButtonHideUnderline(
//                                 child: DropdownButtonFormField<String>(
//                                   isExpanded: true,
//                                   value: requestQuoteState.paymentValue,
//                                   style: GoogleFonts.montserrat(
//                                     fontSize: 25.sp,
//                                     fontWeight: FontWeight.w800,
//                                   ),
//                                   icon: const Icon(Icons.arrow_drop_down,
//                                       color: Color(0xFF19A3A3)),
//                                   decoration: const InputDecoration(
//                                     contentPadding:
//                                         EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                     border: InputBorder.none,
//                                   ),
//                                   items: requestQuotecontroller.paymentMode
//                                       .map<DropdownMenuItem<String>>(
//                                           (String value) {
//                                     return DropdownMenuItem<String>(
//                                       value: value,
//                                       child: AutoSizeText(value,
//                                           maxLines: 2,
//                                           overflow: TextOverflow.ellipsis,
//                                           style: GoogleFonts.montserrat(
//                                               fontSize: 12.sp,
//                                               fontWeight: FontWeight.w400,
//                                               color: Color(0xFF657474))),
//                                     );
//                                   }).toList(),
//                                   onChanged: (String? newValue) {
//                                     requestQuotecontroller
//                                         .updatePaymentModeValue(newValue!);
//                                   },
//                                 ),
//                               ),
//                             )
//                           ] else
//                             Container(
//                               width: 140.w,
//                               height: 43.h,
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 8.0, horizontal: 8.0),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 border: Border.all(color: borderColor),
//                               ),
//                               child: Center(
//                                 child: AutoSizeText(
//                                   requestQuoteState.productDetail!.paymentMode
//                                       .toString(),
//                                   style: GoogleFonts.montserrat(
//                                       fontSize: 12.sp,
//                                       fontWeight: FontWeight.w400),
//                                 ),
//                               ),
//                             ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   20.ph,
//                   Row(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Shipping Mode*",
//                               style: GoogleFonts.montserrat(
//                                 color: Color(0xff4D4D4D),
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w400,
//                               )),
//                           7.ph,
//                           Container(
//                             width: 140.w,
//                             // height: 43.h,
//                             padding:
//                                 const EdgeInsets.only(left: 4.0, right: 4.0).r,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(6.0).r,
//                               border: Border.all(color: borderColor),
//                             ),
//                             child: DropdownButtonHideUnderline(
//                               child: DropdownButtonFormField<String>(
//                                 isExpanded: true,
//                                 value: requestQuoteState.shippingModeValue,
//                                 style: GoogleFonts.montserrat(
//                                   fontSize: 25.sp,
//                                   fontWeight: FontWeight.w800,
//                                 ),
//                                 icon: const Icon(Icons.arrow_drop_down,
//                                     color: Color(0xFF19A3A3)),
//                                 decoration: const InputDecoration(
//                                   contentPadding:
//                                       EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                   border: InputBorder.none,
//                                 ),
//                                 items: requestQuotecontroller.shippingMode
//                                     .map<DropdownMenuItem<String>>(
//                                         (String value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value,
//                                     child: AutoSizeText(value,
//                                         maxLines: 2,
//                                         overflow: TextOverflow.ellipsis,
//                                         style: GoogleFonts.montserrat(
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.w400,
//                                             color: Color(0xFF657474))),
//                                   );
//                                 }).toList(),
//                                 onChanged: (String? newValue) {
//                                   requestQuotecontroller
//                                       .updateShippingModeValue(newValue!);
//                                 },
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                       20.pw,
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Select Template*',
//                               style: GoogleFonts.montserrat(
//                                 color: Color(0xff4D4D4D),
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w400,
//                               )),
//                           7.ph,
//                           Container(
//                             width: 140.w,
//                             padding:
//                                 const EdgeInsets.only(left: 4.0, right: 4.0).r,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(6.0).r,
//                               border: Border.all(color: borderColor),
//                             ),
//                             child: DropdownButtonHideUnderline(
//                               child: DropdownButtonFormField<int>(
//                                 isExpanded: true,
//                                 value: requestQuoteState.selectedTemplateId,
//                                 style: GoogleFonts.montserrat(
//                                   fontSize: 25.sp,
//                                   fontWeight: FontWeight.w800,
//                                 ),
//                                 icon: const Icon(Icons.arrow_drop_down,
//                                     color: Color(0xFF19A3A3)),
//                                 decoration: const InputDecoration(
//                                   contentPadding:
//                                       EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                   border: InputBorder.none,
//                                 ),
//                                 items: requestQuoteState.quotationTemplate
//                                     .map<DropdownMenuItem<int>>(
//                                         (QuotationTemplate template) {
//                                   return DropdownMenuItem<int>(
//                                     value: template.id,
//                                     child: AutoSizeText(
//                                       template.title.toString(),
//                                       maxLines: 2,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: GoogleFonts.montserrat(
//                                           fontSize: 12.sp,
//                                           fontWeight: FontWeight.w400,
//                                           color: Color(0xFF657474)),
//                                     ),
//                                   );
//                                 }).toList(),
//                                 onChanged: (int? newValue) {
//                                   print(newValue);
//                                   requestQuotecontroller
//                                       .updateTemplateValue(newValue!);
//                                 },
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                   20.ph,

//                   if (requestQuoteState.shippingModeValue ==
//                       'DAP (Delivered at Place)') ...[
//                     Row(
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Shipping Address*",
//                                 style: GoogleFonts.montserrat(
//                                   color: Color(0xff4D4D4D),
//                                   fontSize: 12.sp,
//                                   fontWeight: FontWeight.w400,
//                                 )),
//                             7.ph,
//                             Container(
//                               width: 300.w,
//                               // height: 43.h,
//                               padding:
//                                   const EdgeInsets.only(left: 4.0, right: 4.0)
//                                       .r,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(6.0).r,
//                                 border: Border.all(color: borderColor),
//                               ),
//                               child: DropdownButtonHideUnderline(
//                                 child: DropdownButtonFormField<String>(
//                                   isExpanded: true,
//                                   value: requestQuoteState.shippingAddressValue,
//                                   style: GoogleFonts.montserrat(
//                                     fontSize: 25.sp,
//                                     fontWeight: FontWeight.w800,
//                                   ),
//                                   icon: const Icon(Icons.arrow_drop_down,
//                                       color: Color(0xFF19A3A3)),
//                                   decoration: const InputDecoration(
//                                     contentPadding:
//                                         EdgeInsets.fromLTRB(0, 0, 0, 0),
//                                     border: InputBorder.none,
//                                   ),
//                                   items: requestQuotecontroller.shippingAddress
//                                       .map<DropdownMenuItem<String>>(
//                                           (String value) {
//                                     return DropdownMenuItem<String>(
//                                       value: value,
//                                       child: AutoSizeText(value,
//                                           maxLines: 2,
//                                           overflow: TextOverflow.ellipsis,
//                                           style: GoogleFonts.montserrat(
//                                               fontSize: 12.sp,
//                                               fontWeight: FontWeight.w400,
//                                               color: Color(0xFF657474))),
//                                     );
//                                   }).toList(),
//                                   onChanged: (String? newValue) {
//                                     requestQuotecontroller
//                                         .updateShippingAddressValue(newValue!);
//                                   },
//                                 ),
//                               ),
//                             ),
//                             20.ph,
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],

//                   if (requestQuoteState.shippingModeValue ==
//                           'DAP (Delivered at Place)' &&
//                       requestQuoteState.shippingAddressValue ==
//                           'Alternate Address') ...[
//                     Padding(
//                       padding: const EdgeInsets.only(right: 40),
//                       child: CSCPicker(
//                         defaultCountry: CscCountry.Saudi_Arabia,
//                         showStates: true,
//                         showCities: true,
//                         flagState: CountryFlag.ENABLE,
//                         dropdownDecoration: BoxDecoration(
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(10)),
//                             color: Colors.white,
//                             border: Border.all(color: borderColor, width: 1)),
//                         disabledDropdownDecoration: BoxDecoration(
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(10)),
//                             // color: Colors.grey.shade300,
//                             border: Border.all(color: borderColor, width: 1)),
//                         stateSearchPlaceholder: "State",
//                         citySearchPlaceholder: "City",
//                         stateDropdownLabel: "*State",
//                         cityDropdownLabel: "*City",
//                         selectedItemStyle: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 14,
//                         ),
//                         dropdownHeadingStyle: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 17,
//                             fontWeight: FontWeight.bold),
//                         dropdownItemStyle: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 14,
//                         ),
//                         dropdownDialogRadius: 10.0,
//                         searchBarRadius: 10.0,
//                         onCountryChanged: (val) {
//                           requestQuotecontroller.countryName = val.toString();
//                         },
//                         onStateChanged: (val) {
//                           requestQuotecontroller.stateName = val.toString();
//                         },
//                         onCityChanged: (val) {
//                           requestQuotecontroller.cityName = val.toString();
//                         },
//                       ),
//                     ),
//                     20.ph,
//                     Row(
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("District",
//                                 style: GoogleFonts.montserrat(
//                                   color: Color(0xff4D4D4D),
//                                   fontSize: 12.sp,
//                                   fontWeight: FontWeight.w400,
//                                 )),
//                             7.ph,
//                             Container(
//                               width: 140.w,
//                               height: 43.h,
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 4.0),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(6.0),
//                                 border:
//                                     Border.all(color: const Color(0xFF19A3A3)),
//                               ),
//                               child: TextFormField(
//                                 controller:
//                                     requestQuotecontroller.districtController,

//                                 decoration: const InputDecoration(
//                                   border: OutlineInputBorder(
//                                       borderSide: BorderSide.none),
//                                 ),
//                                 // onChanged: (value) {
//                                 //   onQuantityChanged(value);
//                                 // },
//                               ),
//                             )
//                           ],
//                         ),
//                         20.pw,
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Street",
//                                 style: GoogleFonts.montserrat(
//                                   color: Color(0xff4D4D4D),
//                                   fontSize: 12.sp,
//                                   fontWeight: FontWeight.w400,
//                                 )),
//                             7.ph,
//                             Container(
//                               width: 140.w,
//                               height: 43.h,
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 8.0, horizontal: 8.0),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 border: Border.all(color: Color(0xff19A3A3)),
//                               ),
//                               child: TextFormField(
//                                 controller:
//                                     requestQuotecontroller.streetController,
//                                 style: GoogleFonts.montserrat(
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w400),
//                                 decoration: const InputDecoration(
//                                   border: OutlineInputBorder(
//                                       borderSide: BorderSide.none),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     20.ph,
//                     Row(
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Zip Code",
//                                 style: GoogleFonts.montserrat(
//                                   color: Color(0xff4D4D4D),
//                                   fontSize: 12.sp,
//                                   fontWeight: FontWeight.w400,
//                                 )),
//                             7.ph,
//                             Container(
//                               width: 140.w,
//                               height: 43.h,
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 4.0),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(6.0),
//                                 border:
//                                     Border.all(color: const Color(0xFF19A3A3)),
//                               ),
//                               child: TextFormField(
//                                 controller:
//                                     requestQuotecontroller.zipCodeController,

//                                 keyboardType: TextInputType.number,
//                                 decoration: const InputDecoration(
//                                   border: OutlineInputBorder(
//                                       borderSide: BorderSide.none),
//                                 ),
//                                 // onChanged: (value) {
//                                 //   onQuantityChanged(value);
//                                 // },
//                               ),
//                             )
//                           ],
//                         ),
//                         20.pw,
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Building No",
//                                 style: GoogleFonts.montserrat(
//                                   color: Color(0xff4D4D4D),
//                                   fontSize: 12.sp,
//                                   fontWeight: FontWeight.w400,
//                                 )),
//                             7.ph,
//                             Container(
//                               width: 140.w,
//                               height: 43.h,
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 8.0, horizontal: 8.0),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 border: Border.all(color: Color(0xff19A3A3)),
//                               ),
//                               child: TextFormField(
//                                 controller:
//                                     requestQuotecontroller.buildingNoController,
//                                 style: GoogleFonts.montserrat(
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w400),
//                                 decoration: const InputDecoration(
//                                   border: OutlineInputBorder(
//                                       borderSide: BorderSide.none),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     20.ph,
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Unit No",
//                             style: GoogleFonts.montserrat(
//                               color: Color(0xff4D4D4D),
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w400,
//                             )),
//                         7.ph,
//                         Container(
//                           //width: 140.w,
//                           height: 43.h,
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 8.0, horizontal: 8.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(color: Color(0xff19A3A3)),
//                           ),
//                           child: TextFormField(
//                             controller: requestQuotecontroller.unitNoController,
//                             style: GoogleFonts.montserrat(
//                                 fontSize: 12.sp, fontWeight: FontWeight.w400),
//                             decoration: const InputDecoration(
//                               border: OutlineInputBorder(
//                                   borderSide: BorderSide.none),
//                             ),
//                           ),
//                         ),
//                         20.ph,
//                       ],
//                     ),
//                   ],

//                   //Pdf File
//                   Row(
//                     children: [
//                       Container(
//                         width: 300.w,
//                         height: 43.h,
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Color(0xff19A3A3))),
//                         child: Row(
//                           children: [
//                             GestureDetector(
//                               onTap: () async {
//                                 FilePickerResult? result =
//                                     await FilePicker.platform.pickFiles(
//                                   type: FileType.custom,
//                                   allowedExtensions: ['pdf'],
//                                 );

//                                 if (result != null) {
//                                   File file = File(result.files.single.path!);
//                                   ref
//                                       .read(requestQuoteProvider.notifier)
//                                       .setPdfFile(file);
//                                 }
//                               },
//                               child: Container(
//                                 width: 76.w,
//                                 height: 43.h,
//                                 decoration: BoxDecoration(
//                                     color: Color(0xffF7F7F9),
//                                     border: Border.all(
//                                         color: const Color(0xff19A3A3))),
//                                 child: Center(
//                                   child: Text(
//                                     'Choose File',
//                                     style: GoogleFonts.montserrat(
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 10.sp,
//                                         color: Color(0xff657474)),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             20.pw,
//                             if (requestQuoteState.pdfFile != null) ...[
//                               Container(
//                                 child: Text(
//                                   requestQuoteState.pdfFile?.path
//                                           .split('/')
//                                           .last ??
//                                       'No file selected',
//                                   style: GoogleFonts.montserrat(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 12.sp,
//                                       color: Color(0xff657474)),
//                                 ),
//                               ),
//                             ],
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                   20.ph,
//                   requestQuoteState.isLoading
//                       ? Loader()
//                       : CustomButton(
//                           onTap: () {
//                             String rawCountryName =
//                                 requestQuotecontroller.countryName;

//                             RegExp regExp = RegExp(r'[A-Za-z ]+$');
//                             Match? match = regExp.firstMatch(rawCountryName);

//                             String countryName = "";
//                             if (match != null) {
//                               countryName = match.group(0)!.trim();
//                             }

//                             print(countryName);

//                             if (requestQuotecontroller.key.currentState!
//                                 .validate()) {
//                               ref
//                                   .read(requestQuoteProvider.notifier)
//                                   .sendQuotation(
//                                     productId: requestQuotecontroller.productId,
//                                     userId: requestQuotecontroller.userId,
//                                     userCompanyId:
//                                         requestQuotecontroller.userCompanyId,
//                                     companyId: requestQuoteState
//                                         .productDetail!.companyId,
//                                     title:
//                                         requestQuoteState.productDetail!.name,
//                                     description: requestQuotecontroller
//                                         .descriptionController.text,
//                                     quantity: quantityController.text,
//                                     unit: requestQuoteState.productDetail!.unit,
//                                     paymentMode: requestQuoteState.paymentValue,
//                                     shippingMode:
//                                         requestQuoteState.shippingModeValue,
//                                     templateId:
//                                         requestQuoteState.selectedTemplateId,
//                                     shippingAddress:
//                                         requestQuoteState.shippingAddressValue,
//                                     deliveryDate: requestQuotecontroller
//                                         .dateController.text,
//                                     pdfFile: requestQuoteState.pdfFile,
//                                     context: context,
//                                     countryName: countryName,
//                                     stateName: requestQuotecontroller.stateName,
//                                     cityName: requestQuotecontroller.cityName,
//                                     district: requestQuotecontroller
//                                         .districtController.text,
//                                     streetName: requestQuotecontroller
//                                         .streetController.text,
//                                     zipCode: requestQuotecontroller
//                                         .zipCodeController.text,
//                                     buildingNo: requestQuotecontroller
//                                         .buildingNoController.text,
//                                     unitNo: requestQuotecontroller
//                                         .unitNoController.text,
//                                   );
//                             }
//                           },
//                           width: 200.w,
//                           height: 48.h,
//                           color: Color(0xff27BCEB),
//                           text: 'Send Quotation',
//                         ),
//                 ]
//            //   ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
