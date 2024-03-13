import '/components/app_bg/app_bg_widget.dart';
import '/components/appbar_logo/appbar_logo_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'goal_screen_widget.dart' show GoalScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GoalScreenModel extends FlutterFlowModel<GoalScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for app_bg component.
  late AppBgModel appBgModel;
  // Model for appbar_logo component.
  late AppbarLogoModel appbarLogoModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    appBgModel = createModel(context, () => AppBgModel());
    appbarLogoModel = createModel(context, () => AppbarLogoModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBgModel.dispose();
    appbarLogoModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
