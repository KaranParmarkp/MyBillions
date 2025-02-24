import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/app_bg_new/app_bg_new_widget.dart';
import '/components/app_button/app_button_widget.dart';
import '/components/app_logo_new/app_logo_new_widget.dart';
import '/components/app_textfield/app_textfield_widget.dart';
import '/components/app_textfield_pass/app_textfield_pass_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sign_up_screen_model.dart';
export 'sign_up_screen_model.dart';

class SignUpScreenWidget extends StatefulWidget {
  const SignUpScreenWidget({super.key});

  static String routeName = 'sign_up_screen';
  static String routePath = 'signUpScreen';

  @override
  State<SignUpScreenWidget> createState() => _SignUpScreenWidgetState();
}

class _SignUpScreenWidgetState extends State<SignUpScreenWidget> {
  late SignUpScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpScreenModel());

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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Stack(
          children: [
            wrapWithModel(
              model: _model.appBgNewModel,
              updateCallback: () => safeSetState(() {}),
              child: AppBgNewWidget(),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(),
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 40.0, 20.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.appLogoNewModel,
                            updateCallback: () => safeSetState(() {}),
                            child: AppLogoNewWidget(
                              showPadding: true,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '0n02yfyh' /* Register */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .displaySmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmallFamily),
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        wrapWithModel(
                          model: _model.firstNameModel,
                          updateCallback: () => safeSetState(() {}),
                          child: AppTextfieldWidget(
                            hint: 'Enter your firstname',
                            label: 'Enter firstname',
                          ),
                        ),
                        wrapWithModel(
                          model: _model.lastNameModel,
                          updateCallback: () => safeSetState(() {}),
                          child: AppTextfieldWidget(
                            hint: 'Enter your lastname',
                            label: 'Enter lastname',
                          ),
                        ),
                        wrapWithModel(
                          model: _model.phoneNumberModel,
                          updateCallback: () => safeSetState(() {}),
                          child: AppTextfieldWidget(
                            hint: 'Enter your phone number',
                            label: 'Enter phone number',
                          ),
                        ),
                        wrapWithModel(
                          model: _model.emailTexfieldModel,
                          updateCallback: () => safeSetState(() {}),
                          child: AppTextfieldWidget(
                            hint: 'Enter your email',
                            label: 'Enter email',
                          ),
                        ),
                        wrapWithModel(
                          model: _model.appTextfieldPassModel,
                          updateCallback: () => safeSetState(() {}),
                          child: AppTextfieldPassWidget(
                            hint: 'Enter your password',
                            label: 'Enter password',
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 24.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed(
                                      ForgotPasswordScreenWidget.routeName);
                                },
                                text: FFLocalizations.of(context).getText(
                                  '9psf6yrm' /* Forgot Password? */,
                                ),
                                options: FFButtonOptions(
                                  width: 170.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0x001A1F24),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodySmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.appButtonModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AppButtonWidget(
                                    title: 'Register',
                                    onButtonTap: () async {
                                      Function() _navigate = () {};
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      _model.signUpResponse =
                                          await MyBillionsApiGroupGroup
                                              .signUpCall
                                              .call(
                                        email: _model.emailTexfieldModel
                                            .textfieldTextController.text,
                                        countryCode: '91',
                                        mobileNumber: _model.phoneNumberModel
                                            .textfieldTextController.text,
                                        password: _model.appTextfieldPassModel
                                            .textfieldTextController.text,
                                        fullName:
                                            '${_model.firstNameModel.textfieldTextController.text} ${_model.lastNameModel.textfieldTextController.text}',
                                      );

                                      if (MyBillionsApiGroupGroup.signUpCall
                                              .responseCode(
                                            (_model.signUpResponse?.jsonBody ??
                                                ''),
                                          ) ==
                                          '1') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              MyBillionsApiGroupGroup.signUpCall
                                                  .responseMessage(
                                                (_model.signUpResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )!,
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                        GoRouter.of(context).prepareAuthEvent();
                                        await authManager.signIn(
                                          authenticationToken:
                                              MyBillionsApiGroupGroup.signUpCall
                                                  .customerId(
                                                    (_model.signUpResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  ?.toString(),
                                          refreshToken:
                                              MyBillionsApiGroupGroup.signUpCall
                                                  .customerId(
                                                    (_model.signUpResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  ?.toString(),
                                          authUid:
                                              MyBillionsApiGroupGroup.signUpCall
                                                  .customerId(
                                                    (_model.signUpResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  ?.toString(),
                                          userData: UserModelStruct(
                                            emailId: MyBillionsApiGroupGroup
                                                .signUpCall
                                                .customerEmail(
                                              (_model.signUpResponse
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            fullName: MyBillionsApiGroupGroup
                                                .signUpCall
                                                .customerFullName(
                                              (_model.signUpResponse
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            customerId: MyBillionsApiGroupGroup
                                                .signUpCall
                                                .customerId(
                                              (_model.signUpResponse
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            mobile: MyBillionsApiGroupGroup
                                                .signUpCall
                                                .customerMobile(
                                              (_model.signUpResponse
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                          ),
                                        );
                                        _navigate = () => context.goNamedAuth(
                                            DashboardScreenWidget.routeName,
                                            context.mounted);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              MyBillionsApiGroupGroup.signUpCall
                                                  .responseMessage(
                                                (_model.signUpResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )!,
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      }

                                      _navigate();

                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 50.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.goNamed(SignInScreenWidget.routeName);
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'o1xk7b0j' /* Already have an account? */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 4.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'ps110ezr' /* Login */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
