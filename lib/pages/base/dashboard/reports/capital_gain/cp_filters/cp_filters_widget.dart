import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/app_button/app_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cp_filters_model.dart';
export 'cp_filters_model.dart';

class CpFiltersWidget extends StatefulWidget {
  const CpFiltersWidget({
    super.key,
    required this.onSubmitClick,
    required this.requestModelFromScreen,
  });

  final Future Function(CapitalGainRequestModelStruct filtersRequestModel)?
      onSubmitClick;
  final CapitalGainRequestModelStruct? requestModelFromScreen;

  @override
  State<CpFiltersWidget> createState() => _CpFiltersWidgetState();
}

class _CpFiltersWidgetState extends State<CpFiltersWidget> {
  late CpFiltersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CpFiltersModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.localRequestModel = widget!.requestModelFromScreen;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 30.0),
        child: FutureBuilder<ApiCallResponse>(
          future: FFAppState().filterQuery(
            requestFn: () => MyBillionsApiGroupGroup.reportsPfDropdownCall.call(
              customerID: currentUserData?.customerId,
              endDate: dateTimeFormat(
                "d/M/y",
                getCurrentTimestamp,
                locale: FFLocalizations.of(context).languageCode,
              ),
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
            final columnReportsPfDropdownResponse = snapshot.data!;

            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'wo5s2qcg' /* Filters */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 120.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.close_rounded,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'wqnwyq2z' /* Applicant */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: FlutterFlowDropDown<String>(
                          controller:
                              _model.applicantDropdownValueController ??=
                                  FormFieldController<String>(
                            _model.applicantDropdownValue ??=
                                FFLocalizations.of(context).getText(
                              'lkmsu4bm' /* All */,
                            ),
                          ),
                          options: PortfolioFilterModelStruct.maybeFromMap(
                                  columnReportsPfDropdownResponse.jsonBody)!
                              .investorLists
                              .map((e) => e.name)
                              .toList(),
                          onChanged: (val) async {
                            safeSetState(
                                () => _model.applicantDropdownValue = val);
                            _model.updateLocalRequestModelStruct(
                              (e) => e
                                ..investorID = functions.getInvestorId(
                                    PortfolioFilterModelStruct.maybeFromMap(
                                            columnReportsPfDropdownResponse
                                                .jsonBody)!
                                        .investorLists
                                        .map((e) => e.toMap())
                                        .toList(),
                                    _model.applicantDropdownValue!),
                            );
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
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          hintText: FFLocalizations.of(context).getText(
                            'awar9d0i' /* All */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'c4wlv8vc' /* Category */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.categoryDropdownValueController ??=
                              FormFieldController<String>(
                            _model.categoryDropdownValue ??=
                                valueOrDefault<String>(
                              _model.localRequestModel?.category,
                              'All',
                            ),
                          ),
                          options: [
                            FFLocalizations.of(context).getText(
                              '8idh7bj2' /* All */,
                            ),
                            FFLocalizations.of(context).getText(
                              'b7831221' /* Equity */,
                            ),
                            FFLocalizations.of(context).getText(
                              'dqwkuwyi' /* Debt */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(
                                () => _model.categoryDropdownValue = val);
                            _model.updateLocalRequestModelStruct(
                              (e) => e..category = _model.categoryDropdownValue,
                            );
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
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'i8welzxv' /* Terms */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.termDropdownValueController ??=
                              FormFieldController<String>(
                            _model.termDropdownValue ??= valueOrDefault<String>(
                              _model.localRequestModel?.category,
                              'All',
                            ),
                          ),
                          options: [
                            FFLocalizations.of(context).getText(
                              'xtbfo4pk' /* All */,
                            ),
                            FFLocalizations.of(context).getText(
                              'sw1rw1f4' /* Short Term */,
                            ),
                            FFLocalizations.of(context).getText(
                              'v20a6yex' /* Long Term */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.termDropdownValue = val);
                            _model.updateLocalRequestModelStruct(
                              (e) => e..term = _model.termDropdownValue,
                            );
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
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'v8pzae4q' /* Year */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.yearDropdownValueController ??=
                              FormFieldController<String>(
                            _model.yearDropdownValue ??= valueOrDefault<String>(
                              _model.localRequestModel?.category,
                              'All',
                            ),
                          ),
                          options: [
                            FFLocalizations.of(context).getText(
                              'kjy4rq5a' /* All */,
                            ),
                            FFLocalizations.of(context).getText(
                              '15465pk3' /* 2021 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'gq9rnwty' /* 2022 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'admfv004' /* 2023 */,
                            ),
                            FFLocalizations.of(context).getText(
                              'hwymgsfq' /* 2024 */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.yearDropdownValue = val);
                            _model.updateLocalRequestModelStruct(
                              (e) => e
                                ..fYear = valueOrDefault<String>(
                                  functions.returnAllDropdownValue(
                                      _model.yearDropdownValue!),
                                  '0',
                                ),
                            );
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
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.appButtonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: AppButtonWidget(
                        title: 'Submit',
                        onButtonTap: () async {
                          await widget.onSubmitClick?.call(
                            widget!.requestModelFromScreen!,
                          );
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
