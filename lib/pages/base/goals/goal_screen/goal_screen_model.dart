import '/components/app_bg/app_bg_widget.dart';
import '/components/appbar_logo/appbar_logo_widget.dart';
import '/components/goal_card/goal_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'goal_screen_widget.dart' show GoalScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GoalScreenModel extends FlutterFlowModel<GoalScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for app_bg component.
  late AppBgModel appBgModel;
  // Model for appbar_logo component.
  late AppbarLogoModel appbarLogoModel;
  // Model for tax_saving_goal.
  late GoalCardModel taxSavingGoalModel;
  // Model for financial_goal.
  late GoalCardModel financialGoalModel;

  @override
  void initState(BuildContext context) {
    appBgModel = createModel(context, () => AppBgModel());
    appbarLogoModel = createModel(context, () => AppbarLogoModel());
    taxSavingGoalModel = createModel(context, () => GoalCardModel());
    financialGoalModel = createModel(context, () => GoalCardModel());
  }

  @override
  void dispose() {
    appBgModel.dispose();
    appbarLogoModel.dispose();
    taxSavingGoalModel.dispose();
    financialGoalModel.dispose();
  }
}
