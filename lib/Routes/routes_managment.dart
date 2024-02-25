import 'package:go_router/go_router.dart';
import 'package:bussines_owner/Constants/Person/person.dart';
import 'package:bussines_owner/Module/BussinesForSale/Detail/View/bussines_for_sale_detail_page.dart';
import 'package:bussines_owner/Module/GeneralServices/Detail/View/service_detail_page.dart';
import 'package:bussines_owner/Module/GeneralServices/Services/View/general_services_screen.dart';
import 'package:bussines_owner/Module/HomeScreen/View/home_screen.dart';
import 'package:bussines_owner/Module/InvestMentOpportunity/Detail/View/investment_detail_page.dart';
import 'package:bussines_owner/Module/OnlineStore/Detail/View/online_store_detail_page.dart';
import 'package:bussines_owner/Module/OnlineStore/onlinestore/View/online_store_screen.dart';
import 'package:bussines_owner/Module/Splash/View/splash_screen.dart';
import 'package:bussines_owner/Module/Tenders/Detail/View/tenders_detail_page.dart';
import 'package:bussines_owner/Module/Verification/MobileNumber/View/register.dart';
import 'package:bussines_owner/Module/Verification/Password/View/password_screen.dart';
import 'package:bussines_owner/Module/Verification/Verification%20Code/View/verification_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bussines_owner/Routes/set_routes.dart';
import '../Constants/Person/person_controller.dart';
import '../Module/BussinesCommunity/Detail/View/bussines_community_detail_page.dart';
import '../Module/BussinesCommunity/Main/View/bussines_communities_screen.dart';
import '../Module/BussinesForSale/Main/View/sale_bussines_screen.dart';
import '../Module/GeneralServices/RequestProposal/View/request_proposal_page.dart';
import '../Module/GeneralServices/SendInquiry/View/service_send_inquiry_page.dart';
import '../Module/InvestMentOpportunity/Main/View/investMent_Opportunity_screen.dart';
import '../Module/OnlineStore/RequestQuote/View/request_quote_page.dart';
import '../Module/OnlineStore/SendInquiry/View/send_inquiry_page.dart';
import '../Module/ProcurementManagment/RFI/View/procurement_soi_screen.dart';
import '../Module/ProcurementManagment/RFQ/View/procurement_rfq_screen.dart';
import '../Module/Tenders/TenderMain/View/tenders_screen.dart';
import '../Module/Tenders/TendersResponse/View/tender_response_page.dart';
import '../Providers/argument_provider.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: splashscreen,
      path: '/',
      pageBuilder: (context, state) {
        const page = SplashScreen();
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: checkPhoneNumber,
      path: '/CheckPhoneNumber',
      pageBuilder: (context, state) {
        const page = CheckPhoneNumber();
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: verificationCodeScreen,
      path: '/VerificationCode',
      pageBuilder: (context, state) {
        final page = VerificationCode();
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: passwordScreen,
      path: '/PasswordScreen',
      pageBuilder: (context, state) {
        final page = PasswordScreen();
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: homescreen,
      path: '/HomeScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: HomeScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: bussinesCommunitiesScreen,
      path: '/BussinesCommunitiesScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: BussinesCommunitiesScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: bussinesCommunityDetailPage,
      path: '/BussinesCommunityDetailPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final bearerToken = state.extra as String;
        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue(
                {'companyId': id, 'bearerToken': bearerToken}),
          ],
          child: BussinesCommunityDetailPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: onlineStoreScreen,
      path: '/OnlineStoreScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: OnlineStoreScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: onlineStoreDetailPage,
      path: '/OnlineStoreDetailPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final bearerToken = state.extra as String;
        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue(
                {'productId': id, 'bearerToken': bearerToken}),
          ],
          child: OnlineStoreDetailPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: tendersView,
      path: '/TendersView',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: TendersView(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: tendersDetailPage,
      path: '/TendersDetailPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final bearerToken = state.extra as String;
        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue(
                {'tenderId': id, 'bearerToken': bearerToken}),
          ],
          child: TendersDetailPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: generalServiceView,
      path: '/GeneralServiceView',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: GeneralServiceView(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: serviceDetailPage,
      path: '/ServiceDetailPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final bearerToken = state.extra as String;
        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue(
                {'serviceId': id, 'bearerToken': bearerToken}),
          ],
          child: ServiceDetailPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: bussinesForSale,
      path: '/BussinesForSale',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: BussinesForSale(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: saleBussinesDetailPage,
      path: '/SaleBussinesDetailPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final bearerToken = state.extra as String;
        final page = ProviderScope(
          overrides: [
            routeArgsProvider
                .overrideWithValue({'Id': id, 'bearerToken': bearerToken}),
          ],
          child: SaleBussinesDetailPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: investMentOpportunityView,
      path: '/InvestMentOpportunityView',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: InvestMentOpportunityView(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: investmentDetailPage,
      path: '/InvestmentDetailPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final bearerToken = state.extra as String;
        final page = ProviderScope(
          overrides: [
            routeArgsProvider
                .overrideWithValue({'Id': id, 'bearerToken': bearerToken}),
          ],
          child: InvestmentDetailPage(),
        );
        return buildPageWithFadeTransition(
          context: context,
          state: state,
          child: page,
          fullscreenDialog: false,
        );
      },
    ),
    GoRoute(
      name: inquiryScreen,
      path: '/inquiryScreen',
      pageBuilder: (context, state) {
        final inquiryData = state.extra as Map<String, dynamic>?;
        final page = InquiryScreen(inquiryData: inquiryData);
        return buildPageWithFadeTransition(
          context: context,
          state: state,
          child: page,
          fullscreenDialog: true,
        );
      },
    ),
    GoRoute(
      name: requestQuoteScreen,
      path: '/RequestQuoteScreen',
      pageBuilder: (context, state) {
        final quoteData = state.extra as Map<String, dynamic>;
        // final productId = int.parse(quoteData['productId']);
        // final userId = int.parse(quoteData['userId']);
        // final userCompanyId = int.parse(quoteData['userCompanyId']);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue(quoteData),
          ],
          child: RequestQuoteScreen(),
        );
        return buildPageWithFadeTransition(
          fullscreenDialog: false,
          context: context,
          state: state,
          child: page,
        );
      },
    ),
    GoRoute(
      name: serviceinquiryScreen,
      path: '/ServiceSendInquiryScreen',
      pageBuilder: (context, state) {
        final inquiryData = state.extra as Map<String, dynamic>?;
        final page = ServiceSendInquiryScreen(inquiryData: inquiryData);
        return buildPageWithFadeTransition(
          context: context,
          state: state,
          child: page,
          fullscreenDialog: true,
        );
      },
    ),
    GoRoute(
      name: requestProposalScreen,
      path: '/RequestProposalScreen',
      pageBuilder: (context, state) {
        final quoteData = state.extra as Map<String, dynamic>;
        // final productId = int.parse(quoteData['productId']);
        // final userId = int.parse(quoteData['userId']);
        // final userCompanyId = int.parse(quoteData['userCompanyId']);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue(quoteData),
          ],
          child: RequestProposalScreen(),
        );
        return buildPageWithFadeTransition(
          fullscreenDialog: false,
          context: context,
          state: state,
          child: page,
        );
      },
    ),
    GoRoute(
      name: tenderResponseScreen,
      path: '/TenderResponseScreen',
      pageBuilder: (context, state) {
        final quoteData = state.extra as Map<String, dynamic>;

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue(quoteData),
          ],
          child: TenderResponseScreen(),
        );
        return buildPageWithFadeTransition(
          fullscreenDialog: false,
          context: context,
          state: state,
          child: page,
        );
      },
    ),
    GoRoute(
      name: procuremenetSoiScreen,
      path: '/ProcuremenetSoiScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: ProcuremenetSoiScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: procuremenetRFQScreen,
      path: '/ProcurementRFQScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: ProcurementRFQScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
  ],
);

CustomTransitionPage buildPageWithFadeTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  required bool fullscreenDialog,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 100),
    fullscreenDialog: fullscreenDialog, // Use this parameter here
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child),
  );
}
