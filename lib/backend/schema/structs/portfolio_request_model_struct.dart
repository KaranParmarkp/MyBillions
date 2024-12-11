// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PortfolioRequestModelStruct extends BaseStruct {
  PortfolioRequestModelStruct({
    int? investorId,
    int? customerId,
    int? planID,
    String? category,
    int? allFolio,
    String? startdate,
    String? enddate,
    String? fundHouse,
    String? schemeName,
    String? folioNumber,
    DateTime? endDateTime,
    DateTime? startDateTime,
  })  : _investorId = investorId,
        _customerId = customerId,
        _planID = planID,
        _category = category,
        _allFolio = allFolio,
        _startdate = startdate,
        _enddate = enddate,
        _fundHouse = fundHouse,
        _schemeName = schemeName,
        _folioNumber = folioNumber,
        _endDateTime = endDateTime,
        _startDateTime = startDateTime;

  // "InvestorId" field.
  int? _investorId;
  int get investorId => _investorId ?? 0;
  set investorId(int? val) => _investorId = val;

  void incrementInvestorId(int amount) => investorId = investorId + amount;

  bool hasInvestorId() => _investorId != null;

  // "CustomerId" field.
  int? _customerId;
  int get customerId => _customerId ?? 0;
  set customerId(int? val) => _customerId = val;

  void incrementCustomerId(int amount) => customerId = customerId + amount;

  bool hasCustomerId() => _customerId != null;

  // "PlanID" field.
  int? _planID;
  int get planID => _planID ?? 0;
  set planID(int? val) => _planID = val;

  void incrementPlanID(int amount) => planID = planID + amount;

  bool hasPlanID() => _planID != null;

  // "Category" field.
  String? _category;
  String get category => _category ?? 'All';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "AllFolio" field.
  int? _allFolio;
  int get allFolio => _allFolio ?? 1;
  set allFolio(int? val) => _allFolio = val;

  void incrementAllFolio(int amount) => allFolio = allFolio + amount;

  bool hasAllFolio() => _allFolio != null;

  // "startdate" field.
  String? _startdate;
  String get startdate => _startdate ?? '';
  set startdate(String? val) => _startdate = val;

  bool hasStartdate() => _startdate != null;

  // "enddate" field.
  String? _enddate;
  String get enddate => _enddate ?? '';
  set enddate(String? val) => _enddate = val;

  bool hasEnddate() => _enddate != null;

  // "FundHouse" field.
  String? _fundHouse;
  String get fundHouse => _fundHouse ?? '';
  set fundHouse(String? val) => _fundHouse = val;

  bool hasFundHouse() => _fundHouse != null;

  // "SchemeName" field.
  String? _schemeName;
  String get schemeName => _schemeName ?? '';
  set schemeName(String? val) => _schemeName = val;

  bool hasSchemeName() => _schemeName != null;

  // "FolioNumber" field.
  String? _folioNumber;
  String get folioNumber => _folioNumber ?? '';
  set folioNumber(String? val) => _folioNumber = val;

  bool hasFolioNumber() => _folioNumber != null;

  // "endDateTime" field.
  DateTime? _endDateTime;
  DateTime? get endDateTime => _endDateTime;
  set endDateTime(DateTime? val) => _endDateTime = val;

  bool hasEndDateTime() => _endDateTime != null;

  // "startDateTime" field.
  DateTime? _startDateTime;
  DateTime? get startDateTime => _startDateTime;
  set startDateTime(DateTime? val) => _startDateTime = val;

  bool hasStartDateTime() => _startDateTime != null;

  static PortfolioRequestModelStruct fromMap(Map<String, dynamic> data) =>
      PortfolioRequestModelStruct(
        investorId: castToType<int>(data['InvestorId']),
        customerId: castToType<int>(data['CustomerId']),
        planID: castToType<int>(data['PlanID']),
        category: data['Category'] as String?,
        allFolio: castToType<int>(data['AllFolio']),
        startdate: data['startdate'] as String?,
        enddate: data['enddate'] as String?,
        fundHouse: data['FundHouse'] as String?,
        schemeName: data['SchemeName'] as String?,
        folioNumber: data['FolioNumber'] as String?,
        endDateTime: data['endDateTime'] as DateTime?,
        startDateTime: data['startDateTime'] as DateTime?,
      );

  static PortfolioRequestModelStruct? maybeFromMap(dynamic data) => data is Map
      ? PortfolioRequestModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'InvestorId': _investorId,
        'CustomerId': _customerId,
        'PlanID': _planID,
        'Category': _category,
        'AllFolio': _allFolio,
        'startdate': _startdate,
        'enddate': _enddate,
        'FundHouse': _fundHouse,
        'SchemeName': _schemeName,
        'FolioNumber': _folioNumber,
        'endDateTime': _endDateTime,
        'startDateTime': _startDateTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'InvestorId': serializeParam(
          _investorId,
          ParamType.int,
        ),
        'CustomerId': serializeParam(
          _customerId,
          ParamType.int,
        ),
        'PlanID': serializeParam(
          _planID,
          ParamType.int,
        ),
        'Category': serializeParam(
          _category,
          ParamType.String,
        ),
        'AllFolio': serializeParam(
          _allFolio,
          ParamType.int,
        ),
        'startdate': serializeParam(
          _startdate,
          ParamType.String,
        ),
        'enddate': serializeParam(
          _enddate,
          ParamType.String,
        ),
        'FundHouse': serializeParam(
          _fundHouse,
          ParamType.String,
        ),
        'SchemeName': serializeParam(
          _schemeName,
          ParamType.String,
        ),
        'FolioNumber': serializeParam(
          _folioNumber,
          ParamType.String,
        ),
        'endDateTime': serializeParam(
          _endDateTime,
          ParamType.DateTime,
        ),
        'startDateTime': serializeParam(
          _startDateTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static PortfolioRequestModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PortfolioRequestModelStruct(
        investorId: deserializeParam(
          data['InvestorId'],
          ParamType.int,
          false,
        ),
        customerId: deserializeParam(
          data['CustomerId'],
          ParamType.int,
          false,
        ),
        planID: deserializeParam(
          data['PlanID'],
          ParamType.int,
          false,
        ),
        category: deserializeParam(
          data['Category'],
          ParamType.String,
          false,
        ),
        allFolio: deserializeParam(
          data['AllFolio'],
          ParamType.int,
          false,
        ),
        startdate: deserializeParam(
          data['startdate'],
          ParamType.String,
          false,
        ),
        enddate: deserializeParam(
          data['enddate'],
          ParamType.String,
          false,
        ),
        fundHouse: deserializeParam(
          data['FundHouse'],
          ParamType.String,
          false,
        ),
        schemeName: deserializeParam(
          data['SchemeName'],
          ParamType.String,
          false,
        ),
        folioNumber: deserializeParam(
          data['FolioNumber'],
          ParamType.String,
          false,
        ),
        endDateTime: deserializeParam(
          data['endDateTime'],
          ParamType.DateTime,
          false,
        ),
        startDateTime: deserializeParam(
          data['startDateTime'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'PortfolioRequestModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PortfolioRequestModelStruct &&
        investorId == other.investorId &&
        customerId == other.customerId &&
        planID == other.planID &&
        category == other.category &&
        allFolio == other.allFolio &&
        startdate == other.startdate &&
        enddate == other.enddate &&
        fundHouse == other.fundHouse &&
        schemeName == other.schemeName &&
        folioNumber == other.folioNumber &&
        endDateTime == other.endDateTime &&
        startDateTime == other.startDateTime;
  }

  @override
  int get hashCode => const ListEquality().hash([
        investorId,
        customerId,
        planID,
        category,
        allFolio,
        startdate,
        enddate,
        fundHouse,
        schemeName,
        folioNumber,
        endDateTime,
        startDateTime
      ]);
}

PortfolioRequestModelStruct createPortfolioRequestModelStruct({
  int? investorId,
  int? customerId,
  int? planID,
  String? category,
  int? allFolio,
  String? startdate,
  String? enddate,
  String? fundHouse,
  String? schemeName,
  String? folioNumber,
  DateTime? endDateTime,
  DateTime? startDateTime,
}) =>
    PortfolioRequestModelStruct(
      investorId: investorId,
      customerId: customerId,
      planID: planID,
      category: category,
      allFolio: allFolio,
      startdate: startdate,
      enddate: enddate,
      fundHouse: fundHouse,
      schemeName: schemeName,
      folioNumber: folioNumber,
      endDateTime: endDateTime,
      startDateTime: startDateTime,
    );
