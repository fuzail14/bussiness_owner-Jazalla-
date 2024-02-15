import 'dart:async';
import 'dart:developer';
import 'package:bussines_owner/Constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Repo/General Service Repo/general_service_repository.dart';
import '../Model/GeneralService.dart';

final generalServiceStateProvider =
    StateNotifierProvider<GeneralServiceController, GeneralServiceState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('Person data is not available');
  }
  return GeneralServiceController(person: person);
}, dependencies: [personProvider]);

class GeneralServiceState {
  final Status responseStatus;
  final List<Services> servicesList;

  GeneralServiceState(
      {this.responseStatus = Status.loading, this.servicesList = const []});

  GeneralServiceState copyWith(
      {Status? responseStatus, List<Services>? servicesList}) {
    return GeneralServiceState(
      responseStatus: responseStatus ?? this.responseStatus,
      servicesList: servicesList ?? this.servicesList,
    );
  }
}

class GeneralServiceController extends StateNotifier<GeneralServiceState> {
  final generalServiceRepository = GeneralServiceRepository();
  // final String bearerToken;
  final Person person;
  GeneralServiceController({required this.person})
      : super(GeneralServiceState()) {
    _loadServices();
  }

  Future<void> _loadServices() async {
    setResponseStatus(Status.loading);
    try {
      final value = await generalServiceRepository.ServicesResponse(
          bearerToken: person.Bearer);
      state = state.copyWith(
        servicesList: value.services,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());

      myToast(msg: e.toString());
    }
  }

  void setResponseStatus(Status val) {
    state = state.copyWith(responseStatus: val);
  }

  serviceSearchApi({
    String? query,
  }) {
    if (query == null || query.isEmpty) {
      _loadServices();
    } else {
      generalServiceRepository
          .serviceSearchRepo(
        query: query,
        bearerToken: person.Bearer,
      )
          .then((value) {
        final updatedCompaniesList = List<Services>.from(value.services);

        for (int i = 0; i < value.services.length; i++) {
          state.servicesList.add(value.services[i]);
        }

        state = state.copyWith(
          servicesList: updatedCompaniesList,
        );
        setResponseStatus(Status.completed);
      }).onError((error, stackTrace) {
        setResponseStatus(Status.error);

        myToast(
          msg: 'No Data Found',
        );
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
    // TODO: implement dispose
    super.dispose();
    debouncer?.cancel();
  }

  serviceFilterApi({
    String? filtertype,
  }) {
    setResponseStatus(Status.loading);
    state.servicesList.clear();

    generalServiceRepository
        .serviceFilterApi(
      type: filtertype,
      userId: person.data!.id!,
      bearerToken: person.Bearer,
    )
        .then((value) {
      final updatedCompaniesList = List<Services>.from(value.services);

      for (int i = 0; i < value.services.length; i++) {
        state.servicesList.add(value.services[i]);
      }
      state = state.copyWith(
        servicesList: updatedCompaniesList,
      );

      setResponseStatus(Status.completed);
    }).onError((error, stackTrace) {
      setResponseStatus(Status.error);

      myToast(
        msg: '$error ',
      );
      log(error.toString());
      log(stackTrace.toString());
    });
  }

  Future<void> applyFilter(GeneralServiceFilter filter) async {
    switch (filter) {
      case GeneralServiceFilter.showAll:
        await _loadServices();
        break;
      case GeneralServiceFilter.favouriteList:
        await serviceFilterApi(filtertype: 'favourite services');
        break;

      case GeneralServiceFilter.newestService:
        await serviceFilterApi(filtertype: 'newest services');

        break;
      case GeneralServiceFilter.oldestService:
        await serviceFilterApi(filtertype: 'oldest services');

        break;
      case GeneralServiceFilter.fromZtoA:
        await serviceFilterApi(filtertype: 'z-a services');

        break;
      case GeneralServiceFilter.fromAtoZ:
        await serviceFilterApi(filtertype: 'a-z services');

        break;
    }
  }

  List<CupertinoDialogAction> getDialogActions(
      BuildContext context, WidgetRef ref) {
    final controller = ref.read(generalServiceStateProvider.notifier);

    return GeneralServiceFilter.values.map((filter) {
      return CupertinoDialogAction(
        child: Text(filter.name),
        onPressed: () {
          Navigator.pop(context);
          controller.applyFilter(filter);
        },
      );
    }).toList();
  }
}

enum GeneralServiceFilter {
  showAll,
  favouriteList,

  newestService,
  oldestService,
  fromZtoA,
  fromAtoZ,
}
