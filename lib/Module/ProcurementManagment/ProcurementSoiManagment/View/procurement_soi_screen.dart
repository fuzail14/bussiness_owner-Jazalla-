import 'package:auto_size_text/auto_size_text.dart';
import 'package:bussines_owner/Constants/Extensions/extensions.dart';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:bussines_owner/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../Constants/Global/GlobalList/global_lists.dart';
import '../../../../Constants/provider/global_providers.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/Buttons/FilterButton/filter_button.dart';
import '../../../../Widgets/Loader/loader.dart';
import '../Controller/procurement_soi_controller.dart';

// ignore: must_be_immutable
class ProcuremenetSoiScreen extends ConsumerWidget {
  int buildcheck = 0;

  ProcuremenetSoiScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(ProcuremenetSoiProvider.notifier);
    final state = ref.watch(ProcuremenetSoiProvider);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    print('build check  ${buildcheck++}');

    return Scaffold(
      appBar: MyAppBar(
          showBell: false,
          title: "RFI/SOI Managemet",
          filterOnPressed: () {
            _scaffoldKey.currentState?.openEndDrawer();
          }),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () => controller.BussinesCommunitiesViewApi(
          bearerToken: state.person.Bearer!,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              26.ph,
              Row(
                children: [
                  Container(
                    width: 281.w,
                    height: 36.h,
                    padding: EdgeInsets.only(left: 20).r,
                    margin: EdgeInsets.only(left: 26).r,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(color: HexColor('#DEDEDE'))),
                    child: TextField(
                      controller: controller.searchController,
                      // onChanged: (query) {
                      //   controller.debounce(() {
                      //     controller.bussinesCommunitySearchApi(query: query);
                      //   });
                      // },
                      decoration: InputDecoration(
                        hintText: "What are you looking for?",
                        hintStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            color: HexColor('#75788D')),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.bussinesCommunitySearchApi(
                                query: controller.searchController.text.trim());
                          },
                          child: Container(
                            padding: EdgeInsets.only(right: 22).r,
                            width: 22.w,
                            height: 21.h,
                            child: SvgPicture.asset(
                              'assets/images/search.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  10.pw,
                  IconButton(
                      onPressed: () {
                        controller.BussinesCommunitiesViewApi(
                            bearerToken: state.person.Bearer);
                      },
                      icon: const Icon(
                        Icons.refresh,
                        color: blueColor,
                      )

                      // SvgPicture.asset(
                      //   'assets/images/filter.svg',
                      //   height: 20,
                      //   width: 40,
                      // )
                      ),
                ],
              ),
              if (state.responseStatus == Status.loading)
                const Loader()
              else if (state.responseStatus == Status.completed) ...[
                20.ph,
                if (state.companiesApiList.isEmpty) ...[
                  Center(
                    child: Text(
                      'No Community Found.',
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: HexColor('#EB2F2F')),
                    ),
                  ),
                ] else
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columnSpacing: 20.0,
                      columns: const [
                        DataColumn(label: Text('ID')),
                        DataColumn(label: Text('Title')),
                        //DataColumn(label: Text('Request')),
                        DataColumn(label: Text('Item Type')),
                        DataColumn(label: Text('Issue Date')),
                        DataColumn(label: Text('Status')),
                        DataColumn(label: Text('Action')),
                      ],
                      rows: state.companiesApiList
                          .map<DataRow>(
                            (company) => DataRow(
                              cells: [
                                DataCell(Text(company.id.toString())),
                                DataCell(SizedBox(
                                  width: 100.w,
                                  child: Text(
                                    company.companyName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                                // DataCell(Text(company.id.toString() ?? 'N/A')),
                                DataCell(Text(company.id.toString() ?? 'N/A')),
                                DataCell(Text(company.status ?? 'N/A')),
                                DataCell(Text(company.status ?? 'N/A')),
                                DataCell(
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.remove_red_eye),
                                        onPressed: () {
                                          // View details logic goes here
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.send),
                                        onPressed: () {
                                          // Send response logic goes here
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
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
      ),

      // ),
    );
  }
}

List<Widget> buildBusinessActivitiesFilter(
    ProcuremenetSoiController controller, ProcuremenetSoiState state) {
  return [
    Container(
      width: double.infinity,
      // height: 437,
      padding: EdgeInsets.only(left: 30, top: 19, bottom: 20, right: 20),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: HexColor('#FFFFFF'),
          border: Border.all(color: HexColor('#7F7F8A4D'))),
      child: Wrap(
        spacing: 8.0, // Gap between adjacent chips.
        runSpacing: 4.0, // Gap between lines.
        children: state.isic4MainActivities!.map((sector) {
          bool isSelected = sector.id == state.selectedSectorId;

          // int index = businessSectors.indexOf(sector);
          // bool isSelected = sector['isChecked'];

          return GestureDetector(
            onTap: () {
              controller.setSelectedSectorId(sector.id!);
            },
            child: FilterButton(
                name: sector.mainActivityName!, isSelected: isSelected),
          );
        }).toList(),
      ),
    ),
  ];
}

List<Widget> buildIndustriesFilter(
    ProcuremenetSoiController controller, ProcuremenetSoiState state) {
  return [
    Container(
      width: double.infinity,
      // height: 437,
      padding: EdgeInsets.only(left: 30, top: 19, bottom: 20, right: 20),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: HexColor('#FFFFFF'),
          border: Border.all(color: HexColor('#7F7F8A4D'))),
      child: Wrap(
        spacing: 8.0, // Gap between adjacent chips.
        runSpacing: 4.0, // Gap between lines.
        children: state.industries!.map((sector) {
          bool isSelected = sector.id == state.selectedIndustryId;

          // int index = businessSectors.indexOf(sector);
          // bool isSelected = sector['isChecked'];

          return GestureDetector(
            onTap: () {
              controller.setSelectedIndustryId(sector.id!);
            },
            child: FilterButton(name: sector.name!, isSelected: isSelected),
          );
        }).toList(),
      ),
    ),
  ];
}

List<Widget> buildBusinessProvidersFilter(
    ProcuremenetSoiController controller, ProcuremenetSoiState state) {
  return [
    Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 30, top: 19, bottom: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: HexColor('#FFFFFF'),
          border: Border.all(color: HexColor('#7F7F8A4D'))),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: controller.businessProviders.map((sector) {
          //bool isSelected = sector['id'] == state.selectedProviderId;
          bool isSelected = sector['isChecked'];

          return GestureDetector(
            onTap: () {
              // Check if the tapped button is already selected
              if (sector['isChecked']) {
                // If yes, revert its state
                sector['isChecked'] = false;

                controller.BussinesCommunitiesViewApi(
                    bearerToken: state.person.Bearer);
              } else {
                // If no, unselect all other buttons
                for (var s in controller.businessProviders) {
                  s['isChecked'] = false;
                }
                // Select the tapped button
                sector['isChecked'] = true;

                // Trigger the first API call with the selected sector's ID
                controller.companyBussinesFilterApi(
                    bussinestype: sector['name']);
              }
            },
            child: FilterButton(name: sector['name'], isSelected: isSelected),
          );
        }).toList(),
      ),
    ),
  ];
}

List<Widget> buildSortFilter(
    ProcuremenetSoiController controller, ProcuremenetSoiState state) {
  return [
    Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 30, top: 19, bottom: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: HexColor('#FFFFFF'),
          border: Border.all(color: HexColor('#7F7F8A4D'))),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: sortList.map((sector) {
          //bool isSelected = sector['id'] == state.selectedProviderId;
          bool isSelected = sector['isChecked'];

          return GestureDetector(
            onTap: () {
              // Check if the tapped button is already selected
              if (sector['isChecked']) {
                // If yes, revert its state
                sector['isChecked'] = false;

                controller.BussinesCommunitiesViewApi(
                    bearerToken: state.person.Bearer);
              } else {
                // If no, unselect all other buttons
                for (var s in sortList) {
                  s['isChecked'] = false;
                }
                // Select the tapped button
                sector['isChecked'] = true;

                // Trigger the first API call with the selected sector's ID
                controller.companyFilterApi(filtertype: sector['name']);
              }
            },
            child: FilterButton(name: sector['name'], isSelected: isSelected),
          );
        }).toList(),
      ),
    ),
  ];
}
