import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start MyBillionsApiGroup Group Code

class MyBillionsApiGroupGroup {
  static String baseUrl = 'http://beta.mybillions.in/platform/API/api/';
  static Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
  };
  static SignInCall signInCall = SignInCall();
  static DashboardCall dashboardCall = DashboardCall();
  static PerformanceReportDataCall performanceReportDataCall =
      PerformanceReportDataCall();
  static RecommendationsDataCall recommendationsDataCall =
      RecommendationsDataCall();
  static SignUpCall signUpCall = SignUpCall();
  static ForgotPasswordCall forgotPasswordCall = ForgotPasswordCall();
  static ResetPasswordCall resetPasswordCall = ResetPasswordCall();
  static ReportsPfDropdownCall reportsPfDropdownCall = ReportsPfDropdownCall();
  static GetProfileCall getProfileCall = GetProfileCall();
  static ClientManagementCall clientManagementCall = ClientManagementCall();
  static FeesDetailsCall feesDetailsCall = FeesDetailsCall();
  static DownloadInvoiceCall downloadInvoiceCall = DownloadInvoiceCall();
}

class SignInCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'sign in',
      apiUrl:
          '${MyBillionsApiGroupGroup.baseUrl}Customers/FnValidateCustomerByMail',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'Email': email,
        'Password': password,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  int? customerId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.customer.CustomerID''',
      ));
  String? emailId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer.EmailID''',
      ));
  String? fullName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer.FullName''',
      ));
  String? mobile(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer.Mobile''',
      ));
}

