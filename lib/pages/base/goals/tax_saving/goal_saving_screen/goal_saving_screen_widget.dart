import '../goal_saving_questions_screen/goal_saving_questions_screen_widget.dart';
import '/components/app_button/app_button_widget.dart';
import '/components/app_textfield/app_textfield_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'goal_saving_screen_model.dart';
export 'goal_saving_screen_model.dart';

class GoalSavingScreenWidget extends StatefulWidget {
  const GoalSavingScreenWidget({super.key, required this.goalIndex});

  static String routeName = 'goal_saving_screen';
  static String routePath = 'goalSavingScreen';
  final int goalIndex;
  @override
  State<GoalSavingScreenWidget> createState() => _GoalSavingScreenWidgetState();
}

class _GoalSavingScreenWidgetState extends State<GoalSavingScreenWidget> {
  late GoalSavingScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoalSavingScreenModel());

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
              't36ufelx' /*   */,
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
                        "Write a name for ${widget.goalIndex==1?"Tax":"Dynamic"} saving plan.",
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 30.0,
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
                      hint: ' answer',
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
                        _model.formResult = true;
                        if (_model.formKey.currentState == null ||
                            !_model.formKey.currentState!.validate()) {
                          safeSetState(() => _model.formResult = false);
                          return;
                        }

                        context.pushNamed(
                          GoalSavingQuestionsScreenWidget.routeName,
                          queryParameters: {
                            'planName': serializeParam(
                              _model.appTextfieldModel.textfieldTextController
                                  .text,
                              ParamType.String,
                            ),
                            "goalIndex":serializeParam(
                              widget.goalIndex,
                              ParamType.int,
                            )
                          }.withoutNulls,
                        );

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
