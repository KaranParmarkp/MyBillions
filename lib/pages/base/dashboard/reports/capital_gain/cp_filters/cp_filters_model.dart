import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/app_button/app_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'cp_filters_widget.dart' show CpFiltersWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CpFiltersModel extends FlutterFlowModel<CpFiltersWidget> {
  ///  Local state fields for this component.

  CapitalGainRequestModelStruct? localRequestModel;
  void updateLocalRequestModelStruct(
      Function(CapitalGainRequestModelStruct) updateFn) {
    updateFn(localRequestModel ??= CapitalGainRequestModelStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for applicantDropdown widget.
  String? applicantDropdownValue;
  FormFieldController<String>? applicantDropdownValueController;
  // State field(s) for categoryDropdown widget.
  String? categoryDropdownValue;
  FormFieldController<String>? categoryDropdownValueController;
  // State field(s) for termDropdown widget.
  String? termDropdownValue;
  FormFieldController<String>? termDropdownValueController;
  // State field(s) for yearDropdown widget.
  String? yearDropdownValue;
  FormFieldController<String>? yearDropdownValueController;
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
}