class DashboardCall {
  Future<ApiCallResponse> call({
    int? customerId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'dashboard',
      apiUrl: '${MyBillionsApiGroupGroup.baseUrl}Customers/GetCustomersAllPlan',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'customerID': customerId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<double>? currentAmountList(dynamic response) => (getJsonField(
        response,
        r'''$.cps[:].CurrentAmount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? appreciationList(dynamic response) => (getJsonField(
        response,
        r'''$.cps[:].Appreciation''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  double? xirr(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.totalAverageReturn''',
      ));
  List? cps(dynamic response) => getJsonField(
        response,
        r'''$.cps''',
        true,
      ) as List?;
  List<String>? planName(dynamic response) => (getJsonField(
        response,
        r'''$.cps[:].PlanName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PerformanceReportDataCall {
  Future<ApiCallResponse> call({
    String? customerId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'performanceReportData',
      apiUrl:
          '${MyBillionsApiGroupGroup.baseUrl}PerformanceReport/GetperformanceReportData',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'customerId': customerId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic? portfoilio(dynamic response) => getJsonField(
        response,
        r'''$.Portfolio''',
      );
  double? portfolioWeek(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.Portfolio.WEEK1''',
      ));
  double? portfolio15Days(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.Portfolio.C15DAYS''',
      ));
  double? portfolio1stMonth(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.Portfolio.C1MONTH''',
      ));
  double? portfolio3Month(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.Portfolio.C3MONTH''',
      ));
  double? portfolio6Month(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.Portfolio.C6MONTH''',
      ));
  double? portfolioYear(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.Portfolio.C1YEAR''',
      ));
  dynamic? nifty(dynamic response) => getJsonField(
        response,
        r'''$.Nifty''',
      );
  double? niftyWeek(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.Nifty.WEEK1''',
      ));
  double? nifty15Days(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.Nifty.C15DAYS''',
      ));
  double? nifty1Month(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.Nifty.C1MONTH''',
      ));
  double? nifty3Month(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.Nifty.C3MONTH''',
      ));
  double? nifty6Month(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.Nifty.C6MONTH''',
      ));
  double? nifty1Year(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.Nifty.C1YEAR''',
      ));
  dynamic? returnPerf(dynamic response) => getJsonField(
        response,
        r'''$.ReturnPerformance''',
      );
  double? returnPerf1Week(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.ReturnPerformance.WEEK1''',
      ));
  double? returnPerf15Days(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.ReturnPerformance.C15DAYS''',
      ));
  double? returnPerf1Month(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.ReturnPerformance.C1MONTH''',
      ));
  double? returnPerf3Month(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.ReturnPerformance.C3MONTH''',
      ));
  double? returnPerf6Month(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.ReturnPerformance.C6MONTH''',
      ));
  double? returnPerf1Year(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.ReturnPerformance.C1YEAR''',
      ));
  String? evalDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.EvaluationDate''',
      ));
}

class RecommendationsDataCall {
  Future<ApiCallResponse> call({
    int? customerId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'recommendationsData',
      apiUrl:
          '${MyBillionsApiGroupGroup.baseUrl}Customers/GetFundRecommendations',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'customerId': customerId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? recList(dynamic response) => getJsonField(
        response,
        r'''$.RecommendationList''',
        true,
      ) as List?;
  List<String>? schemeList(dynamic response) => (getJsonField(
        response,
        r'''$.RecommendationList[:].SchemeName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? newSchemeList(dynamic response) => (getJsonField(
        response,
        r'''$.RecommendationList[:].NewSchemeName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? expiryList(dynamic response) => (getJsonField(
        response,
        r'''$.RecommendationList[:].ExpiryDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? planNameList(dynamic response) => (getJsonField(
        response,
        r'''$.RecommendationList[:].GoalID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? unitList(dynamic response) => (getJsonField(
        response,
        r'''$.RecommendationList[:].Unit''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? typeList(dynamic response) => (getJsonField(
        response,
        r'''$.RecommendationList[:].TransactionType''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? amuontList(dynamic response) => (getJsonField(
        response,
        r'''$.RecommendationList[:].Amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? remarksList(dynamic response) => (getJsonField(
        response,
        r'''$.RecommendationList[:].Remarks''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class SignUpCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? countryCode = '91',
    String? mobileNumber = '',
    String? password = '',
    String? fullName = '',
    String? agentCode = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'sign up',
      apiUrl: '${MyBillionsApiGroupGroup.baseUrl}Customers/FnRegisterCustomer',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'Email': email,
        'MobileNumber': mobileNumber,
        'CountryCode': countryCode,
        'Password': password,
        'FullName': fullName,
        'agentCode': agentCode,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  int? customerId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.customer.CustomerID''',
      ));
  String? responseCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ResponseStatusCode''',
      ));
  String? responseMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ResponseMessage''',
      ));
  String? customerEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer.EmailID''',
      ));
  String? customerMobile(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer.Mobile''',
      ));
  String? customerFullName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer.FullName''',
      ));
}

class ForgotPasswordCall {
  Future<ApiCallResponse> call({
    String? loginID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'forgot password',
      apiUrl: '${MyBillionsApiGroupGroup.baseUrl}Customers/VerifyLoginID',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'LoginID': loginID,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? responseMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ResponseMessage''',
      ));
  String? responseCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ResponseStatusCode''',
      ));
}

class ResetPasswordCall {
  Future<ApiCallResponse> call({
    String? securitycode = '',
    String? email = '',
    String? newPassword = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'reset password',
      apiUrl: '${MyBillionsApiGroupGroup.baseUrl}Customers/FnForgotPassword',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'securitycode': securitycode,
        'Email': email,
        'newPassword': newPassword,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? responseCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ResponseStatusCode''',
      ));
  String? responseMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.ResponseMessage''',
      ));
}

class ReportsPfDropdownCall {
  Future<ApiCallResponse> call({
    int? customerID,
    String? startDate = '16/01/2019',
    String? endDate = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'reports  pf dropdown',
      apiUrl:
          '${MyBillionsApiGroupGroup.baseUrl}Report/getDefaultDatForPortfolioReport',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'customerID': customerID,
        'startDate': startDate,
        'endDate': endDate,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? investorNames(dynamic response) => (getJsonField(
        response,
        r'''$.InvestorLists[:].Name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customerPlanName(dynamic response) => (getJsonField(
        response,
        r'''$.customerPlanLists[:].PlanName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? investorLists(dynamic response) => getJsonField(
        response,
        r'''$.InvestorLists''',
        true,
      ) as List?;
  List? customerPlanLists(dynamic response) => getJsonField(
        response,
        r'''$.customerPlanLists''',
        true,
      ) as List?;
}

class GetProfileCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get profile',
      apiUrl: '${MyBillionsApiGroupGroup.baseUrl}Customers/GetCustomer',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'id': id,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  int? customerID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.customer.CustomerID''',
      ));
  String? emailID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer.EmailID''',
      ));
  String? fullName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer.FullName''',
      ));
  String? membershipType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer.MembershipPlanCode''',
      ));
  String? mobile(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer.Mobile''',
      ));
  String? residencyStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer.ResidencyStatus''',
      ));
  String? taxBracket(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer.TaxBracket''',
      ));
  String? membershipModel(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer.MembershipPlanOption''',
      ));
  String? memberSince(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.customer.UpdateDateTime''',
      ));
  int? risk(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.customer.RiskRating''',
      ));
}

class ClientManagementCall {
  Future<ApiCallResponse> call({
    int? customerId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'client management',
      apiUrl:
          '${MyBillionsApiGroupGroup.baseUrl}Customers/GetCustomersInvestors',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'customerId': customerId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? investors(dynamic response) => getJsonField(
        response,
        r'''$.Investors''',
        true,
      ) as List?;
  List<String>? clientCodeLIst(dynamic response) => (getJsonField(
        response,
        r'''$.Investors[:].ClientCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? bankName(dynamic response) => (getJsonField(
        response,
        r'''$.bankMaster[:].BankName''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FeesDetailsCall {
  Future<ApiCallResponse> call({
    String? customerId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Fees Details',
      apiUrl:
          '${MyBillionsApiGroupGroup.baseUrl}Report/FeereportCustomer?customerId=${customerId}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? invoicerept(dynamic response) => getJsonField(
        response,
        r'''$.invoicerept''',
        true,
      ) as List?;
}

class DownloadInvoiceCall {
  Future<ApiCallResponse> call({
    int? invoiceNumber,
    int? customerId,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'download invoice',
      apiUrl: '${MyBillionsApiGroupGroup.baseUrl}Fee/GenerateInvoice',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'InvoiceNumber': invoiceNumber,
        'customerId': customerId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? link(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$''',
      ));
}

/// End MyBillionsApiGroup Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
