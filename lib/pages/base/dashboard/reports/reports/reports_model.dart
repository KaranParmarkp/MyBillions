import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/base/dashboard/reports/portfolio_allocation/portfolio_allocation_screen/portfolio_allocation_screen_widget.dart';
import '/pages/base/dashboard/reports/portfolio_summery/portfolio_list/portfolio_list_widget.dart';
import 'reports_widget.dart' show ReportsWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReportsModel extends FlutterFlowModel<ReportsWidget> {
  ///  Local state fields for this component.

  String currentSelected = 'Portfolio Summary';

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for portfolio_list component.
  late PortfolioListModel portfolioListModel;
  // Model for portfolio_allocation_screen component.
  late PortfolioAllocationScreenModel portfolioAllocationScreenModel;

  @override
  void initState(BuildContext context) {
    portfolioListModel = createModel(context, () => PortfolioListModel());
    portfolioAllocationScreenModel =
        createModel(context, () => PortfolioAllocationScreenModel());
  }

  @override
  void dispose() {
    portfolioListModel.dispose();
    portfolioAllocationScreenModel.dispose();
  }
}
