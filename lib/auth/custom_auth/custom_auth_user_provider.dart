import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class MyBillionsAuthUser {
  MyBillionsAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserModelStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<MyBillionsAuthUser> myBillionsAuthUserSubject =
    BehaviorSubject.seeded(MyBillionsAuthUser(loggedIn: false));
Stream<MyBillionsAuthUser> myBillionsAuthUserStream() =>
    myBillionsAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
