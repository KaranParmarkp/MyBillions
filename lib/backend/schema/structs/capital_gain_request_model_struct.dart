// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CapitalGainRequestModelStruct extends BaseStruct {
  CapitalGainRequestModelStruct({
    int? customerId,
    int? investorID,
    String? category,
    String? term,
    String? fYear,
  })  : _customerId = customerId,
        _investorID = investorID,
        _category = category,
        _term = term,
        _fYear = fYear;

  // "CustomerId" field.
  int? _customerId;
  int get customerId => _customerId ?? 0;
  set customerId(int? val) => _customerId = val;

  void incrementCustomerId(int amount) => customerId = customerId + amount;

  bool hasCustomerId() => _customerId != null;

  // "InvestorID" field.
  int? _investorID;
  int get investorID => _investorID ?? 0;
  set investorID(int? val) => _investorID = val;

  void incrementInvestorID(int amount) => investorID = investorID + amount;

  bool hasInvestorID() => _investorID != null;

  // "Category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "Term" field.
  String? _term;
  String get term => _term ?? '';
  set term(String? val) => _term = val;

  bool hasTerm() => _term != null;

  // "FYear" field.
  String? _fYear;
  String get fYear => _fYear ?? '0';
  set fYear(String? val) => _fYear = val;

  bool hasFYear() => _fYear != null;

  static CapitalGainRequestModelStruct fromMap(Map<String, dynamic> data) =>
      CapitalGainRequestModelStruct(
        customerId: castToType<int>(data['CustomerId']),
        investorID: castToType<int>(data['InvestorID']),
        category: data['Category'] as String?,
        term: data['Term'] as String?,
        fYear: data['FYear'] as String?,
      );

  static CapitalGainRequestModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? CapitalGainRequestModelStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'CustomerId': _customerId,
        'InvestorID': _investorID,
        'Category': _category,
        'Term': _term,
        'FYear': _fYear,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'CustomerId': serializeParam(
          _customerId,
          ParamType.int,
        ),
        'InvestorID': serializeParam(
          _investorID,
          ParamType.int,
        ),
        'Category': serializeParam(
          _category,
          ParamType.String,
        ),
        'Term': serializeParam(
          _term,
          ParamType.String,
        ),
        'FYear': serializeParam(
          _fYear,
          ParamType.String,
        ),
      }.withoutNulls;

  static CapitalGainRequestModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CapitalGainRequestModelStruct(
        customerId: deserializeParam(
          data['CustomerId'],
          ParamType.int,
          false,
        ),
        investorID: deserializeParam(
          data['InvestorID'],
          ParamType.int,
          false,
        ),
        category: deserializeParam(
          data['Category'],
          ParamType.String,
          false,
        ),
        term: deserializeParam(
          data['Term'],
          ParamType.String,
          false,
        ),
        fYear: deserializeParam(
          data['FYear'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CapitalGainRequestModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CapitalGainRequestModelStruct &&
        customerId == other.customerId &&
        investorID == other.investorID &&
        category == other.category &&
        term == other.term &&
        fYear == other.fYear;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([customerId, investorID, category, term, fYear]);
}

CapitalGainRequestModelStruct createCapitalGainRequestModelStruct({
  int? customerId,
  int? investorID,
  String? category,
  String? term,
  String? fYear,
}) =>
    CapitalGainRequestModelStruct(
      customerId: customerId,
      investorID: investorID,
      category: category,
      term: term,
      fYear: fYear,
    );
