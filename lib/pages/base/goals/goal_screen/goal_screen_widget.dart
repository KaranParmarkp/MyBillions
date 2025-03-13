import '/components/app_bg/app_bg_widget.dart';
import '/components/appbar_logo/appbar_logo_widget.dart';
import '/components/goal_card/goal_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'goal_screen_model.dart';
export 'goal_screen_model.dart';

class GoalScreenWidget extends StatefulWidget {
  const GoalScreenWidget({super.key});

  static String routeName = 'goal_screen';
  static String routePath = 'goalScreen';

  @override
  State<GoalScreenWidget> createState() => _GoalScreenWidgetState();
}

class _GoalScreenWidgetState extends State<GoalScreenWidget> {
  late GoalScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoalScreenModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  /// GOAL INDEX BELOW
  /// 1 for tax saving
  /// 2 for dynamic saving
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.appbarLogoModel,
                      updateCallback: () => safeSetState(() {}),
                      child: AppbarLogoWidget(),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: wrapWithModel(
                        model: _model.taxSavingGoalModel,
                        updateCallback: () => safeSetState(() {}),
                        child: GoalCardWidget(
                          title: 'Tax Saving',
                          desc:
                              'Save up to Rs. 45,000 in taxes by investing into the best tax saving funds, backed by our research',
                          goalOnTap: () async {
                            context.pushNamed(GoalSavingScreenWidget.routeName,queryParameters: {
                              'goalIndex': serializeParam(
                                1,
                                ParamType.int,
                              ),
                            }.withoutNulls,);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: wrapWithModel(
                        model: _model.financialGoalModel,
                        updateCallback: () => safeSetState(() {}),
                        child: GoalCardWidget(
                          title: 'Financial Goal',
                          desc:
                              'Whatever be your financial goals and time horizon, we will help you invest into the best portfolio, to ensure that you achieve your targets',
                          goalOnTap: () async {
                            context.pushNamed(FinancialScreenWidget.routeName);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: wrapWithModel(
                        model: _model.financialGoalModel,
                        updateCallback: () => safeSetState(() {}),
                        child: GoalCardWidget(
                          title: 'Dynamic Savings Account',
                          desc:
                          'Our liquid fund portfolio ensures best returns (in the class) on money parked for the short-term',
                          goalOnTap: () async {
                            context.pushNamed(GoalSavingScreenWidget.routeName,queryParameters: {
                              'goalIndex': serializeParam(
                                2,
                                ParamType.int,
                              ),
                            }.withoutNulls,);
                          },
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
    );
  }
}
