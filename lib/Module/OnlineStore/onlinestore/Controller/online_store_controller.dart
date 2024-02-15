import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../../../../Constants/constants.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Repo/Online Store Repository/online_store_repository.dart';
import '../../../../Widgets/CustomDialog/custom_dialog.dart';
import '../Model/Product.dart';
import 'package:flutter/foundation.dart';

final onlineStoreProvider =
    StateNotifierProvider<OnlineStoreController, OnlineStoreState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return OnlineStoreController(person: person);
}, dependencies: [personProvider]);

class OnlineStoreState {
  final Status responseStatus;
  //final String Filterval;
  final List<Products> productsApiList;
  final List<Companies> productsCompaniesApiList;
  final String description;
  final File? pdfFile;

  OnlineStoreState({
    this.responseStatus = Status.loading,
    this.productsApiList = const [],
    //this.Filterval = '',
    this.productsCompaniesApiList = const [],
    this.description = '',
    this.pdfFile,
  });

  OnlineStoreState copyWith(
      {Status? responseStatus,
      // String? Filterval,
      List<Products>? productsApiList,
      List<Companies>? productsCompaniesApiList,
      String? description,
      File? pdfFile}) {
    return OnlineStoreState(
      responseStatus: responseStatus ?? this.responseStatus,
      //Filterval: Filterval ?? this.Filterval,
      productsApiList: productsApiList ?? this.productsApiList,
      productsCompaniesApiList:
          productsCompaniesApiList ?? this.productsCompaniesApiList,
      description: description ?? this.description,
      pdfFile: pdfFile ?? this.pdfFile,
    );
  }
}

class OnlineStoreController extends StateNotifier<OnlineStoreState> {
  final Person person;
  final onlineStoreRepo = OnlineStoreRepository();

  OnlineStoreController({
    required this.person,
  }) : super(OnlineStoreState()) {
    _initialize();
  }

  void _initialize() {
    Future.delayed(const Duration(milliseconds: 300), () {
      onlineStoreViewApi(bearerToken: person.Bearer!);
    });
  }

  Future<void> onlineStoreViewApi({required String bearerToken}) async {
    setResponseStatus(Status.loading);

    try {
      final value =
          await onlineStoreRepo.onlineStoreViewApi(bearerToken: bearerToken);
      state = state.copyWith(
        productsApiList: value.products,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      myToast(
        msg: '$e ',
      );

      log(e.toString());
      log(stackTrace.toString());
    }
  }

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }

  productFilterApi({
    String? filtertype,
  }) {
    setResponseStatus(Status.loading);
    state.productsApiList.clear();

    onlineStoreRepo
        .productFilterApi(
      type: filtertype,
      userId: person.data!.id!,
      bearerToken: person.Bearer,
    )
        .then((value) {
      //Status.completed;

      final updatedCompaniesList = List<Products>.from(value.products);

      for (int i = 0; i < value.products.length; i++) {
        state.productsApiList.add(value.products[i]);
      }
      state = state.copyWith(
        productsApiList: updatedCompaniesList,
      );

      setResponseStatus(Status.completed);
      //update();
    }).onError((error, stackTrace) {
      setResponseStatus(Status.error);

      myToast(
        msg: '$error ',
      );
      log(error.toString());
      log(stackTrace.toString());
    });
  }

  productSearchApi({
    String? query,
  }) {
    if (query == null || query.isEmpty) {
      onlineStoreViewApi(bearerToken: person.Bearer!);
    } else {
      onlineStoreRepo
          .productSearchRepo(
        query: query,
        bearerToken: person.Bearer,
      )
          .then((value) {
        final updatedCompaniesList = List<Products>.from(value.products);

        for (int i = 0; i < value.products.length; i++) {
          state.productsApiList.add(value.products[i]);
        }

        state = state.copyWith(
          productsApiList: updatedCompaniesList,
        );

        setResponseStatus(Status.completed);
        //update();
      }).onError((error, stackTrace) {
        setResponseStatus(Status.error);

        myToast(
          msg: '$error ',
        );
        log('controller error ${error.toString()}');
        //log(stackTrace.toString());
      });
    }
  }

