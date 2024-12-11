// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PortfolioFilterModelStruct extends BaseStruct {
  PortfolioFilterModelStruct({
    List<InvestorModelStruct>? investorLists,
    List<CustomerPlanModelStruct>? customerPlanLists,
    String? responseStatusCode,
  })  : _investorLists = investorLists,
        _customerPlanLists = customerPlanLists,
        _responseStatusCode = responseStatusCode;

  // "InvestorLists" field.
  List<InvestorModelStruct>? _investorLists;
  List<InvestorModelStruct> get investorLists => _investorLists ?? const [];
  set investorLists(List<InvestorModelStruct>? val) => _investorLists = val;

  void updateInvestorLists(Function(List<InvestorModelStruct>) updateFn) {
    updateFn(_investorLists ??= []);
  }

  bool hasInvestorLists() => _investorLists != null;

  // "customerPlanLists" field.
  List<CustomerPlanModelStruct>? _customerPlanLists;
  List<CustomerPlanModelStruct> get customerPlanLists =>
      _customerPlanLists ?? const [];
  set customerPlanLists(List<CustomerPlanModelStruct>? val) =>
      _customerPlanLists = val;

  void updateCustomerPlanLists(
      Function(List<CustomerPlanModelStruct>) updateFn) {
    updateFn(_customerPlanLists ??= []);
  }

  bool hasCustomerPlanLists() => _customerPlanLists != null;

  // "ResponseStatusCode" field.
  String? _responseStatusCode;
  String get responseStatusCode => _responseStatusCode ?? '';
  set responseStatusCode(String? val) => _responseStatusCode = val;

  bool hasResponseStatusCode() => _responseStatusCode != null;

  static PortfolioFilterModelStruct fromMap(Map<String, dynamic> data) =>
      PortfolioFilterModelStruct(
        investorLists: getStructList(
          data['InvestorLists'],
          InvestorModelStruct.fromMap,
        ),
        customerPlanLists: getStructList(
          data['customerPlanLists'],
          CustomerPlanModelStruct.fromMap,
        ),
        responseStatusCode: data['ResponseStatusCode'] as String?,
      );

  static PortfolioFilterModelStruct? maybeFromMap(dynamic data) => data is Map
      ? PortfolioFilterModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'InvestorLists': _investorLists?.map((e) => e.toMap()).toList(),
        'customerPlanLists': _customerPlanLists?.map((e) => e.toMap()).toList(),
        'ResponseStatusCode': _responseStatusCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'InvestorLists': serializeParam(
          _investorLists,
          ParamType.DataStruct,
          isList: true,
        ),
        'customerPlanLists': serializeParam(
          _customerPlanLists,
          ParamType.DataStruct,
          isList: true,
        ),
        'ResponseStatusCode': serializeParam(
          _responseStatusCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static PortfolioFilterModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PortfolioFilterModelStruct(
        investorLists: deserializeStructParam<InvestorModelStruct>(
          data['InvestorLists'],
          ParamType.DataStruct,
          true,
          structBuilder: InvestorModelStruct.fromSerializableMap,
        ),
        customerPlanLists: deserializeStructParam<CustomerPlanModelStruct>(
          data['customerPlanLists'],
          ParamType.DataStruct,
          true,
          structBuilder: CustomerPlanModelStruct.fromSerializableMap,
        ),
        responseStatusCode: deserializeParam(
          data['ResponseStatusCode'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PortfolioFilterModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PortfolioFilterModelStruct &&
        listEquality.equals(investorLists, other.investorLists) &&
        listEquality.equals(customerPlanLists, other.customerPlanLists) &&
        responseStatusCode == other.responseStatusCode;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([investorLists, customerPlanLists, responseStatusCode]);
}

PortfolioFilterModelStruct createPortfolioFilterModelStruct({
  String? responseStatusCode,
}) =>
    PortfolioFilterModelStruct(
      responseStatusCode: responseStatusCode,
    );
