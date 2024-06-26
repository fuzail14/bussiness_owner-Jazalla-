import 'package:bussines_owner/Module/Calendar/View/calendar_screen.dart';
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
import '../Module/Announcement/View/announcement_view.dart';
import '../Module/Apprisal/View/apprisal_view.dart';
import '../Module/Approval Authority/Create/View/approval_authority_create_view.dart';
import '../Module/Approval Authority/Main/View/approval_authority_view.dart';
import '../Module/Approval Managment/Main/View/approval_managment_screen.dart';
import '../Module/Attendance Managment/View/attendance_managment_view.dart';
import '../Module/Award/View/award_view.dart';
import '../Module/BussinesCommunity/Detail/View/bussines_community_detail_page.dart';
import '../Module/BussinesCommunity/Main/View/bussines_communities_screen.dart';
import '../Module/BussinesForSale/Main/View/sale_bussines_screen.dart';
import '../Module/Company Policy/View/company_policy_view.dart';
import '../Module/Complaints/View/complaints_view.dart';
import '../Module/Dynamic Modules/Accounting Manager Module/View/accounting_manager_module_screen.dart';
import '../Module/Dynamic Modules/HR Manager Module/View/Hr_manager_module_screen.dart';
import '../Module/Dynamic Modules/Procurement Manager Module/View/procurement_manager_module_screen.dart';
import '../Module/Dynamic Modules/Project Manager Module/View/project_manager_module_screen.dart';
import '../Module/Dynamic Modules/Sales Manager Module/View/sales_manager_module_screen.dart';
import '../Module/Dynamic Modules/Service Manager Module/View/service_manager_module_screen.dart';
import '../Module/Employee Information/Detail/EmployeeInformationDetail/View/employee_information_detail_page.dart';
import '../Module/Employee Information/Main/View/employee_information_view.dart';
import '../Module/EmployeesAsset/View/employees_asset_view.dart';
import '../Module/Event/View/event_view.dart';
import '../Module/General Information/View/general_information_page.dart';
import '../Module/GeneralServices/RequestProposal/View/request_proposal_page.dart';
import '../Module/GeneralServices/SendInquiry/View/service_send_inquiry_page.dart';
import '../Module/GeneratedOtpScreen/view/generated_otp_screen.dart';
import '../Module/Holidays/View/holidays_view.dart';
import '../Module/Hr Management Module/Payroll Mangement Hr/Manage Salary/Main/View/manage_salary_main_hr_view.dart';
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
import '../Module/Procurement Management Module/Bid Management Procurement/BidResponseRecieve/View/bid_procurement_response_recieve_view.dart';
import '../Module/Procurement Management Module/Bid Management Procurement/Detail/View/bid_management_procurement_detail_page.dart';
import '../Module/Procurement Management Module/Bid Management Procurement/Main/View/bid_management_procurement_view.dart';
import '../Module/Procurement Management Module/Contract Management Procurement/Main/View/contract_management_procurement_view.dart';
import '../Module/Procurement Management Module/Inventory Management Procurement/Main/View/inventory_management_procurement_view.dart';
import '../Module/Procurement Management Module/InvoiceManagement Procurement/Detail/View/invoice_management_detail_procurement_page.dart';
import '../Module/Procurement Management Module/InvoiceManagement Procurement/Main/View/invoice_management_procurement_view.dart';
import '../Module/Procurement Management Module/Order Management Procurement/Detail/View/order_management_detail_page.dart';
import '../Module/Procurement Management Module/Order Management Procurement/Main/View/order_management_procurement_view.dart';
import '../Module/Procurement Management Module/SpendAnalytics/View/spend_analytics_procurement_page.dart';
import '../Module/Procurement Management Module/Vendor Management/Supplier Management/Main/View/supplier_management_mainpage_screen.dart';
import '../Module/ProcurementManagment/RFI/RfxManagmentRFIDetail/View/rfx_managment_rfi_detail_page.dart';
import '../Module/ProcurementManagment/RFI/Main/View/procurement_soi_screen.dart';
import '../Module/ProcurementManagment/RFP/Main/View/procurement_rfp_screen.dart';
import '../Module/ProcurementManagment/RFP/RFXManagmentRFPDetail/View/rfx_managment_rfp_detail_page.dart';
import '../Module/ProcurementManagment/RFQ/Main/View/procurement_rfq_screen.dart';
import '../Module/ProcurementManagment/RFQ/RFXManagmentRFQDetail/View/rfx_managment_rfq_detail_page.dart';
import '../Module/Profile/View/profile_page.dart';
import '../Module/Promotion/View/promotion_view.dart';
import '../Module/Registration/View/registration_view.dart';
import '../Module/SalaryPaySlip/Main/View/salary_payslip_view.dart';
import '../Module/SalaryPaySlip/PaySlipDetail/View/salary_payslip_detail_page.dart';
import '../Module/Sales Management Module/Bid Management Sales/BidResponseRecieve/View/bid_sales_response_recieve_view.dart';
import '../Module/Sales Management Module/Bid Management Sales/Detail/View/bid_management_sales_detail_page.dart';
import '../Module/Sales Management Module/Bid Management Sales/Main/View/bid_management_sales_view.dart';
import '../Module/Sales Management Module/Client Management Sales/Main/View/client_management_mainpage_screen.dart';
import '../Module/Sales Management Module/Inventory Management Sales/Main/View/inventory_management_sales_view.dart';
import '../Module/Sales Management Module/InvoiceManagement Sales/Detail/View/invoice_management_detail_sales_page.dart';
import '../Module/Sales Management Module/InvoiceManagement Sales/Main/View/invoice_management_sales_view.dart';
import '../Module/Sales Management Module/Order Management Sales/Detail/View/order_management_detail_sales_page.dart';
import '../Module/Sales Management Module/Order Management Sales/Main/View/order_management_sales_view.dart';
import '../Module/Sales Management Module/ProductCatalouge Sales/Product Catalouge/View/product_catalouge_sales_screen.dart';
import '../Module/Sales Management Module/ProductCatalouge Sales/ProductCatalougeDetail/View/product_catalouge_detail_sales_page.dart';
import '../Module/SalesManagment/RFIMain/RFI/View/sales_managment_rfi_screen.dart';
import '../Module/SalesManagment/RFIMain/SalesManagmentRFIDetail/View/sales_managment_rfi_detail_page.dart';
import '../Module/SalesManagment/RFIMain/SendRFIResponse/View/send_rfi_response.dart';
import '../Module/SalesManagment/RFQMain/RFQ/View/sales_managment_rfq_screen.dart';
import '../Module/SalesManagment/RFQMain/SalesManagmentRFQDetail/View/sales_managment_rfq_detail_page.dart';
import '../Module/SalesManagment/RFQMain/SendRfqResponse/View/send_rfq_response.dart';
import '../Module/Service Management Module/Bid Management Service/BidResponseRecieve/View/bid_service_response_recieve_view.dart';
import '../Module/Service Management Module/Bid Management Service/Detail/View/bid_management_service_detail_page.dart';
import '../Module/Service Management Module/Bid Management Service/Main/View/bid_management_service_view.dart';
import '../Module/Service Management Module/Client Management Service/Main/View/client_management_mainpage_service_screen.dart';
import '../Module/Service Management Module/Contract Management Service/Main/View/contract_management_service_view.dart';
import '../Module/Service Management Module/InvoiceManagement Service/Detail/View/invoice_management_detail_service_page.dart';
import '../Module/Service Management Module/InvoiceManagement Service/Main/View/invoice_management_service_view.dart';
import '../Module/Service Management Module/ServicesCatalouge/Detail/View/service_catalouge_detail_page.dart';
import '../Module/Service Management Module/ServicesCatalouge/Services/View/services_catalouge_screen.dart';
import '../Module/ServiceManagment/RFIMain/RFI/View/service_managment_rfi_screen.dart';
import '../Module/ServiceManagment/RFIMain/ServiceManagmentRFIDetail/View/service_managment_rfi_detail_page.dart';
import '../Module/ServiceManagment/RFPMain/RFP/View/service_managment_rfp_screen.dart';
import '../Module/ServiceManagment/RFPMain/SendRFPResponse/View/send_rfp_response.dart';
import '../Module/ServiceManagment/RFPMain/ServiceManagmentRFPDetail/View/service_managment_rfp_detail_page.dart';
import '../Module/Tenders/TenderMain/View/tenders_screen.dart';
import '../Module/Tenders/TendersResponse/View/tender_response_page.dart';
import '../Module/Termination/View/termination_view.dart';
import '../Module/Transfer/View/transfer_view.dart';
import '../Module/Trip/View/trip_view.dart';
import '../Module/UserManagment/View/user_management_view.dart';
import '../Module/Procurement Management Module/Vendor Management/MainTabPage/View/vendor_management_maintabpage_screen.dart';
import '../Module/Warning/View/warning_view.dart';
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
        const page = OnlineStoreScreen();
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
        const page = TendersView();
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

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'tenderId': id}),
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
        const page = GeneralServiceView();
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
        const page = BussinesForSale();
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
        const page = InvestMentOpportunityView();
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
        final page = NotificationsScreen();
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
        const page = OrderPlacementScreen();

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
        final page = AttendanceManagmentScreen();
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
        final page = ApprovalManagmentScreen();

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
        final page = LeaveManagmentScreen();

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
        final page = SalaryPaySlipScreen();
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
        final page = ApprisalScreen();
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
        final page = UserManagementScreen();
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
        const page = GeneralInformationPage();
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
        final page = ApprovalAuthorityScreen();
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
        final page = ApprovalAuthorityCreateScreen();
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
        final page = CompanyPolicyScreen();
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
        final page = HolidaysScreen();
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: profilePage,
      path: '/ProfilePage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final bearerToken = state.extra as String;
        final page = ProviderScope(
          overrides: [
            routeArgsProvider
                .overrideWithValue({'Id': id, 'bearerToken': bearerToken}),
          ],
          child: ProfilePage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: calendarScreen,
      path: '/CalendarScreen',
      pageBuilder: (context, state) {
        final page = CalendarScreen();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: procurementManagerModuleScreen,
      path: '/ProcurementManagerModuleScreen',
      pageBuilder: (context, state) {
        const page = ProcurementManagerModuleScreen();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: salesManagerModuleScreen,
      path: '/SalesManagerModuleScreen',
      pageBuilder: (context, state) {
        const page = SalesManagerModuleScreen();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: serviceManagerModuleScreen,
      path: '/ServiceManagerModuleScreen',
      pageBuilder: (context, state) {
        const page = ServiceManagerModuleScreen();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),

    GoRoute(
      name: hrManagerModuleScreen,
      path: '/HrManagerModuleScreen',
      pageBuilder: (context, state) {
        const page = HrManagerModuleScreen();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: accountingManagerModuleScreen,
      path: '/AccountingManagerModuleScreen',
      pageBuilder: (context, state) {
        const page = AccountingManagerModuleScreen();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: projectManagerModuleScreen,
      path: '/ProjectManagerModuleScreen',
      pageBuilder: (context, state) {
        const page = ProjectManagerModuleScreen();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: employeeInformationView,
      path: '/EmployeeInformationView',
      pageBuilder: (context, state) {
        final page = EmployeeInformationView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: awardView,
      path: '/AwardView',
      pageBuilder: (context, state) {
        final page = AwardView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: transferView,
      path: '/TransferView',
      pageBuilder: (context, state) {
        final page = TransferView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: registrationView,
      path: '/RegistrationView',
      pageBuilder: (context, state) {
        final page = RegistrationView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: tripView,
      path: '/TripView',
      pageBuilder: (context, state) {
        final page = TripView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: promotionView,
      path: '/PromotionView',
      pageBuilder: (context, state) {
        final page = PromotionView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: complaintsView,
      path: '/ComplaintsView',
      pageBuilder: (context, state) {
        final page = ComplaintsView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: warningView,
      path: '/WarningView',
      pageBuilder: (context, state) {
        final page = WarningView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: terminationView,
      path: '/TerminationView',
      pageBuilder: (context, state) {
        final page = TerminationView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: announcementView,
      path: '/AnnouncementView',
      pageBuilder: (context, state) {
        final page = AnnouncementView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: employeesAssetView,
      path: '/EmployeesAssetView',
      pageBuilder: (context, state) {
        final page = EmployeesAssetView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: employeeInformationDetailView,
      path: '/EmployeeInformationDetailView/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({
              'Id': id,
            }),
          ],
          child: EmployeeInformationDetailView(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: vendorManagementMainTabPage,
      path: '/VendorManagementMainTabPage',
      pageBuilder: (context, state) {
        const page = VendorManagementMainTabPage();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: bidManagementProcurementView,
      path: '/BidManagementProcurementView',
      pageBuilder: (context, state) {
        final page = BidManagementProcurementView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: bidManagementProcurementDetailPage,
      path: '/BidManagementProcurementDetailPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'invoiceId': id}),
          ],
          child: const BidManagementProcurementDetailPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: bidProcurementResponseRecieveView,
      path: '/BidProcurementResponseRecieveView/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'invoiceId': id}),
          ],
          child: BidProcurementResponseRecieveView(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: orderManagementProcurementView,
      path: '/OrderManagementProcurementView',
      pageBuilder: (context, state) {
        final page = OrderManagementProcurementView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: inventoryManagementProcurementView,
      path: '/InventoryManagementProcurementView',
      pageBuilder: (context, state) {
        final page = InventoryManagementProcurementView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: contractManagementProcurementView,
      path: '/ContractManagementProcurementView',
      pageBuilder: (context, state) {
        final page = ContractManagementProcurementView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),

    GoRoute(
      name: orderManagementDetailPage,
      path: '/OrderManagementDetailPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'invoiceId': id}),
          ],
          child: const OrderManagementDetailPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: invoiceManagementProcurementView,
      path: '/InvoiceManagementProcurementView',
      pageBuilder: (context, state) {
        final page = InvoiceManagementProcurementView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: invoiceManagementDetailProcurementPage,
      path: '/InvoiceManagementDetailProcurementPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'invoiceId': id}),
          ],
          child: const InvoiceManagementDetailProcurementPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),

    GoRoute(
      name: bidManagementSalesView,
      path: '/BidManagementSalesView',
      pageBuilder: (context, state) {
        final page = BidManagementSalesView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: bidManagementSalesDetailPage,
      path: '/BidManagementSalesDetailPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'invoiceId': id}),
          ],
          child: const BidManagementSalesDetailPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: bidSalesResponseRecieveView,
      path: '/BidSalesResponseRecieveView/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'invoiceId': id}),
          ],
          child: BidSalesResponseRecieveView(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),

    GoRoute(
      name: orderManagementSalesView,
      path: '/OrderManagementSalesView',
      pageBuilder: (context, state) {
        final page = OrderManagementSalesView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),

    GoRoute(
      name: orderManagementDetailSalesPage,
      path: '/OrderManagementDetailSalesPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'invoiceId': id}),
          ],
          child: OrderManagementDetailSalesPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: inventoryManagementSalesView,
      path: '/InventoryManagementSalesView',
      pageBuilder: (context, state) {
        final page = InventoryManagementSalesView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: invoiceManagementSalesView,
      path: '/InvoiceManagementSalesView',
      pageBuilder: (context, state) {
        final page = InvoiceManagementSalesView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),

    GoRoute(
      name: invoiceManagementDetailSalesPage,
      path: '/InvoiceManagementDetailSalesPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'invoiceId': id}),
          ],
          child: const InvoiceManagementDetailSalesPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: bidManagementServiceView,
      path: '/BidManagementServiceView',
      pageBuilder: (context, state) {
        final page = BidManagementServiceView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: bidManagementServiceDetailPage,
      path: '/BidManagementServiceDetailPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'invoiceId': id}),
          ],
          child: const BidManagementServiceDetailPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: bidServiceResponseRecieveView,
      path: '/BidServiceResponseRecieveView/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'invoiceId': id}),
          ],
          child: BidServiceResponseRecieveView(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: contractManagementServiceView,
      path: '/ContractManagementServiceView',
      pageBuilder: (context, state) {
        final page = ContractManagementServiceView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: invoiceManagementServiceView,
      path: '/InvoiceManagementServiceView',
      pageBuilder: (context, state) {
        final page = InvoiceManagementServiceView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: invoiceManagementDetailServicePage,
      path: '/InvoiceManagementDetailServicePage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'invoiceId': id}),
          ],
          child: const InvoiceManagementDetailServicePage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: supplierManagementTabPage,
      path: '/ClientManagementMainTabPage',
      pageBuilder: (context, state) {
        const page = ClientManagementMainTabPage();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: productCatalougeSalesScreen,
      path: '/ProductCatalougeSalesScreen',
      pageBuilder: (context, state) {
        const page = ProductCatalougeSalesScreen();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),

    GoRoute(
      name: productCatalougeDetailSalesPage,
      path: '/ProductCatalougeDetailSalesPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'productId': id}),
          ],
          child: const ProductCatalougeDetailSalesPage(),
        );
        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: clientManagementServiceMainTabPage,
      path: '/ClientManagementServiceMainTabPage',
      pageBuilder: (context, state) {
        const page = ClientManagementServiceMainTabPage();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: serviceCatalougeView,
      path: '/serviceCatalougeView',
      pageBuilder: (context, state) {
        const page = ServiceCatalougeView();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),

    GoRoute(
      name: serviceCatalougeDetailPage,
      path: '/ServiceCatalougeDetailPage/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        final page = ProviderScope(
          overrides: [
            routeArgsProvider.overrideWithValue({'serviceId': id}),
          ],
          child: const ServiceCatalougeDetailPage(),
        );

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: spendAnalyticsProcurementPage,
      path: '/SpendAnalyticsProcurementPage',
      pageBuilder: (context, state) {
        const page = SpendAnalyticsProcurementPage();

        return buildPageWithFadeTransition(
            fullscreenDialog: false,
            context: context,
            state: state,
            child: page);
      },
    ),
    GoRoute(
      name: manageSalaryMainHrView,
      path: '/ManageSalaryMainHrView',
      pageBuilder: (context, state) {
        final page = ManageSalaryMainHrView();

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
