import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class MyFlutterAppKPAuthUser {
  MyFlutterAppKPAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserModelStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<MyFlutterAppKPAuthUser> myFlutterAppKPAuthUserSubject =
    BehaviorSubject.seeded(MyFlutterAppKPAuthUser(loggedIn: false));
Stream<MyFlutterAppKPAuthUser> myFlutterAppKPAuthUserStream() =>
    myFlutterAppKPAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
