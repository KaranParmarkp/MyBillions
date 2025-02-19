import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'trend_analysis_screen_widget.dart' show TrendAnalysisScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TrendAnalysisScreenModel
    extends FlutterFlowModel<TrendAnalysisScreenWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for applicantDropdown widget.
  String? applicantDropdownValue1;
  FormFieldController<String>? applicantDropdownValueController1;
  // State field(s) for applicantDropdown widget.
  String? applicantDropdownValue2;
  FormFieldController<String>? applicantDropdownValueController2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
