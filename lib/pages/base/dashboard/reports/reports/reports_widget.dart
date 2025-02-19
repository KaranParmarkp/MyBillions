import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/base/dashboard/reports/capital_gain/capital_gain_list/capital_gain_list_widget.dart';
import '/pages/base/dashboard/reports/portfolio_allocation/portfolio_allocation_screen/portfolio_allocation_screen_widget.dart';
import '/pages/base/dashboard/reports/portfolio_summery/portfolio_list/portfolio_list_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reports_model.dart';
export 'reports_model.dart';

class ReportsWidget extends StatefulWidget {
  const ReportsWidget({super.key});

  @override
  State<ReportsWidget> createState() => _ReportsWidgetState();
}

class _ReportsWidgetState extends State<ReportsWidget> {
  late ReportsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 10.0),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController ??=
                        FormFieldController<String>(
                      _model.dropDownValue ??=
                          FFLocalizations.of(context).getText(
                        '7591v64d' /* Portfolio Summary */,
                      ),
                    ),
                    options: [
                      FFLocalizations.of(context).getText(
                        '2s8ciah3' /* Portfolio Summary */,
                      ),
                      FFLocalizations.of(context).getText(
                        'wmkjs0v8' /* Transaction Report */,
                      ),
                      FFLocalizations.of(context).getText(
                        '081ff49z' /* Capital Gain */,
                      ),
                      FFLocalizations.of(context).getText(
                        'vyesc9ie' /* Portfolio Allocation */,
                      ),
                      FFLocalizations.of(context).getText(
                        'lsyw0c0u' /* US PFIC */,
                      )
                    ],
                    onChanged: (val) async {
                      safeSetState(() => _model.dropDownValue = val);
                      _model.currentSelected = _model.dropDownValue!;
                      safeSetState(() {});
                    },
                    width: double.infinity,
                    height: 40.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).secondary,
                    borderWidth: 1.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                    hidesUnderline: true,
                    isOverButton: false,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                ),
              ),
            ],
          ),
          if (_model.dropDownValue == 'Portfolio Summary')
            Expanded(
              child: wrapWithModel(
                model: _model.portfolioListModel,
                updateCallback: () => safeSetState(() {}),
                child: PortfolioListWidget(),
              ),
            ),
          if (_model.dropDownValue == 'Portfolio Allocation')
            Expanded(
              child: wrapWithModel(
                model: _model.portfolioAllocationScreenModel,
                updateCallback: () => safeSetState(() {}),
                child: PortfolioAllocationScreenWidget(),
              ),
            ),
          if (_model.dropDownValue == 'Capital Gain')
            Expanded(
              child: wrapWithModel(
                model: _model.capitalGainListModel,
                updateCallback: () => safeSetState(() {}),
                child: CapitalGainListWidget(),
              ),
            ),
        ],
      ),
    );
  }
}
