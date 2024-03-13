import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class MyBillionsAppKPAuthUser {
  MyBillionsAppKPAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserModelStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<MyBillionsAppKPAuthUser> myBillionsAppKPAuthUserSubject =
    BehaviorSubject.seeded(MyBillionsAppKPAuthUser(loggedIn: false));
Stream<MyBillionsAppKPAuthUser> myBillionsAppKPAuthUserStream() =>
    myBillionsAppKPAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
