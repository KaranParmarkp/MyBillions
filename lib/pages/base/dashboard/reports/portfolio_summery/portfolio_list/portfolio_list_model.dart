import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/base/dashboard/reports/pf_filters/pf_filters_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'portfolio_list_widget.dart' show PortfolioListWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PortfolioListModel extends FlutterFlowModel<PortfolioListWidget> {
  ///  Local state fields for this component.

  PortfolioRequestModelStruct? portofolioRequestModel;
  void updatePortofolioRequestModelStruct(
      Function(PortfolioRequestModelStruct) updateFn) {
    updateFn(portofolioRequestModel ??= PortfolioRequestModelStruct());
  }

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (performanceReportData)] action in portfolio_list widget.
  ApiCallResponse? portfolioApiResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
