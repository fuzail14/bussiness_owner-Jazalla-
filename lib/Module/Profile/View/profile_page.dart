import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/Font/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../Constants/constants.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Widgets/Loader/loader.dart';
import '../Notifier/profile_notifier.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profilePageProvider);
    final controller = ref.watch(profilePageProvider.notifier);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (state.responseStatus == Status.loading)
              const Loader()
            else if (state.responseStatus == Status.completed) ...[
              Stack(
                children: [
                  Container(
                      height: 396,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ).r,
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(34, 67, 154, 1),
                              Color.fromRGBO(74, 176, 206, 1),
                            ]),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 20).r,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        'assets/images/arrow_back.svg',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 58).r,
                    child: Align(
                        alignment: Alignment.center,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 139.h,
                              width: 139.w,
                              child: const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/user_avatar.png'),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 110, left: 100).r,
                              child: Image.asset(
                                'assets/images/edit_button.png',
                                width: 31.w,
                                height: 31.h,
                              ),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 214.5, left: 50, right: 50)
                            .r,
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Dammam User',
                          maxLines: 1,
                          style: GoogleFonts.montserrat(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: whiteColor),
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                            top: 16, left: 21, right: 22, bottom: 30)
                        .r,
                    margin: const EdgeInsets.only(
                            left: 22, right: 22, top: 266, bottom: 55)
                        .r,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(20).r,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          offset: const Offset(
                            2.0,
                            2.0,
                          ),
                          blurRadius: 22.0,
                          spreadRadius: 4.5,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        headingText('Personal Info'),
                        20.ph,
                        subHeadingText(
                          text: 'First Name',
                        ),
                        12.ph,
                        customTextField(
                          'Fuzail',
                        ),
                        20.ph,
                        subHeadingText(
                          text: 'Last Name',
                        ),
                        12.ph,
                        customTextField(
                          'Raza',
                        ),
                        20.ph,
                        subHeadingText(
                          text: 'Email',
                        ),
                        12.ph,
                        customTextField(
                          'email@gmail.com',
                        ),
                        20.ph,
                        subHeadingText(
                          text: 'Phone Number',
                        ),
                        12.ph,
                        customTextField(
                          '0534473508',
                        ),
                        20.ph,
                        headingText('Change Password'),
                        20.ph,
                        subHeadingText(
                          text: 'Old Password',
                        ),
                        12.ph,
                        customPasswordTextField(
                            'Enter Old Password', ref, controller.oldPassword),
                        20.ph,
                        subHeadingText(
                          text: 'New Password',
                        ),
                        12.ph,
                        customPasswordTextField(
                            'Enter New Password', ref, controller.newPassword),
                        20.ph,
                        subHeadingText(
                          text: 'Confirm Password',
                        ),
                        12.ph,
                        customPasswordTextField('Enter Confirm Password', ref,
                            controller.confirmPassword),
                        20.ph,
                        Container(
                          height: 58.h,
                          width: 327.w,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xff1F3996), Color(0xff45A1C4)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Center(
                                  child: headingText(
                                'Change Password',
                              )),
                            ),
                          ),
                        ),
                        20.ph,
                        headingText('Company Info'),
                        20.ph,
                        companyInfo(
                          heading: 'Employee ID',
                          subHeading: 'General Worker',
                        ),
                        10.ph,
                        companyInfo(
                          heading: 'Designation',
                          subHeading: 'General Worker',
                        ),
                        10.ph,
                        companyInfo(
                          heading: 'Phone',
                          subHeading: '96852365870',
                        ),
                        10.ph,
                        companyInfo(
                          heading: 'Date Of Joining',
                          subHeading: '05-05-2023',
                        ),
                        10.ph,
                        companyInfo(
                          heading: 'Salary Type',
                          subHeading: 'Monthly Payslip',
                        ),
                        10.ph,
                        companyInfo(
                          heading: 'Basic Salary',
                          subHeading: '1500 SR',
                        ),
                        10.ph,
                        companyInfo(
                          heading: 'Date Of Birth',
                          subHeading: '05-05-1987',
                        ),
                        10.ph,
                        companyInfo(
                          heading: 'Address',
                          subHeading: 'Olaya, Al Khobar 34448',
                        ),
                        20.ph,
                        headingText('Bank Info'),
                        20.ph,
                        bankInfo(
                          heading: 'Account Holder Name',
                          subHeading: 'Abdur Rahim',
                        ),
                        15.ph,
                        bankInfo(
                          heading: 'Account Number',
                          subHeading: '9876543211',
                        ),
                        15.ph,
                        bankInfo(
                          heading: 'Bank Name',
                          subHeading: 'SAAB',
                        ),
                        15.ph,
                        bankInfo(
                          heading: 'Bank Identifier Code',
                          subHeading: '05052023',
                        ),
                        15.ph,
                        bankInfo(
                          heading: 'Branch Location',
                          subHeading: 'Olaya, Al Khobar',
                        ),
                        15.ph,
                        bankInfo(
                          heading: 'Tax Payer Id',
                          subHeading: '95682',
                        ),
                      ],
                    ),
                  )
                ],
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
      ),

      // ),
    );
  }
}

