// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvestorModelStruct extends BaseStruct {
  InvestorModelStruct({
    int? investorID,
    String? name,
  })  : _investorID = investorID,
        _name = name;

  // "InvestorID" field.
  int? _investorID;
  int get investorID => _investorID ?? 0;
  set investorID(int? val) => _investorID = val;

  void incrementInvestorID(int amount) => investorID = investorID + amount;

  bool hasInvestorID() => _investorID != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static InvestorModelStruct fromMap(Map<String, dynamic> data) =>
      InvestorModelStruct(
        investorID: castToType<int>(data['InvestorID']),
        name: data['Name'] as String?,
      );

  static InvestorModelStruct? maybeFromMap(dynamic data) => data is Map
      ? InvestorModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'InvestorID': _investorID,
        'Name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'InvestorID': serializeParam(
          _investorID,
          ParamType.int,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static InvestorModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      InvestorModelStruct(
        investorID: deserializeParam(
          data['InvestorID'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'InvestorModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InvestorModelStruct &&
        investorID == other.investorID &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([investorID, name]);
}

InvestorModelStruct createInvestorModelStruct({
  int? investorID,
  String? name,
}) =>
    InvestorModelStruct(
      investorID: investorID,
      name: name,
    );
