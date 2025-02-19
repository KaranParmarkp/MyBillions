import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/app_button/app_button_widget.dart';
import '/components/app_textfield/app_textfield_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'text_saving_questions_screen_model.dart';
export 'text_saving_questions_screen_model.dart';

class TextSavingQuestionsScreenWidget extends StatefulWidget {
  const TextSavingQuestionsScreenWidget({
    super.key,
    required this.planName,
  });

  final String? planName;

  @override
  State<TextSavingQuestionsScreenWidget> createState() =>
      _TextSavingQuestionsScreenWidgetState();
}

class _TextSavingQuestionsScreenWidgetState
    extends State<TextSavingQuestionsScreenWidget> {
  late TextSavingQuestionsScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextSavingQuestionsScreenModel());

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
              'w6dstkck' /*   */,
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
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Text(
                        _model.questions
                            .elementAtOrNull(_model.currentPageIndex)!,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.appTextfieldModel,
                    updateCallback: () => safeSetState(() {}),
                    child: AppTextfieldWidget(
                      hint: 'answer',
                      label: 'answer',
                      initialValue: '',
                      readOnly: false,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.appButtonModel,
                    updateCallback: () => safeSetState(() {}),
                    child: AppButtonWidget(
                      title: 'Next',
                      onButtonTap: () async {
                        if (_model.currentPageIndex != 1) {
                          _model.currentPageIndex = _model.currentPageIndex + 1;
                          _model.addToAnswers(_model
                              .appTextfieldModel.textfieldTextController.text);
                          safeSetState(() {});
                          safeSetState(() {
                            _model.appTextfieldModel.textfieldTextController
                                ?.text = '';
                          });
                        } else {
                          _model.addToAnswers(_model
                              .appTextfieldModel.textfieldTextController.text);
                          safeSetState(() {});
                          _model.apiResult =
                              await MyBillionsApiGroupGroup.taxSavingCall.call(
                            codeID: 5,
                            customerID: currentUserData?.customerId,
                            planName: widget!.planName,
                            planquestionanswers: functions
                                .savePlanFunction(_model.answers.toList()),
                          );

                          if ((_model.apiResult?.succeeded ?? true)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Goal created succesfully.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor:
                                    FlutterFlowTheme.of(context).secondary,
                              ),
                            );

                            context.goNamed('dashboard_screen');
                          }
                        }

                        safeSetState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
