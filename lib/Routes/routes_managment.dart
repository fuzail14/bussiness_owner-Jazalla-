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
import '../Module/Apprisal/View/apprisal_view.dart';
import '../Module/Approval Authority/Create/View/approval_authority_create_view.dart';
import '../Module/Approval Authority/Main/View/approval_authority_view.dart';
import '../Module/Approval Managment/Main/View/approval_managment_screen.dart';
import '../Module/Attendance Managment/View/attendance_managment_view.dart';
import '../Module/BussinesCommunity/Detail/View/bussines_community_detail_page.dart';
import '../Module/BussinesCommunity/Main/View/bussines_communities_screen.dart';
import '../Module/BussinesForSale/Main/View/sale_bussines_screen.dart';
import '../Module/Company Policy/View/company_policy_view.dart';
import '../Module/Event/View/event_view.dart';
import '../Module/General Information/View/general_information_page.dart';
import '../Module/GeneralServices/RequestProposal/View/request_proposal_page.dart';
import '../Module/GeneralServices/SendInquiry/View/service_send_inquiry_page.dart';
import '../Module/GeneratedOtpScreen/view/generated_otp_screen.dart';
import '../Module/Holidays/View/holidays_view.dart';
import '../Module/InvestMentOpportunity/Main/View/investMent_Opportunity_screen.dart';
import '../Module/InvoiceManagement/Detail/View/invoice_management_detail_page.dart';
import '../Module/InvoiceManagement/Main/View/invoice_management_view.dart';
import '../Module/Leave Managment/View/leave_managment_view.dart';
import '../Module/LeaveCreate/View/leave_create_view.dart';
import '../Module/MainHomeScreen/Main/View/main_home_screen.dart';
import '../Module/Notifications/View/notifications_screen.dart';
import '../Module/OnlineStore/RequestQuote/View/request_quote_page.dart';
import '../Module/OnlineStore/SendInquiry/View/send_inquiry_page.dart';
import '../Module/OrderPlacement/View/order_placement_screen.dart';
import '../Module/ProcurementManagment/RFI/RfxManagmentRFIDetail/View/rfx_managment_rfi_detail_page.dart';
import '../Module/ProcurementManagment/RFI/Main/View/procurement_soi_screen.dart';
import '../Module/ProcurementManagment/RFP/Main/View/procurement_rfp_screen.dart';
import '../Module/ProcurementManagment/RFP/RFXManagmentRFPDetail/View/rfx_managment_rfp_detail_page.dart';
import '../Module/ProcurementManagment/RFQ/Main/View/procurement_rfq_screen.dart';
import '../Module/ProcurementManagment/RFQ/RFXManagmentRFQDetail/View/rfx_managment_rfq_detail_page.dart';
import '../Module/SalaryPaySlip/Main/View/salary_payslip_view.dart';
import '../Module/SalaryPaySlip/PaySlipDetail/View/salary_payslip_detail_page.dart';
import '../Module/SalesManagment/RFIMain/RFI/View/sales_managment_rfi_screen.dart';
import '../Module/SalesManagment/RFIMain/SalesManagmentRFIDetail/View/sales_managment_rfi_detail_page.dart';
import '../Module/SalesManagment/RFIMain/SendRFIResponse/View/send_rfi_response.dart';
import '../Module/SalesManagment/RFQMain/RFQ/View/sales_managment_rfq_screen.dart';
import '../Module/SalesManagment/RFQMain/SalesManagmentRFQDetail/View/sales_managment_rfq_detail_page.dart';
import '../Module/SalesManagment/RFQMain/SendRfqResponse/View/send_rfq_response.dart';
import '../Module/ServiceManagment/RFIMain/RFI/View/service_managment_rfi_screen.dart';
import '../Module/ServiceManagment/RFIMain/ServiceManagmentRFIDetail/View/service_managment_rfi_detail_page.dart';
import '../Module/ServiceManagment/RFPMain/RFP/View/service_managment_rfp_screen.dart';
import '../Module/ServiceManagment/RFPMain/SendRFPResponse/View/send_rfp_response.dart';
import '../Module/ServiceManagment/RFPMain/ServiceManagmentRFPDetail/View/service_managment_rfp_detail_page.dart';
import '../Module/Tenders/TenderMain/View/tenders_screen.dart';
import '../Module/Tenders/TendersResponse/View/tender_response_page.dart';
import '../Module/UserManagment/View/user_management_view.dart';
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
        const page = VerificationCode();
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
        final page = HomeScreen();
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    // GoRoute(
    //   name: homescreen,
    //   path: '/HomeScreen',
    //   pageBuilder: (context, state) {
    //     final person = state.extra as Person;
    //     final page = ProviderScope(
    //       overrides: [
    //         personProvider
    //             .overrideWith((ref) => PersonController()..setPerson(person)),
    //       ],
    //       child: const HomeScreen(),
    //     );
    //     return buildPageWithFadeTransition(
    //         fullscreenDialog: false,
    //         context: context,
    //         state: state,
    //         child: page);
    //   },
    // ),
    GoRoute(
      name: bussinesCommunitiesScreen,
      path: '/BussinesCommunitiesScreen',
      pageBuilder: (context, state) {
        final page = BussinesCommunitiesScreen();
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    // GoRoute(
    //   name: bussinesCommunitiesScreen,
    //   path: '/BussinesCommunitiesScreen',
    //   pageBuilder: (context, state) {
    //     final person = state.extra as Person;
    //     final page = ProviderScope(
    //       overrides: [
    //         personProvider
    //             .overrideWith((ref) => PersonController()..setPerson(person)),
    //       ],
    //       child: BussinesCommunitiesScreen(),
    //     );
    //     return buildPageWithFadeTransition(
    //         fullscreenDialog: false,
    //         context: context,
    //         state: state,
    //         child: page);
    //   },
    // ),
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
          child: const BussinesCommunityDetailPage(),
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
          child: const OnlineStoreScreen(),
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
        final person = state.extra as Person;

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'productId': id}),
            personProvider.overrideWith(
              (ref) => PersonController()..setPerson(person),
            ),
          ],
          child: const OnlineStoreDetailPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),

    // GoRoute(
    //   name: onlineStoreDetailPage,
    //   path: '/OnlineStoreDetailPage/:id',
    //   pageBuilder: (context, state) {
    //     final id = int.parse(state.pathParameters['id']!);

    //     final bearerToken = state.extra as String;
    //     final page = ProviderScope(
    //       overrides: [
    //         routeArgsProvider.overrideWithValue(
    //             {'productId': id, 'bearerToken': bearerToken}),
    //       ],
    //       child: OnlineStoreDetailPage(),
    //     );
    //     return buildPageWithFadeTransition(
    //         fullscreenDialog: false,
    //         context: context,
    //         state: state,
    //         child: page);
    //   },
    // ),
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
          child: const TendersView(),
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
          child: const TendersDetailPage(),
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
          child: const GeneralServiceView(),
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

        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'serviceId': id}),
            personProvider.overrideWith(
              (ref) => PersonController()..setPerson(person),
            ),
          ],
          child: const ServiceDetailPage(),
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
          child: const BussinesForSale(),
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
          child: const SaleBussinesDetailPage(),
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
          child: const InvestMentOpportunityView(),
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
          child: const InvestmentDetailPage(),
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
          child: const RequestQuoteScreen(),
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
          child: const TenderResponseScreen(),
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
          child: const ProcuremenetSoiScreen(),
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
          child: const ProcurementRFQScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: procurementRFPScreen,
      path: '/ProcurementRFPScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: const ProcurementRFPScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: salesManagmentRFIScreen,
      path: '/SalesManagmentRFIScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: SalesManagmentRFIScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: salesManagmentRFQScreen,
      path: '/SalesManagmentRFQScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: const SalesManagmentRFQScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: serviceManagmentRFIScreen,
      path: '/ServiceManagmentRFIScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: ServiceManagmentRFIScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: serviceManagmentRFPScreen,
      path: '/ServiceManagmentRFPScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: ServiceManagmentRFPScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: rFXManagmentRFIDetailPage,
      path: '/RFXManagmentRFIDetailPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'rfiId': id}),
          ],
          child: const RFXManagmentRFIDetailPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: rFXManagmentRFQDetailPage,
      path: '/RFXManagmentRFQDetailPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'rfqId': id}),
          ],
          child: const RFXManagmentRFQDetailPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: rFXManagmentRFPDetailPage,
      path: '/RFXManagmentRFPDetailPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'rfpId': id}),
          ],
          child: const RFXManagmentRFPDetailPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: salesManagmentRFIDetailPage,
      path: '/SalesManagmentRFIDetailPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        final person = state.extra as Person;

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'rfiId': id}),
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: const SalesManagmentRFIDetailPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: salesManagmentRFQDetailPage,
      path: '/SalesManagmentRFQDetailPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        //  final person = state.extra as Person;

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'rfqId': id}),
            // personProvider
            //     .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: const SalesManagmentRFQDetailPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: serviceManagmentRFIDetailPage,
      path: '/ServiceManagmentRFIDetailPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'rfiId': id}),
          ],
          child: const ServiceManagmentRFIDetailPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: serviceManagmentRFPDetailPage,
      path: '/ServiceManagmentRFPDetailPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'rfpId': id}),
          ],
          child: const ServiceManagmentRFPDetailPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),

    GoRoute(
      name: notificationsScreen,
      path: '/NotificationsScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: const NotificationsScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: sendRFIResponseView,
      path: '/SendRFIResponseView/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final person = state.extra as Person;

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'rfiId': id}),
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: const SendRFIResponseView(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: sendRFQResponse,
      path: '/SendRFQResponse',
      // builder: (context, state) {
      //   return SendResponseView();
      // },

      pageBuilder: (context, state) {
        // final person = state.extra as Person;
        const page = ProviderScope(
          // overrides: [
          // personProvider
          //     .overrideWith((ref) => PersonController()..setPerson(person)),

          //  ],
          child: SendRFQResponse(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: sendRFPResponse,
      path: '/SendRFPResponse',
      // builder: (context, state) {
      //   return SendResponseView();
      // },

      pageBuilder: (context, state) {
        // final person = state.extra as Person;
        const page = ProviderScope(
          // overrides: [
          // personProvider
          //     .overrideWith((ref) => PersonController()..setPerson(person)),

          //  ],
          child: SendRFPResponse(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),

    GoRoute(
      name: orderPlacementScreen,
      path: '/OrderPlacementScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: const OrderPlacementScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: attendanceManagmentScreen,
      path: '/AttendanceManagmentScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: AttendanceManagmentScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    // GoRoute(
    //   name: approvalManagmentScreen,
    //   path: '/ApprovalManagmentScreen',
    //   pageBuilder: (context, state) {
    //     final person = state.extra as Person;

    //     final page = ProviderScope(
    //       overrides: [
    //         personProvider
    //             .overrideWith((ref) => PersonController()..setPerson(person)),
    //       ],
    //       child: const ApprovalManagmentScreen(),
    //     );
    //     return buildPageWithFadeTransition(
    //         fullscreenDialog: false,
    //         context: context,
    //         state: state,
    //         child: page);
    //   },
    // ),
    GoRoute(
      name: approvalManagmentScreen,
      path: '/ApprovalManagmentScreen',
      pageBuilder: (context, state) {
        final args = state.extra as ApprovalScreenArgs;
        final page = ProviderScope(
          overrides: [
            personProvider.overrideWith(
                (ref) => PersonController()..setPerson(args.person)),
          ],
          child: ApprovalManagmentScreen(showBackButton: args.showBackButton),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),

    GoRoute(
      name: leaveManagmentScreen,
      path: '/LeaveManagmentScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;

        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: LeaveManagmentScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),

    GoRoute(
      name: generatedOtpPage,
      path: '/GeneratedOtpPage',
      pageBuilder: (context, state) {
        const page = GeneratedOtpPage();
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: salaryPaySlipScreen,
      path: '/SalaryPaySlipScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: SalaryPaySlipScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: leaveCreateScreen,
      path: '/LeaveCreateScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: LeaveCreateScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),

    GoRoute(
      name: salaryPaySlipDetailPage,
      path: '/SalaryPaySlipDetailPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'sId': id}),
          ],
          child: const SalaryPaySlipDetailPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: apprisalScreen,
      path: '/ApprisalScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: ApprisalScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: userManagementScreen,
      path: '/UserManagementScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: UserManagementScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),

    GoRoute(
      name: invoiceManagementScreen,
      path: '/InvoiceManagementScreen',
      pageBuilder: (context, state) {
        final page = InvoiceManagementScreen();
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),

    GoRoute(
      name: invoiceManagementDetailPage,
      path: '/InvoiceManagementDetailPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'invoiceId': id}),
          ],
          child: const InvoiceManagementDetailPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: generalInformationPage,
      path: '/GeneralInformationPage',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: GeneralInformationPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: approvalAuthorityScreen,
      path: '/ApprovalAuthorityScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: ApprovalAuthorityScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: approvalAuthorityCreateScreen,
      path: '/ApprovalAuthorityCreateScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: ApprovalAuthorityCreateScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),

    GoRoute(
      name: companyPolicyScreen,
      path: '/CompanyPolicyScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: CompanyPolicyScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: eventScreen,
      path: '/EventScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: EventScreen(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: holidaysScreen,
      path: '/HolidaysScreen',
      pageBuilder: (context, state) {
        final person = state.extra as Person;
        final page = ProviderScope(
          overrides: [
            personProvider
                .overrideWith((ref) => PersonController()..setPerson(person)),
          ],
          child: HolidaysScreen(),
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
    transitionDuration: const Duration(milliseconds: 500),
    fullscreenDialog: fullscreenDialog,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child),
  );
}
