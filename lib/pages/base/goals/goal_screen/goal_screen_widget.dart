import '/components/app_bg/app_bg_widget.dart';
import '/components/appbar_logo/appbar_logo_widget.dart';
import '/components/goal_card/goal_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'goal_screen_model.dart';
export 'goal_screen_model.dart';

class GoalScreenWidget extends StatefulWidget {
  const GoalScreenWidget({super.key});

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
                        model: _model.goalCardModel,
                        updateCallback: () => safeSetState(() {}),
                        child: GoalCardWidget(
                          goalOnTap: () async {
                            context.pushNamed('text_saving_screen');
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
