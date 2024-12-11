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
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'portfolio_allocation_screen_model.dart';
export 'portfolio_allocation_screen_model.dart';

class PortfolioAllocationScreenWidget extends StatefulWidget {
  const PortfolioAllocationScreenWidget({super.key});

  @override
  State<PortfolioAllocationScreenWidget> createState() =>
      _PortfolioAllocationScreenWidgetState();
}

class _PortfolioAllocationScreenWidgetState
    extends State<PortfolioAllocationScreenWidget> {
  late PortfolioAllocationScreenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PortfolioAllocationScreenModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chartPieChartColorsList = [
      Color(0xFF8F46E9),
      Color(0xFF6F28CB),
      Color(0xFF539A80),
      Color(0xFF4A57C1),
      Color(0xFF3E8DD0),
      Color(0xFF333EBA),
      Color(0xFF5C6BF4)
    ];
    return FutureBuilder<ApiCallResponse>(
      future: MyBillionsApiGroupGroup.reportsPfDropdownCall.call(
        customerID: currentUserData?.customerId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40.0,
              height: 40.0,
              child: SpinKitPulse(
                color: FlutterFlowTheme.of(context).secondary,
                size: 40.0,
              ),
            ),
          );
        }
        final containerReportsPfDropdownResponse = snapshot.data!;

        return Container(
          decoration: BoxDecoration(),
          child: FutureBuilder<ApiCallResponse>(
            future: MyBillionsApiGroupGroup.portfolioAllocationCall.call(
              customerId: currentUserData?.customerId,
              customerPlanId: valueOrDefault<int>(
                functions.getPlanId(
                    MyBillionsApiGroupGroup.reportsPfDropdownCall
                        .customerPlanLists(
                          containerReportsPfDropdownResponse.jsonBody,
                        )!
                        .toList(),
                    valueOrDefault<String>(
                      _model.applicantDropdownValue,
                      'All',
                    )),
                0,
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: SpinKitPulse(
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 40.0,
                    ),
                  ),
                );
              }
              final containerPortfolioAllocationResponse = snapshot.data!;

              return Container(
                decoration: BoxDecoration(),
                child: Visibility(
                  visible: MyBillionsApiGroupGroup.portfolioAllocationCall
                              .categoryPercent(
                            containerPortfolioAllocationResponse.jsonBody,
                          ) !=
                          null &&
                      (MyBillionsApiGroupGroup.portfolioAllocationCall
                              .categoryPercent(
                        containerPortfolioAllocationResponse.jsonBody,
                      ))!
                          .isNotEmpty,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'ryahyehi' /* Goal */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: FlutterFlowDropDown<String>(
                                  controller: _model
                                          .applicantDropdownValueController ??=
                                      FormFieldController<String>(
                                    _model.applicantDropdownValue ??=
                                        FFLocalizations.of(context).getText(
                                      '0hc0ofk9' /* All */,
                                    ),
                                  ),
                                  options: MyBillionsApiGroupGroup
                                      .reportsPfDropdownCall
                                      .customerPlanName(
                                    containerReportsPfDropdownResponse.jsonBody,
                                  )!,
                                  onChanged: (val) => safeSetState(() =>
                                      _model.applicantDropdownValue = val),
                                  width: double.infinity,
                                  height: 40.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    '4dgpdz1c' /* All */,
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).secondary,
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
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 10.0),
                            child: Container(
                              width: double.infinity,
                              height: 400.0,
                              decoration: BoxDecoration(),
                              child: Visibility(
                                visible: MyBillionsApiGroupGroup
                                            .portfolioAllocationCall
                                            .categoryPercent(
                                          containerPortfolioAllocationResponse
                                              .jsonBody,
                                        ) !=
                                        null &&
                                    (MyBillionsApiGroupGroup
                                            .portfolioAllocationCall
                                            .categoryPercent(
                                      containerPortfolioAllocationResponse
                                          .jsonBody,
                                    ))!
                                        .isNotEmpty,
                                child: Container(
                                  width: double.infinity,
                                  child: Stack(
                                    children: [
                                      FlutterFlowPieChart(
                                        data: FFPieChartData(
                                          values: MyBillionsApiGroupGroup
                                              .portfolioAllocationCall
                                              .categoryPercent(
                                            containerPortfolioAllocationResponse
                                                .jsonBody,
                                          )!,
                                          colors: chartPieChartColorsList,
                                          radius: [110.0],
                                          borderColor: [
                                            FlutterFlowTheme.of(context).primary
                                          ],
                                        ),
                                        donutHoleRadius: 0.0,
                                        donutHoleColor: Colors.transparent,
                                        sectionLabelType:
                                            PieChartSectionLabelType.value,
                                        sectionLabelStyle: FlutterFlowTheme.of(
                                                context)
                                            .headlineSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmallFamily,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily),
                                            ),
                                        labelFormatter: LabelFormatter(
                                          numberFormat: (val) => formatNumber(
                                            val,
                                            formatType: FormatType.percent,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, -1.0),
                                        child: FlutterFlowChartLegendWidget(
                                          entries: MyBillionsApiGroupGroup
                                              .portfolioAllocationCall
                                              .categoryName(
                                                containerPortfolioAllocationResponse
                                                    .jsonBody,
                                              )!
                                              .asMap()
                                              .entries
                                              .map(
                                                (label) => LegendEntry(
                                                  chartPieChartColorsList[label
                                                          .key %
                                                      chartPieChartColorsList
                                                          .length],
                                                  label.value,
                                                ),
                                              )
                                              .toList(),
                                          width: double.infinity,
                                          height: 80.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          textPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          indicatorSize: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.schemeTypeWiseModel,
                            updateCallback: () => safeSetState(() {}),
                            child: ThreeHeaderTableWidget(
                              header1: 'Assets',
                              header2: 'Amount (INR)',
                              header3: '% Share',
                              header1List: MyBillionsApiGroupGroup
                                  .portfolioAllocationCall
                                  .schemeType(
                                containerPortfolioAllocationResponse.jsonBody,
                              )!,
                              header2List: MyBillionsApiGroupGroup
                                  .portfolioAllocationCall
                                  .schemeTypeTotal(
                                containerPortfolioAllocationResponse.jsonBody,
                              )!,
                              header3List: MyBillionsApiGroupGroup
                                  .portfolioAllocationCall
                                  .schemeTypePercent(
                                containerPortfolioAllocationResponse.jsonBody,
                              )!,
                              title: 'Scheme Type Wise',
                            ),
                          ),
                          wrapWithModel(
                            model: _model.applicantTypeWiseModel,
                            updateCallback: () => safeSetState(() {}),
                            child: ThreeHeaderTableWidget(
                              header1: 'Applicant Details',
                              header2: 'Amount (INR)',
                              header3: '% Share',
                              header1List: MyBillionsApiGroupGroup
                                  .portfolioAllocationCall
                                  .investorName(
                                containerPortfolioAllocationResponse.jsonBody,
                              )!,
                              header2List: MyBillionsApiGroupGroup
                                  .portfolioAllocationCall
                                  .investorTotal(
                                containerPortfolioAllocationResponse.jsonBody,
                              )!,
                              header3List: MyBillionsApiGroupGroup
                                  .portfolioAllocationCall
                                  .investorPercent(
                                containerPortfolioAllocationResponse.jsonBody,
                              )!,
                              title: 'Applicant Wise',
                            ),
                          ),
                          wrapWithModel(
                            model: _model.fundTypeWiseModel,
                            updateCallback: () => safeSetState(() {}),
                            child: ThreeHeaderTableWidget(
                              header1: 'Fund House',
                              header2: 'Amount (INR)',
                              header3: '% Share',
                              header1List: MyBillionsApiGroupGroup
                                  .portfolioAllocationCall
                                  .fundHouseName(
                                containerPortfolioAllocationResponse.jsonBody,
                              )!,
                              header2List: MyBillionsApiGroupGroup
                                  .portfolioAllocationCall
                                  .fundHouseTotal(
                                containerPortfolioAllocationResponse.jsonBody,
                              )!,
                              header3List: MyBillionsApiGroupGroup
                                  .portfolioAllocationCall
                                  .fundHousePercentage(
                                containerPortfolioAllocationResponse.jsonBody,
                              )!,
                              title: 'Fund House Wise',
                            ),
                          ),
                          wrapWithModel(
                            model: _model.debtWiseModel,
                            updateCallback: () => safeSetState(() {}),
                            child: DebtWiseWidget(
                              debtJson: MyBillionsApiGroupGroup
                                  .portfolioAllocationCall
                                  .debtList(
                                containerPortfolioAllocationResponse.jsonBody,
                              )!,
                            ),
                          ),
                          wrapWithModel(
                            model: _model.equityWiseWidgetModel,
                            updateCallback: () => safeSetState(() {}),
                            child: EquityWiseWidget(
                              equityJson: MyBillionsApiGroupGroup
                                  .portfolioAllocationCall
                                  .equityList(
                                containerPortfolioAllocationResponse.jsonBody,
                              )!,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
