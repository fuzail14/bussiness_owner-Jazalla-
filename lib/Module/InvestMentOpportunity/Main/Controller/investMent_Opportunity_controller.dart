import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/Person/person_controller.dart';
import '../../../../Constants/constants.dart';
import '../../../../Data/Api Resp/api_response.dart';
import '../../../../Repo/InvestMent Opportunity Repo/investment_opportunity_repository.dart';
import '../Model/InvestMentOpportunity.dart';

// class InvestMentOpportunityController extends GetxController {
//   var arguments = Get.arguments;
//   late final Person person;
//   var responseStatus = Status.loading;
//   final investMentOpportunityRepository = InvestMentOpportunityRepository();
//   List<Investments> investmentsList = [];

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     person = arguments;

//     Future.delayed(Duration(milliseconds: 300), () {
//       InvestMentOpportunityApi(bearerToken: person.Bearer);
//     });

//     ;
//   }

//   // ignore: non_constant_identifier_names
//   InvestMentOpportunityApi({required bearerToken}) {
//     setResponseStatus(Status.loading);
//     update();

//     investMentOpportunityRepository.InvestMentOpportunityResponse(
//       bearerToken: bearerToken,
//     ).then((value) {
//       investmentsList.clear();
//       update();

//       for (int i = 0; i < value.investments.length; i++) {
//         investmentsList.add(value.investments[i]);
//       }

//       setResponseStatus(Status.completed);
//       update();
//     }).onError((error, stackTrace) {
//       setResponseStatus(Status.error);

//       Get.snackbar('Error', '$error ', backgroundColor: Colors.white);
//       log(error.toString());
//       log(stackTrace.toString());
//     });
//   }

//   setResponseStatus(Status val) {
//     responseStatus = val;
//     update();

//     return responseStatus;
//   }
// }

final investMentOpportunityStateProvider = StateNotifierProvider<
    InvestMentOpportunityController, InvestMentOpportunityState>((ref) {
  final person = ref.watch(personProvider);
  if (person == null) {
    throw Exception('User data is not available');
  }
  return InvestMentOpportunityController(person: person);
}, dependencies: [personProvider]);

class InvestMentOpportunityState {
  final Status responseStatus;
  final List<Investments> investmentsList;

  InvestMentOpportunityState(
      {this.responseStatus = Status.loading, this.investmentsList = const []});

  InvestMentOpportunityState copyWith(
      {Status? responseStatus, List<Investments>? investmentsList}) {
    return InvestMentOpportunityState(
      responseStatus: responseStatus ?? this.responseStatus,
      investmentsList: investmentsList ?? this.investmentsList,
    );
  }
}

class InvestMentOpportunityController
    extends StateNotifier<InvestMentOpportunityState> {
  final investMentOpportunityRepository = InvestMentOpportunityRepository();
  // final String bearerToken;
  final Person person;
  InvestMentOpportunityController({required this.person})
      : super(InvestMentOpportunityState()) {
    _loadInvestMentOpportunities();
  }

  Future<void> _loadInvestMentOpportunities() async {
    setResponseStatus(Status.loading);
    try {
      final value =
          await investMentOpportunityRepository.InvestMentOpportunityResponse(
              bearerToken: person.Bearer);
      state = state.copyWith(
        investmentsList: value.investments,
        responseStatus: Status.completed,
      );
    } catch (e, stackTrace) {
      setResponseStatus(Status.error);
      log(e.toString());
      log(stackTrace.toString());

      myToast(msg: e.toString());
    }
  }

  setResponseStatus(Status val) {
    state.copyWith(responseStatus: val);
  }
}
