import '/backend/schema/structs/index.dart';
import '/components/app_bg/app_bg_widget.dart';
import '/components/app_logo_new_2/app_logo_new2_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/base/dashboard/financial_summary/financial_summary/financial_summary_widget.dart';
import '/pages/base/dashboard/recommendations/recommendations_list/recommendations_list_widget.dart';
import '/pages/base/dashboard/reports/reports/reports_widget.dart';
import '/pages/base/dashboard/trend_analysis/trend_analysis_screen/trend_analysis_screen_widget.dart';
import 'dashboard_screen_widget.dart' show DashboardScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardScreenModel extends FlutterFlowModel<DashboardScreenWidget> {
  ///  Local state fields for this page.

  String currentSelected = 'Financial Summery';

  PortfolioRequestModelStruct? localModel;
  void updateLocalModelStruct(Function(PortfolioRequestModelStruct) updateFn) {
    updateFn(localModel ??= PortfolioRequestModelStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Model for app_bg component.
  late AppBgModel appBgModel;
  // Model for app_logo_new_2 component.
  late AppLogoNew2Model appLogoNew2Model;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for financial_summary component.
  late FinancialSummaryModel financialSummaryModel;
  // Model for recommendations_list component.
  late RecommendationsListModel recommendationsListModel;
  // Model for reports component.
  late ReportsModel reportsModel;
  // Model for trend_analysis_screen component.
  late TrendAnalysisScreenModel trendAnalysisScreenModel;

  @override
  void initState(BuildContext context) {
    appBgModel = createModel(context, () => AppBgModel());
    appLogoNew2Model = createModel(context, () => AppLogoNew2Model());
    financialSummaryModel = createModel(context, () => FinancialSummaryModel());
    recommendationsListModel =
        createModel(context, () => RecommendationsListModel());
    reportsModel = createModel(context, () => ReportsModel());
    trendAnalysisScreenModel =
        createModel(context, () => TrendAnalysisScreenModel());
  }

  @override
  void dispose() {
    appBgModel.dispose();
    appLogoNew2Model.dispose();
    financialSummaryModel.dispose();
    recommendationsListModel.dispose();
    reportsModel.dispose();
    trendAnalysisScreenModel.dispose();
  }
}
