import '/backend/schema/structs/index.dart';
import '/components/app_bg/app_bg_widget.dart';
import '/components/app_logo_new_2/app_logo_new2_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/base/dashboard/financial_summary/financial_summary/financial_summary_widget.dart';
import '/pages/base/dashboard/recommendations/recommendations_list/recommendations_list_widget.dart';
import '/pages/base/dashboard/reports/reports/reports_widget.dart';
import '/pages/base/dashboard/trent_analysis/trend_analysis_screen/trend_analysis_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_screen_model.dart';
export 'dashboard_screen_model.dart';

class DashboardScreenWidget extends StatefulWidget {
  const DashboardScreenWidget({super.key});

  @override
  State<DashboardScreenWidget> createState() => _DashboardScreenWidgetState();
}

class _DashboardScreenWidgetState extends State<DashboardScreenWidget> {
  late DashboardScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardScreenModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                wrapWithModel(
                  model: _model.appBgModel,
                  updateCallback: () => safeSetState(() {}),
                  child: AppBgWidget(),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 55.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model.appLogoNew2Model,
                                      updateCallback: () => safeSetState(() {}),
                                      child: AppLogoNew2Widget(
                                        showPadding: false,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent4,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 5.0, 20.0, 0.0),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.dropDownValueController ??=
                                FormFieldController<String>(
                              _model.dropDownValue ??=
                                  FFLocalizations.of(context).getText(
                                'tjqo0w8o' /* Financial Summary */,
                              ),
                            ),
                            options: [
                              FFLocalizations.of(context).getText(
                                '1adj995k' /* Financial Summary */,
                              ),
                              FFLocalizations.of(context).getText(
                                '1evkulr5' /* Recommendations */,
                              ),
                              FFLocalizations.of(context).getText(
                                'dw3g7vqf' /* Reports */,
                              ),
                              FFLocalizations.of(context).getText(
                                '9s3j5jon' /* Trend Analysis */,
                              )
                            ],
                            onChanged: (val) async {
                              safeSetState(() => _model.dropDownValue = val);
                              _model.currentSelected = _model.dropDownValue!;
                              safeSetState(() {});
                            },
                            width: double.infinity,
                            height: 40.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).secondary,
                            borderWidth: 1.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isOverButton: false,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                        if (_model.dropDownValue == 'Financial Summary')
                          Expanded(
                            child: wrapWithModel(
                              model: _model.financialSummaryModel,
                              updateCallback: () => safeSetState(() {}),
                              child: FinancialSummaryWidget(),
                            ),
                          ),
                        if (_model.dropDownValue == 'Recommendations')
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 10.0, 20.0, 0.0),
                              child: wrapWithModel(
                                model: _model.recommendationsListModel,
                                updateCallback: () => safeSetState(() {}),
                                child: RecommendationsListWidget(),
                              ),
                            ),
                          ),
                        if (_model.dropDownValue == 'Reports')
                          Expanded(
                            child: wrapWithModel(
                              model: _model.reportsModel,
                              updateCallback: () => safeSetState(() {}),
                              child: ReportsWidget(),
                            ),
                          ),
                        if (_model.dropDownValue == 'Trend Analysis')
                          Expanded(
                            child: wrapWithModel(
                              model: _model.trendAnalysisScreenModel,
                              updateCallback: () => safeSetState(() {}),
                              child: TrendAnalysisScreenWidget(),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
