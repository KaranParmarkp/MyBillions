import '/backend/api_requests/api_calls.dart';
import '/components/app_bg_new/app_bg_new_widget.dart';
import '/components/app_button/app_button_widget.dart';
import '/components/app_logo_new/app_logo_new_widget.dart';
import '/components/app_textfield/app_textfield_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reset_password_screen_model.dart';
export 'reset_password_screen_model.dart';

class ResetPasswordScreenWidget extends StatefulWidget {
  const ResetPasswordScreenWidget({
    super.key,
    required this.email,
  });

  final String? email;

  static String routeName = 'reset_password_screen';
  static String routePath = 'resetPasswordScreen';

  @override
  State<ResetPasswordScreenWidget> createState() =>
      _ResetPasswordScreenWidgetState();
}

class _ResetPasswordScreenWidgetState extends State<ResetPasswordScreenWidget> {
  late ResetPasswordScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResetPasswordScreenModel());

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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'idx79yiw' /* Reset Password */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
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
                        model: _model.securityCodeModel,
                        updateCallback: () => safeSetState(() {}),
                        child: AppTextfieldWidget(
                          hint: 'Enter security code',
                          label: 'Security code',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.newPasswordModel,
                        updateCallback: () => safeSetState(() {}),
                        child: AppTextfieldWidget(
                          hint: 'Enter new password',
                          label: 'New password',
                        ),
                      ),
                      wrapWithModel(
                        model: _model.confNewPasswordModel,
                        updateCallback: () => safeSetState(() {}),
                        child: AppTextfieldWidget(
                          hint: 'Enter confirm new password',
                          label: 'Confirm new password',
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: wrapWithModel(
                                model: _model.appButtonModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: AppButtonWidget(
                                  title: 'Cancel',
                                  onButtonTap: () async {
                                    context.safePop();
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.appButtonModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: AppButtonWidget(
                                  title: 'Submit',
                                  onButtonTap: () async {
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    if (_model.newPasswordModel
                                            .textfieldTextController.text !=
                                        _model.confNewPasswordModel
                                            .textfieldTextController.text) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'New pasword and confirm new password should be same.',
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
                                                  .primaryBackground,
                                        ),
                                      );
                                    } else {
                                      _model.resetApiResponse =
                                          await MyBillionsApiGroupGroup
                                              .resetPasswordCall
                                              .call(
                                        securitycode: _model.securityCodeModel
                                            .textfieldTextController.text,
                                        email: widget!.email,
                                        newPassword: _model.newPasswordModel
                                            .textfieldTextController.text,
                                      );

                                      if (MyBillionsApiGroupGroup
                                              .resetPasswordCall
                                              .responseCode(
                                            (_model.resetApiResponse
                                                    ?.jsonBody ??
                                                ''),
                                          ) ==
                                          '1') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              MyBillionsApiGroupGroup
                                                  .resetPasswordCall
                                                  .responseMessage(
                                                (_model.resetApiResponse
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

                                        context.goNamed(
                                            SignInScreenWidget.routeName);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              MyBillionsApiGroupGroup
                                                  .resetPasswordCall
                                                  .responseMessage(
                                                (_model.resetApiResponse
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
                                    }

                                    safeSetState(() {});
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
