import 'dart:io';

import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/Font/fonts.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../Constants/constants.dart';
import '../../../../../Widgets/My Button/my_button.dart';
import '../Notifier/send_rfq_response_notifier.dart';

class SendRFQResponse extends ConsumerWidget {
  const SendRFQResponse({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sendRFQResponseProvider);
    final controller = ref.watch(sendRFQResponseProvider.notifier);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: MyAppBar(
        showBell: false,
        showFilter: false,
        title: "Send RFQ Response",
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
                Text('Item Detail',
                    style: FontManagment().poppins16WithColor()),
                15.ph,
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
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5).r,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Item',
                                  style: FontManagment().montserrat14,
                                ),
                                SizedBox(
                                  width: 200.w,
                                  child: Text(
                                    'Bar Bender',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textDirection: TextDirection.rtl,
                                    style: FontManagment().montserrat14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Color(0xffDBDBDB),
                          )
                        ],
                      ),
                      TextField(
                        //readOnly: true, // Remove this line
                        controller: controller.quantityController,

                        keyboardType: TextInputType.number,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          prefixText: 'Quantity',
                          hintStyle: FontManagment().montserrat14,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffDBDBDB),
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffDBDBDB),
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 5.0,
                          ),
                        ),
                      ),
                      11.9.ph,
                      TextField(
                        //readOnly: true, // Remove this line
                        controller: controller.priceController,
                        keyboardType: TextInputType.number,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          prefixText: 'Price',
                          hintStyle: FontManagment().montserrat14,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffDBDBDB),
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffDBDBDB),
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 5.0,
                          ),
                        ),
                      ),
                      11.9.ph,
                      TextField(
                        //readOnly: true, // Remove this line
                        controller: controller.shippingController,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          prefixText: 'Shipping',
                          hintStyle: FontManagment().montserrat14,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffDBDBDB),
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffDBDBDB),
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 5.0,
                          ),
                        ),
                      ),
                      11.9.ph,
                      TextField(
                        readOnly: true, // Remove this line
                        controller: controller.shippingController,
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          prefixText: 'Tax',
                          hintStyle: FontManagment().montserrat14,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffDBDBDB),
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffDBDBDB),
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 5.0,
                          ),
                        ),
                      ),
                      17.5.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Amount After \nTAX & SHIPPING',
                            style: FontManagment().montserrat14,
                          ),
                          Text(
                            '15000',
                            style: FontManagment().montserrat14,
                          ),
                        ],
                      ),
                      17.5.ph,
                      Container(
                        decoration:
                            const BoxDecoration(color: Color(0xffF9F9F9)),
                        padding: const EdgeInsets.symmetric(
                                vertical: 9, horizontal: 23)
                            .r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 89.w,
                                  child: Text(
                                    'Sub Total',
                                    style: FontManagment().montserrat14,
                                  ),
                                ),
                                SizedBox(
                                  width: 100.w,
                                  child: Text(
                                    '20000',
                                    maxLines: 1,
                                    style: FontManagment().quicksand4,
                                  ),
                                ),
                              ],
                            ),
                            7.ph,
                            Row(
                              children: [
                                SizedBox(
                                  width: 89.w,
                                  child: Text(
                                    'Shipping',
                                    style: FontManagment().montserrat14,
                                  ),
                                ),
                                SizedBox(
                                  width: 100.w,
                                  child: Text(
                                    '15000',
                                    maxLines: 1,
                                    style: FontManagment().quicksand4,
                                  ),
                                ),
                              ],
                            ),
                            7.ph,
                            Row(
                              children: [
                                SizedBox(
                                  width: 89.w,
                                  child: Text(
                                    'Tax',
                                    style: FontManagment().montserrat14,
                                  ),
                                ),
                                SizedBox(
                                  width: 100.w,
                                  child: Text(
                                    '5000',
                                    maxLines: 1,
                                    style: FontManagment().quicksand4,
                                  ),
                                ),
                              ],
                            ),
                            7.ph,
                            Row(
                              children: [
                                SizedBox(
                                  width: 89.w,
                                  child: Text(
                                    'Total Amount',
                                    style: FontManagment().montserrat14,
                                  ),
                                ),
                                SizedBox(
                                  width: 100.w,
                                  child: Text(
                                    '20000',
                                    maxLines: 1,
                                    style: FontManagment().quicksand4,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                20.ph,
                Text('Response Details',
                    style: FontManagment().poppins16WithColor()),
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
                Text('Attachment', style: FontManagment().poppins16WithColor()),
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
                          .read(sendRFQResponseProvider.notifier)
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
                                    .read(sendRFQResponseProvider.notifier)
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
                    color: HexColor('#27BCEB'),
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
