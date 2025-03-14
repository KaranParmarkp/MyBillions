import '/auth/custom_auth/auth_util.dart';
import '/components/app_bg/app_bg_widget.dart';
import '/components/appbar_logo/appbar_logo_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'profile_screen_widget.dart' show ProfileScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileScreenModel extends FlutterFlowModel<ProfileScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for app_bg component.
  late AppBgModel appBgModel;
  // Model for appbar_logo component.
  late AppbarLogoModel appbarLogoModel;

  @override
  void initState(BuildContext context) {
    appBgModel = createModel(context, () => AppBgModel());
    appbarLogoModel = createModel(context, () => AppbarLogoModel());
  }

  @override
  void dispose() {
    appBgModel.dispose();
    appbarLogoModel.dispose();
  }
}
