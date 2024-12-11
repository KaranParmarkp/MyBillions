import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'recommendation_component_model.dart';
export 'recommendation_component_model.dart';

class RecommendationComponentWidget extends StatefulWidget {
  const RecommendationComponentWidget({super.key});

  @override
  State<RecommendationComponentWidget> createState() =>
      _RecommendationComponentWidgetState();
}

class _RecommendationComponentWidgetState
    extends State<RecommendationComponentWidget> {
  late RecommendationComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecommendationComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: MyBillionsApiGroupGroup.recommendationsDataCall.call(
        customerId: currentUserData?.customerId,
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
        final containerRecommendationsDataResponse = snapshot.data!;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Builder(
            builder: (context) {
              final recList = MyBillionsApiGroupGroup.recommendationsDataCall
                      .recList(
                        containerRecommendationsDataResponse.jsonBody,
                      )
                      ?.toList() ??
                  [];

              return FlutterFlowDataTable<dynamic>(
                controller: _model.paginatedDataTableController,
                data: recList,
                numRows: MyBillionsApiGroupGroup.recommendationsDataCall
                    .recList(
                      containerRecommendationsDataResponse.jsonBody,
                    )
                    ?.length,
                columnsBuilder: (onSortChanged) => [
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'j9bdev43' /* Plan Name	 */,
                        ),
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelLargeFamily),
                            ),
                      ),
                    ),
                    fixedWidth: 150.0,
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '4zduvm00' /* Current Scheme	 */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelLargeFamily),
                            ),
                      ),
                    ),
                    fixedWidth: 400.0,
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'bqoh47gg' /* Type */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelLargeFamily),
                            ),
                      ),
                    ),
                    fixedWidth: 100.0,
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '2m51f4sz' /* New Scheme	 */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelLargeFamily),
                            ),
                      ),
                    ),
                    fixedWidth: 400.0,
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '2b5axjzt' /* Amount */,
                        ),
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelLargeFamily),
                            ),
                      ),
                    ),
                    fixedWidth: 100.0,
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'vkzakfbr' /* Unit */,
                        ),
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelLargeFamily),
                            ),
                      ),
                    ),
                    fixedWidth: 100.0,
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '3s1delma' /* Expiry */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelLargeFamily),
                            ),
                      ),
                    ),
                    fixedWidth: 100.0,
                  ),
                ],
                dataRowBuilder:
                    (recListItem, recListIndex, selected, onSelectChanged) =>
                        DataRow(
                  color: MaterialStateProperty.all(
                    recListIndex % 2 == 0
                        ? FlutterFlowTheme.of(context).secondaryBackground
                        : FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  cells: [
                    Text(
                      getJsonField(
                        recListItem,
                        r'''$.GoalID''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    Text(
                      getJsonField(
                        recListItem,
                        r'''$.SchemeName''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    Text(
                      getJsonField(
                        recListItem,
                        r'''$.TransactionType''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    Text(
                      getJsonField(
                        recListItem,
                        r'''$.NewSchemeName''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    Text(
                      getJsonField(
                        recListItem,
                        r'''$.Amount''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    Text(
                      getJsonField(
                        recListItem,
                        r'''$.Unit''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    Text(
                      functions.formateStringToDate(getJsonField(
                        recListItem,
                        r'''$.ExpiryDate''',
                      ).toString()),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ].map((c) => DataCell(c)).toList(),
                ),
                paginated: false,
                selectable: false,
                headingRowHeight: 56.0,
                dataRowHeight: 48.0,
                columnSpacing: 20.0,
                headingRowColor: FlutterFlowTheme.of(context).secondary,
                borderRadius: BorderRadius.circular(8.0),
                addHorizontalDivider: true,
                addTopAndBottomDivider: false,
                hideDefaultHorizontalDivider: true,
                horizontalDividerColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                horizontalDividerThickness: 1.0,
                addVerticalDivider: true,
                verticalDividerColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                verticalDividerThickness: 1.0,
              );
            },
          ),
        );
      },
    );
  }
}
