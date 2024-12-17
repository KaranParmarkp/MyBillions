import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/app_button/app_button_widget.dart';
import '/components/app_textfield/app_textfield_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/base/profile/personal_details/components/risk_component/risk_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'personal_details_screen_model.dart';
export 'personal_details_screen_model.dart';

class PersonalDetailsScreenWidget extends StatefulWidget {
  const PersonalDetailsScreenWidget({super.key});

  @override
  State<PersonalDetailsScreenWidget> createState() =>
      _PersonalDetailsScreenWidgetState();
}

class _PersonalDetailsScreenWidgetState
    extends State<PersonalDetailsScreenWidget> {
  late PersonalDetailsScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PersonalDetailsScreenModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: MyBillionsApiGroupGroup.codeTypesWithCodeDetailsCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitPulse(
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        final personalDetailsScreenCodeTypesWithCodeDetailsResponse =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).background,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  '17v3oe7v' /* Personal Details */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Lexend',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey('Lexend'),
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: MyBillionsApiGroupGroup.getProfileCall.call(
                            id: currentUserData?.customerId,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 40.0,
                                  height: 40.0,
                                  child: SpinKitPulse(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 40.0,
                                  ),
                                ),
                              );
                            }
                            final containerGetProfileResponse = snapshot.data!;

                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      wrapWithModel(
                                        model: _model.fullNameModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: AppTextfieldWidget(
                                          label: 'Full Name',
                                          initialValue: MyBillionsApiGroupGroup
                                              .getProfileCall
                                              .fullName(
                                            containerGetProfileResponse
                                                .jsonBody,
                                          ),
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.emailModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: AppTextfieldWidget(
                                          label: 'Email',
                                          initialValue: MyBillionsApiGroupGroup
                                              .getProfileCall
                                              .emailID(
                                            containerGetProfileResponse
                                                .jsonBody,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownValueController ??=
                                                  FormFieldController<String>(
                                                _model.dropDownValue ??=
                                                    MyBillionsApiGroupGroup
                                                        .getProfileCall
                                                        .countryCode(
                                                  containerGetProfileResponse
                                                      .jsonBody,
                                                ),
                                              ),
                                              options:
                                                  functions.getCountryCode(),
                                              onChanged: (val) => safeSetState(
                                                  () => _model.dropDownValue =
                                                      val),
                                              width: 100.0,
                                              height: 50.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              elevation: 2.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              borderWidth: 1.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 4.0, 10.0, 4.0),
                                              hidesUnderline: true,
                                              isOverButton: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                              labelText: '',
                                              labelTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily),
                                                      ),
                                            ),
                                          ),
                                          Expanded(
                                            child: wrapWithModel(
                                              model: _model.contactnumberModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: AppTextfieldWidget(
                                                label: 'Contact number',
                                                initialValue:
                                                    MyBillionsApiGroupGroup
                                                        .getProfileCall
                                                        .mobile(
                                                  containerGetProfileResponse
                                                      .jsonBody,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Builder(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: RiskComponentWidget(
                                                      riskScore: int.parse(_model
                                                          .riskScoreModel
                                                          .textfieldTextController
                                                          .text),
                                                      onSaveTap: (score) async {
                                                        safeSetState(() {
                                                          _model
                                                                  .riskScoreModel
                                                                  .textfieldTextController
                                                                  ?.text =
                                                              score!.toString();
                                                          _model.riskScoreModel
                                                              .textfieldFocusNode
                                                              ?.requestFocus();
                                                          WidgetsBinding
                                                              .instance
                                                              .addPostFrameCallback(
                                                                  (_) {
                                                            _model
                                                                    .riskScoreModel
                                                                    .textfieldTextController
                                                                    ?.selection =
                                                                TextSelection
                                                                    .collapsed(
                                                              offset: _model
                                                                  .riskScoreModel
                                                                  .textfieldTextController!
                                                                  .text
                                                                  .length,
                                                            );
                                                          });
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: wrapWithModel(
                                            model: _model.riskScoreModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: AppTextfieldWidget(
                                              label: 'Risk Score',
                                              initialValue:
                                                  MyBillionsApiGroupGroup
                                                      .getProfileCall
                                                      .risk(
                                                        containerGetProfileResponse
                                                            .jsonBody,
                                                      )
                                                      ?.toString(),
                                              readOnly: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 20.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'p8nxyfu8' /* Tax Type */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowRadioButton(
                                                        options: [
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'swyxzzg8' /* Below 30% */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'rhugfwjx' /* Above 30% */,
                                                          )
                                                        ].toList(),
                                                        onChanged: (val) async {
                                                          safeSetState(() {});
                                                          _model.taxTypeCode = functions
                                                              .getCodeFromDesc(
                                                                  MyBillionsApiGroupGroup
                                                                      .codeTypesWithCodeDetailsCall
                                                                      .description(
                                                                        personalDetailsScreenCodeTypesWithCodeDetailsResponse
                                                                            .jsonBody,
                                                                      )!
                                                                      .toList(),
                                                                  _model
                                                                      .radioButtonValue1!);
                                                          safeSetState(() {});
                                                        },
                                                        controller: _model
                                                                .radioButtonValueController1 ??=
                                                            FormFieldController<
                                                                    String>(
                                                                MyBillionsApiGroupGroup
                                                                    .getProfileCall
                                                                    .taxBracket(
                                                          containerGetProfileResponse
                                                              .jsonBody,
                                                        )!),
                                                        optionHeight: 32.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                        selectedTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                        buttonPosition:
                                                            RadioButtonPosition
                                                                .left,
                                                        direction:
                                                            Axis.vertical,
                                                        radioButtonColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        inactiveRadioButtonColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        toggleable: false,
                                                        horizontalAlignment:
                                                            WrapAlignment.start,
                                                        verticalAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 20.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'aodafwim' /* Res Type */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowRadioButton(
                                                        options: [
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'xpxo7l0n' /* Indian */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'fpqe7r2x' /* NRI (USA/Canada) */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'h4akqgwv' /* Other NRI */,
                                                          )
                                                        ].toList(),
                                                        onChanged: (val) async {
                                                          safeSetState(() {});
                                                          _model.resTypeCode = functions
                                                              .getCodeFromDesc(
                                                                  MyBillionsApiGroupGroup
                                                                      .codeTypesWithCodeDetailsCall
                                                                      .description(
                                                                        personalDetailsScreenCodeTypesWithCodeDetailsResponse
                                                                            .jsonBody,
                                                                      )!
                                                                      .toList(),
                                                                  _model
                                                                      .radioButtonValue2!)!;
                                                          safeSetState(() {});
                                                        },
                                                        controller: _model
                                                                .radioButtonValueController2 ??=
                                                            FormFieldController<
                                                                    String>(
                                                                MyBillionsApiGroupGroup
                                                                    .getProfileCall
                                                                    .residencyStatus(
                                                          containerGetProfileResponse
                                                              .jsonBody,
                                                        )!),
                                                        optionHeight: 32.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                        selectedTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                        buttonPosition:
                                                            RadioButtonPosition
                                                                .left,
                                                        direction:
                                                            Axis.vertical,
                                                        radioButtonColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        inactiveRadioButtonColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        toggleable: false,
                                                        horizontalAlignment:
                                                            WrapAlignment.start,
                                                        verticalAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.appButtonModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: AppButtonWidget(
                                          title: 'Update Profile',
                                          onButtonTap: () async {
                                            if (_model.formKey.currentState ==
                                                    null ||
                                                !_model.formKey.currentState!
                                                    .validate()) {
                                              return;
                                            }
                                            if (_model.dropDownValue == null) {
                                              return;
                                            }
                                            if (_model.radioButtonValue1 ==
                                                null) {
                                              return;
                                            }
                                            if (_model.radioButtonValue2 ==
                                                null) {
                                              return;
                                            }
                                            _model.updateProfileAction =
                                                await MyBillionsApiGroupGroup
                                                    .updateProfileCall
                                                    .call(
                                              customerID:
                                                  currentUserData?.customerId,
                                              mobileNumber: _model
                                                  .contactnumberModel
                                                  .textfieldTextController
                                                  .text,
                                              countryCode: _model.dropDownValue,
                                              riskRating: int.tryParse(_model
                                                  .riskScoreModel
                                                  .textfieldTextController
                                                  .text),
                                              email: _model.emailModel
                                                  .textfieldTextController.text,
                                              fullName: _model.fullNameModel
                                                  .textfieldTextController.text,
                                              taxBracketCd: _model.taxTypeCode,
                                              residencyStatuscd:
                                                  _model.resTypeCode,
                                            );

                                            if ((_model.updateProfileAction
                                                    ?.succeeded ??
                                                true)) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Profile updated succesfully.',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            }

                                            safeSetState(() {});
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
