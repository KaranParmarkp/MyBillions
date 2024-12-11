import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/app_button/app_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'pf_filters_widget.dart' show PfFiltersWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PfFiltersModel extends FlutterFlowModel<PfFiltersWidget> {
  ///  Local state fields for this component.

  PortfolioRequestModelStruct? localRequestModel;
  void updateLocalRequestModelStruct(
      Function(PortfolioRequestModelStruct) updateFn) {
    updateFn(localRequestModel ??= PortfolioRequestModelStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for applicantDropdown widget.
  String? applicantDropdownValue;
  FormFieldController<String>? applicantDropdownValueController;
  // State field(s) for goalsDropdown widget.
  String? goalsDropdownValue;
  FormFieldController<String>? goalsDropdownValueController;
  // State field(s) for categoryDropdown widget.
  String? categoryDropdownValue;
  FormFieldController<String>? categoryDropdownValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Model for app_button component.
  late AppButtonModel appButtonModel;

  @override
  void initState(BuildContext context) {
    appButtonModel = createModel(context, () => AppButtonModel());
  }

  @override
  void dispose() {
    appButtonModel.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
