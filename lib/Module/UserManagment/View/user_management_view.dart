import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../Data/Api Resp/api_response.dart';
import '../../../../../Widgets/Loader/loader.dart';
import '../../../Constants/Font/fonts.dart';
import '../../../Widgets/AppBar/my_app_bar.dart';
import '../Notifier/user_management_notifier.dart';
import '../State/user_management_state.dart';

// ignore: must_be_immutable
class UserManagementScreen extends ConsumerWidget {
  int buildcheck = 0;

  UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print(person!.data!.id!);

    final controller = ref.watch(userManagementProvider.notifier);
    final state = ref.watch(userManagementProvider);
    print('build check  ${buildcheck++}');

    return Scaffold(
      appBar: MyAppBar(
        showFilter: false,
        title: "User Management",
      ),
      backgroundColor: whiteColor,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 15).r,
            child: Text(
              'User Management',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: blackColor,
              ),
            ),
          ),
          if (state.responseStatus == Status.loading)
            const Loader()
          else if (state.responseStatus == Status.completed) ...[
            15.ph,
            if (state.companyusers.isEmpty) ...[
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
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisSpacing: 20),
                    shrinkWrap: true,
                    itemCount: state.companyusers.length,
                    itemBuilder: (context, index) {
                      // List of images from assets
                      List<String> imagePaths = [
                        'https://instagram.fdmm2-4.fna.fbcdn.net/v/t51.2885-19/432970937_983159433179121_182582443152848247_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fdmm2-4.fna.fbcdn.net&_nc_cat=109&_nc_ohc=a9Jqty3KqAwAb6mfJcv&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfDlZh5BmlUaUZvqESmVU6B7_uVrtlgt-HiYoN3y-Hg6vg&oe=662E9360&_nc_sid=8b3546',
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Angelina_Jolie_2_June_2014_%28cropped%29.jpg/640px-Angelina_Jolie_2_June_2014_%28cropped%29.jpg',
                        'https://st1.bollywoodlife.com/wp-content/uploads/2023/08/Fawad-Khan-1-1.jpg?impolicy=Medium_Widthonly&w=400&h=711',
                        'https://hips.hearstapps.com/hmg-prod/images/robert-pattinson-438798-1-402.jpg',
                        'https://engineering.unl.edu/images/staff/Kayla-Person.jpg',
                        'https://media.licdn.com/dms/image/C5603AQEtca4iOzf6aw/profile-displayphoto-shrink_400_400/0/1517450692024?e=2147483647&v=beta&t=xXbkQmDXqpuQiFRjdkT_8g6ZtKLKhCupk5ZnVwp9JfE',
                      ];
                      List<String> title = [
                        'Administrator',
                        'HR',
                        'Accounting',
                        'Project Manager',
                        'Buyer',
                        'Supplier'
                      ];

                      // Ensure index wraps around if fewer images than items
                      String imagePath = imagePaths[index % imagePaths.length];
                      String titlePath = title[index % title.length];

                      return GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => CheckInDialog(
                                    title: 'Assign Role',
                                    svgPath:
                                        'assets/images/user_managment_dialog_icon.svg',
                                    state: state,
                                    controller: controller,
                                  ));
                        },
                        child: Container(
                          //  height: 198.h,
                          margin: const EdgeInsets.only(
                                  bottom: 0, left: 15, right: 15, top: 0)
                              .r,
                          padding: EdgeInsets.only(
                                  left: 8, right: 8, bottom: 0, top: 10)
                              .r,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(20).r,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.06),
                                offset: const Offset(
                                  1.0,
                                  3.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 15.0,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 78.16.w,
                                  height: 78.16.h,
                                  child: const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/user_avatar.png'))),
                              10.8.ph,
                              Text(
                                state.companyusers[index].firstName.toString() +
                                    " " +
                                    state.companyusers[index].lastName
                                        .toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  color: const Color(0xff222B45),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                state.companyusers[index].email.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  color: const Color(0xff6B779A),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                state.companyusers[index].type.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  color: const Color(0xff6B779A),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     Icon(
                              //       Icons.star,
                              //       size: 15.h,
                              //       color: Color(0xffD4983E).withOpacity(0.7),
                              //     ),
                              //     SizedBox(
                              //       width: 110.w,
                              //       child: Text(
                              //         '4.3 (130 reviews)',
                              //         maxLines: 1,
                              //         overflow: TextOverflow.ellipsis,
                              //         style: GoogleFonts.poppins(
                              //           fontSize: 12.sp,
                              //           color: const Color(0xff6B779A),
                              //           fontWeight: FontWeight.w400,
                              //         ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
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

class CheckInDialog extends ConsumerWidget {
  String title;
  String svgPath;
  UserManagementState state;
  UserManagementNotifier controller;

  CheckInDialog(
      {super.key,
      required this.title,
      required this.svgPath,
      required this.state,
      required this.controller});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.only(left: 0.0, right: 0.0),
          width: 320.w,
          // height: 403.h,
          child: Container(
            child: Stack(
              children: <Widget>[
                Container(
                  // height: 403.h,
                  padding:
                      const EdgeInsets.only(top: 18.0, right: 0, bottom: 50).r,
                  margin:
                      const EdgeInsets.only(top: 50.0, right: 8.0, bottom: 0).r,

                  decoration: BoxDecoration(
                      color: whiteColor,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 0.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ]),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      16.2.ph,
                      Center(
                        child: Text(
                          title,
                          style: GoogleFonts.montserrat(
                              fontSize: 18.22.sp,
                              color: const Color(0xff5F5656),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      28.4.ph,
                      Padding(
                        padding: const EdgeInsets.only(left: 24).r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            15.ph,
                            Text('Select Department',
                                style: GoogleFonts.montserrat(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xff131925))),
                            5.ph,
                            Container(
                                //height: 34.h,
                                margin: EdgeInsets.only(right: 23).r,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(5).r,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: const Offset(
                                        1.0,
                                        10.0,
                                      ),
                                      blurRadius: 10.0,
                                      spreadRadius: 1.0,
                                    ),
                                  ],
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField<String>(
                                    isExpanded: true,
                                    value: state.department,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.w800,
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Color(0xffBEBEC2),
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 0)
                                              .r,
                                      border: InputBorder.none,
                                    ),
                                    items: controller.departmentList
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: AutoSizeText(value,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w300,
                                                color:
                                                    const Color(0xFF131925))),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      controller.updateDepartment(newValue!);

                                      // ref
                                      //     .read(userManagementProvider.notifier)
                                      //     .updateFunction(newValue!);
                                    },
                                  ),
                                )),
                            15.ph,
                            if (state.department ==
                                'Accounting Department') ...[
                              Text('Select Function',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff131925))),
                              5.ph,
                              Container(
                                  //height: 34.h,
                                  margin: EdgeInsets.only(right: 23).r,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(5).r,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        offset: const Offset(
                                          1.0,
                                          10.0,
                                        ),
                                        blurRadius: 10.0,
                                        spreadRadius: 1.0,
                                      ),
                                    ],
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField<String>(
                                      isExpanded: true,
                                      value: state.function,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 25.sp,
                                        fontWeight: FontWeight.w800,
                                      ),
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Color(0xffBEBEC2),
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                    horizontal: 10, vertical: 0)
                                                .r,
                                        border: InputBorder.none,
                                      ),
                                      items: controller.functionList
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: AutoSizeText(value,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w300,
                                                  color:
                                                      const Color(0xFF131925))),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        //controller.updateFunction(newValue!);
                                        // ref
                                        //     .read(
                                        //         userManagementProvider.notifier)
                                        //     .updateFunction(newValue!);
                                      },
                                    ),
                                  )),
                            ]
                          ],
                        ),
                      ),
                      31.ph,
                      Padding(
                        padding: EdgeInsets.only(left: 35, right: 35).r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    style: FontManagment().montserrat12,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
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
                                    style: FontManagment().montserrat12White,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 10
                      .h, // This positions the top of the CircleAvatar at the top edge of the Stack.
                  left: (280.w / 2) -
                      (41.8.w /
                          2), // This centers the CircleAvatar horizontally in the Stack.
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      radius: 61.8.h /
                          2, // This sets the radius of the CircleAvatar.
                      backgroundColor: Colors.transparent,
                      child: SvgPicture.asset(svgPath),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
