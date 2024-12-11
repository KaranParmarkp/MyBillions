// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserModelStruct extends BaseStruct {
  UserModelStruct({
    String? emailId,
    String? fullName,
    int? customerId,
    String? mobile,
  })  : _emailId = emailId,
        _fullName = fullName,
        _customerId = customerId,
        _mobile = mobile;

  // "emailId" field.
  String? _emailId;
  String get emailId => _emailId ?? '';
  set emailId(String? val) => _emailId = val;

  bool hasEmailId() => _emailId != null;

  // "fullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "customerId" field.
  int? _customerId;
  int get customerId => _customerId ?? 0;
  set customerId(int? val) => _customerId = val;

  void incrementCustomerId(int amount) => customerId = customerId + amount;

  bool hasCustomerId() => _customerId != null;

  // "mobile" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  set mobile(String? val) => _mobile = val;

  bool hasMobile() => _mobile != null;

  static UserModelStruct fromMap(Map<String, dynamic> data) => UserModelStruct(
        emailId: data['emailId'] as String?,
        fullName: data['fullName'] as String?,
        customerId: castToType<int>(data['customerId']),
        mobile: data['mobile'] as String?,
      );

  static UserModelStruct? maybeFromMap(dynamic data) => data is Map
      ? UserModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'emailId': _emailId,
        'fullName': _fullName,
        'customerId': _customerId,
        'mobile': _mobile,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'emailId': serializeParam(
          _emailId,
          ParamType.String,
        ),
        'fullName': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'customerId': serializeParam(
          _customerId,
          ParamType.int,
        ),
        'mobile': serializeParam(
          _mobile,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserModelStruct(
        emailId: deserializeParam(
          data['emailId'],
          ParamType.String,
          false,
        ),
        fullName: deserializeParam(
          data['fullName'],
          ParamType.String,
          false,
        ),
        customerId: deserializeParam(
          data['customerId'],
          ParamType.int,
          false,
        ),
        mobile: deserializeParam(
          data['mobile'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserModelStruct &&
        emailId == other.emailId &&
        fullName == other.fullName &&
        customerId == other.customerId &&
        mobile == other.mobile;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([emailId, fullName, customerId, mobile]);
}

UserModelStruct createUserModelStruct({
  String? emailId,
  String? fullName,
  int? customerId,
  String? mobile,
}) =>
    UserModelStruct(
      emailId: emailId,
      fullName: fullName,
      customerId: customerId,
      mobile: mobile,
    );
