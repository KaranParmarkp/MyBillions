import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/base/dashboard/reports/capital_gain/cp_filters/cp_filters_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'capital_gain_list_widget.dart' show CapitalGainListWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CapitalGainListModel extends FlutterFlowModel<CapitalGainListWidget> {
  ///  Local state fields for this component.

  CapitalGainRequestModelStruct? localRequestModel;
  void updateLocalRequestModelStruct(
      Function(CapitalGainRequestModelStruct) updateFn) {
    updateFn(localRequestModel ??= CapitalGainRequestModelStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
