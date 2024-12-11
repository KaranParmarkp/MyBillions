// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerPlanModelStruct extends BaseStruct {
  CustomerPlanModelStruct({
    int? customerPlanID,
    String? planName,
  })  : _customerPlanID = customerPlanID,
        _planName = planName;

  // "CustomerPlanID" field.
  int? _customerPlanID;
  int get customerPlanID => _customerPlanID ?? 0;
  set customerPlanID(int? val) => _customerPlanID = val;

  void incrementCustomerPlanID(int amount) =>
      customerPlanID = customerPlanID + amount;

  bool hasCustomerPlanID() => _customerPlanID != null;

  // "PlanName" field.
  String? _planName;
  String get planName => _planName ?? '';
  set planName(String? val) => _planName = val;

  bool hasPlanName() => _planName != null;

  static CustomerPlanModelStruct fromMap(Map<String, dynamic> data) =>
      CustomerPlanModelStruct(
        customerPlanID: castToType<int>(data['CustomerPlanID']),
        planName: data['PlanName'] as String?,
      );

  static CustomerPlanModelStruct? maybeFromMap(dynamic data) => data is Map
      ? CustomerPlanModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'CustomerPlanID': _customerPlanID,
        'PlanName': _planName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'CustomerPlanID': serializeParam(
          _customerPlanID,
          ParamType.int,
        ),
        'PlanName': serializeParam(
          _planName,
          ParamType.String,
        ),
      }.withoutNulls;

  static CustomerPlanModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CustomerPlanModelStruct(
        customerPlanID: deserializeParam(
          data['CustomerPlanID'],
          ParamType.int,
          false,
        ),
        planName: deserializeParam(
          data['PlanName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CustomerPlanModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CustomerPlanModelStruct &&
        customerPlanID == other.customerPlanID &&
        planName == other.planName;
  }

  @override
  int get hashCode => const ListEquality().hash([customerPlanID, planName]);
}

CustomerPlanModelStruct createCustomerPlanModelStruct({
  int? customerPlanID,
  String? planName,
}) =>
    CustomerPlanModelStruct(
      customerPlanID: customerPlanID,
      planName: planName,
    );
