import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/three_header_table_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/base/dashboard/reports/portfolio_allocation/debt_wise/debt_wise_widget.dart';
import '/pages/base/dashboard/reports/portfolio_allocation/equity_wise/equity_wise_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'portfolio_allocation_screen_widget.dart'
    show PortfolioAllocationScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PortfolioAllocationScreenModel
    extends FlutterFlowModel<PortfolioAllocationScreenWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for applicantDropdown widget.
  String? applicantDropdownValue;
  FormFieldController<String>? applicantDropdownValueController;
  // Model for SchemeTypeWise.
  late ThreeHeaderTableModel schemeTypeWiseModel;
  // Model for ApplicantTypeWise.
  late ThreeHeaderTableModel applicantTypeWiseModel;
  // Model for FundTypeWise.
  late ThreeHeaderTableModel fundTypeWiseModel;
  // Model for DebtWise.
  late DebtWiseModel debtWiseModel;
  // Model for EquityWiseWidget.
  late EquityWiseModel equityWiseWidgetModel;

  @override
  void initState(BuildContext context) {
    schemeTypeWiseModel = createModel(context, () => ThreeHeaderTableModel());
    applicantTypeWiseModel =
        createModel(context, () => ThreeHeaderTableModel());
    fundTypeWiseModel = createModel(context, () => ThreeHeaderTableModel());
    debtWiseModel = createModel(context, () => DebtWiseModel());
    equityWiseWidgetModel = createModel(context, () => EquityWiseModel());
  }

  @override
  void dispose() {
    schemeTypeWiseModel.dispose();
    applicantTypeWiseModel.dispose();
    fundTypeWiseModel.dispose();
    debtWiseModel.dispose();
    equityWiseWidgetModel.dispose();
  }
}
