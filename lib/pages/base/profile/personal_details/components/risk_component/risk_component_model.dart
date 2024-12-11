import '/components/app_button/app_button_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'risk_component_widget.dart' show RiskComponentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RiskComponentModel extends FlutterFlowModel<RiskComponentWidget> {
  ///  Local state fields for this component.

  int currentRiskScore = 0;

  ///  State fields for stateful widgets in this component.

  // Model for app_button component.
  late AppButtonModel appButtonModel1;
  // Model for app_button component.
  late AppButtonModel appButtonModel2;

  @override
  void initState(BuildContext context) {
    appButtonModel1 = createModel(context, () => AppButtonModel());
    appButtonModel2 = createModel(context, () => AppButtonModel());
  }

  @override
  void dispose() {
    appButtonModel1.dispose();
    appButtonModel2.dispose();
  }
}