Widget bankInfo({
  required String heading,
  required String subHeading,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          subHeadingText(text: heading),
          SizedBox(
            width: 100.w,
            child: subHeadingText(
              text: subHeading,
              textColor: 0xffABABAB,
            ),
          ),
        ],
      ),
      15.ph,
      const Divider(
        color: Color(0xffF1ECEC),
      )
    ],
  );
}

Widget companyInfo({
  required String heading,
  required String subHeading,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      subHeadingText(text: heading),
      6.ph,
      subHeadingText(text: subHeading, textColor: 0xffABABAB),
      10.ph,
      const Divider(
        color: Color(0xffF1ECEC),
      ),
    ],
  );
}

Widget headingText(String text) {
  return Text(text,
      style: GoogleFonts.montserrat(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xff262422)));
}

// Widget subHeadingText(String text, textColor) {
//   return Text(text,
//       style: GoogleFonts.montserrat(
//           fontSize: 14.sp,
//           fontWeight: FontWeight.w600,
//           color: Color(textColor ?? 0xff262422)));
// }

class subHeadingText extends StatelessWidget {
  subHeadingText({required this.text, this.textColor});
  String text;
  var textColor;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textDirection: TextDirection.rtl,
        style: GoogleFonts.montserrat(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Color(textColor ?? 0xff262422)));
  }
}

Widget customTextField(String hintText) {
  return TextField(
    readOnly: true,
    decoration: InputDecoration(
      hintText: hintText,
      fillColor: whiteColor,
      hintStyle: FontManagment().montserrat14,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xffF1ECEC),
        ),
        borderRadius: BorderRadius.circular(12).r,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xffE4E4E4),
        ),
        borderRadius: BorderRadius.circular(12).r,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 16.0,
      ),
    ),
  );
}

Widget customPasswordTextField(
    String hintText, WidgetRef ref, TextEditingController controller) {
  final state = ref.watch(profilePageProvider);
  final notifier = ref.watch(profilePageProvider.notifier);
  return TextField(
    controller: controller,
    obscureText: state.isHidden ? false : true,
    decoration: InputDecoration(
        hintText: hintText,
        fillColor: whiteColor,
        hintStyle: FontManagment().montserrat14,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xffF1ECEC),
          ),
          borderRadius: BorderRadius.circular(12).r,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xffE4E4E4),
          ),
          borderRadius: BorderRadius.circular(12).r,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 16.0,
        ),
        suffixIcon: InkWell(
          onTap: () {
            notifier.togglePasswordView();
          },
          child: Icon(
            state.isHidden ? Icons.visibility : Icons.visibility_off,
            color: const Color(0xffBEBEC2),
            size: 20.h,
          ),
        )),
  );
}
