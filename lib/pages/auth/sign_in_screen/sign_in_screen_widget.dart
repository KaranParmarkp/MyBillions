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
import 'sign_in_screen_model.dart';
export 'sign_in_screen_model.dart';

class SignInScreenWidget extends StatefulWidget {
  const SignInScreenWidget({super.key});

  static String routeName = 'sign_in_screen';
  static String routePath = 'signInScreen';

  @override
  State<SignInScreenWidget> createState() => _SignInScreenWidgetState();
}

class _SignInScreenWidgetState extends State<SignInScreenWidget> {
  late SignInScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignInScreenModel());

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
                                      '43t0y3xs' /* Welcome back */,
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
                                  '3fl1m6c9' /* Forgot Password? */,
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
                                    title: 'Login',
                                    onButtonTap: () async {
                                      Function() _navigate = () {};
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      _model.signInResponse =
                                          await MyBillionsApiGroupGroup
                                              .signInCall
                                              .call(
                                        email: _model.emailTexfieldModel
                                            .textfieldTextController.text,
                                        password: _model.appTextfieldPassModel
                                            .textfieldTextController.text,
                                      );

                                      if (MyBillionsApiGroupGroup.signInCall
                                              .customerId(
                                            (_model.signInResponse?.jsonBody ??
                                                ''),
                                          ) !=
                                          null) {
                                        GoRouter.of(context).prepareAuthEvent();
                                        await authManager.signIn(
                                          authenticationToken:
                                              MyBillionsApiGroupGroup.signInCall
                                                  .customerId(
                                                    (_model.signInResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  ?.toString(),
                                          refreshToken:
                                              MyBillionsApiGroupGroup.signInCall
                                                  .customerId(
                                                    (_model.signInResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  ?.toString(),
                                          authUid:
                                              MyBillionsApiGroupGroup.signInCall
                                                  .customerId(
                                                    (_model.signInResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  ?.toString(),
                                          userData: UserModelStruct(
                                            emailId: MyBillionsApiGroupGroup
                                                .signInCall
                                                .emailId(
                                              (_model.signInResponse
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            fullName: MyBillionsApiGroupGroup
                                                .signInCall
                                                .fullName(
                                              (_model.signInResponse
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            customerId: MyBillionsApiGroupGroup
                                                .signInCall
                                                .customerId(
                                              (_model.signInResponse
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            mobile: MyBillionsApiGroupGroup
                                                .signInCall
                                                .mobile(
                                              (_model.signInResponse
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
                                              'Please enter valid email or password.',
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
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(SignUpScreenWidget.routeName);
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
                                        '40jyrp3x' /* Don't have an account? */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
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
                                          24.0, 0.0, 4.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'lncdba6b' /* Create */,
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button-Login pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              'e5q9lvpr' /* Continue as Guest */,
                            ),
                            options: FFButtonOptions(
                              width: 230.0,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
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