  String? searchQuery;
  Timer? debouncer;
  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer?.isActive ?? false) debouncer!.cancel();
    debouncer = Timer(duration, callback);
    if (debouncer != null) {
      debouncer!.cancel();
      setResponseStatus(Status.completed);
    }

    debouncer = Timer(duration, callback);
    setResponseStatus(Status.completed);
  }

  @override
  void dispose() {
    super.dispose();
    debouncer?.cancel();
  }

  // List<ActionItem> getDialogActions(BuildContext context) {
  //   return [
  //     ActionItem(
  //       title: 'Show All',
  //       onPressed: () {
  //         onlineStoreViewApi(bearerToken: person.Bearer!);
  //         Navigator.pop(context);
  //       },
  //     ),
  //     ActionItem(
  //       title: 'Favourite List',
  //       onPressed: () {
  //         productFilterApi(filtertype: 'favourite products');
  //         Navigator.pop(context);
  //       },
  //     ),
  //     ActionItem(
  //       title: 'National Product',
  //       onPressed: () {
  //         productFilterApi(filtertype: 'national products');
  //         Navigator.pop(context);
  //       },
  //     ),
  //     ActionItem(
  //       title: 'Newest Products',
  //       onPressed: () {
  //         productFilterApi(filtertype: 'newest products');
  //         Navigator.pop(context);
  //       },
  //     ),
  //     ActionItem(
  //       title: 'Oldest Products',
  //       onPressed: () {
  //         productFilterApi(filtertype: 'oldest products');
  //         Navigator.pop(context);
  //       },
  //     ),
  //     ActionItem(
  //       title: 'From Z-A Products',
  //       onPressed: () {
  //         productFilterApi(filtertype: 'z-a products');
  //         Navigator.pop(context);
  //       },
  //     ),
  //     ActionItem(
  //       title: 'From A-Z Products',
  //       onPressed: () {
  //         productFilterApi(filtertype: 'a-z products');

  //         Navigator.pop(context);
  //       },
  //     ),
  //   ];
  // }

  void setDescription(String description) {
    state = state.copyWith(description: description);
  }

  void setPdfFile(File? pdfFile) {
    state = state.copyWith(pdfFile: pdfFile);
  }

  Future<void> applyFilter(OnlineStoreFilter filter) async {
    switch (filter) {
      case OnlineStoreFilter.showAll:
        await onlineStoreViewApi(bearerToken: person.Bearer!);
        break;
      case OnlineStoreFilter.favouriteList:
        await productFilterApi(filtertype: 'favourite products');
        break;
      case OnlineStoreFilter.nationalProduct:
        await productFilterApi(filtertype: 'national products');
        break;
      case OnlineStoreFilter.newestProducts:
        await productFilterApi(filtertype: 'newest products');

        break;
      case OnlineStoreFilter.oldestProducts:
        await productFilterApi(filtertype: 'oldest products');

        break;
      case OnlineStoreFilter.fromZtoA:
        await productFilterApi(filtertype: 'z-a products');

        break;
      case OnlineStoreFilter.fromAtoZ:
        await productFilterApi(filtertype: 'a-z products');

        break;
    }
  }

  List<CupertinoDialogAction> getDialogActions(
      BuildContext context, WidgetRef ref) {
    final controller = ref.read(onlineStoreProvider.notifier);

    return OnlineStoreFilter.values.map((filter) {
      return CupertinoDialogAction(
        child: Text(filter.name),
        onPressed: () {
          Navigator.pop(context);
          controller.applyFilter(filter);
        },
      );
    }).toList();
  }

  List<Widget> buildBusinessActivitiesFilter(WidgetRef ref) {
    return businessSectors.map((sector) {
      int index = businessSectors.indexOf(sector);
      return CheckboxListTile(
        title: Text(sector['main_activity_name']),
        value: sector['isChecked'],
        onChanged: (bool? value) {
          if (value != null && value) {
            selectSingleBusinessSector(sector['id'], value, ref);
          }
        },
      );
    }).toList();
  }

  void selectSingleBusinessSector(String sectorId, bool value, WidgetRef ref) {
    // Uncheck all
    for (var sector in businessSectors) {
      sector['isChecked'] = false;
    }

    // Find the selected sector and check it
    var foundSector =
        businessSectors.firstWhere((sector) => sector['id'] == sectorId);
    foundSector['isChecked'] = value;

    // Call the API function
    if (value) {
      //companyBussinesIsic4mainActivityFilterApi(sectorId);
    }

    // Notify listeners that the state has changed
    // state = state.copyWith();
  }

  List<Map<String, dynamic>> sortList = [
    {'id': '1', 'name': 'Newest', 'isChecked': false},
    {'id': '2', 'name': 'Oldest', 'isChecked': false},
    {'id': '3', 'name': 'From Z-A', 'isChecked': false},
    {'id': '3', 'name': 'From A-Z', 'isChecked': false},
  ];

  List<Map<String, dynamic>> businessSectors = [
    {
      'id': '1',
      'main_activity_name': 'Agriculture Forestry And Fishing',
      'isChecked': false
    },
    {'id': '16', 'main_activity_name': 'Education', 'isChecked': false},
    {'id': '6', 'main_activity_name': 'Construction', 'isChecked': false},
    {
      'id': '11',
      'main_activity_name': 'Financial and insurance activities',
      'isChecked': false
    },
    {
      'id': '8',
      'main_activity_name': 'Transportation and storage',
      'isChecked': false
    },
    {'id': '3', 'main_activity_name': 'Manufacturing', 'isChecked': false},
    {
      'id': '12',
      'main_activity_name': 'Real estate activities',
      'isChecked': false
    },
    {
      'id': '7',
      'main_activity_name': 'Wholesale retail trade repair of vehicles',
      'isChecked': false
    },
    {
      'id': '14',
      'main_activity_name': 'Administrative and support service activities',
      'isChecked': false
    },
    {
      'id': '2',
      'main_activity_name': 'Mining And Quarrying',
      'isChecked': false
    },
    {
      'id': '19',
      'main_activity_name': 'Other service activities',
      'isChecked': false
    },
    {
      'id': '10',
      'main_activity_name': 'Information and Communication',
      'isChecked': false
    },
    {
      'id': '18',
      'main_activity_name': 'Arts entertainment and recreation',
      'isChecked': false
    },
    {
      'id': '5',
      'main_activity_name': 'Water supply sewerage waste management',
      'isChecked': false
    },
    {
      'id': '17',
      'main_activity_name': 'Human health and social work activities',
      'isChecked': false
    },
    {
      'id': '9',
      'main_activity_name': 'Accommodation and food services activities',
      'isChecked': false
    },
    {
      'id': '13',
      'main_activity_name': 'Professional scientific and technical activities',
      'isChecked': false
    },
    {
      'id': '4',
      'main_activity_name': 'Electricity gas steam and air conditioning supply',
      'isChecked': false
    },
    {
      'id': '15',
      'main_activity_name': 'Public administration defense and social security',
      'isChecked': false
    },
  ];
}

enum OnlineStoreFilter {
  showAll,
  favouriteList,
  nationalProduct,
  newestProducts,
  oldestProducts,
  fromZtoA,
  fromAtoZ,
}
