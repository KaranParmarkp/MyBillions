import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/app_button/app_button_widget.dart';
import '/components/app_textfield/app_textfield_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/base/profile/personal_details/components/risk_component/risk_component_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'personal_details_screen_widget.dart' show PersonalDetailsScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PersonalDetailsScreenModel
    extends FlutterFlowModel<PersonalDetailsScreenWidget> {
  ///  Local state fields for this page.

  int? taxTypeCode = 0;

  int resTypeCode = 0;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for fullName.
  late AppTextfieldModel fullNameModel;
  // Model for Email.
  late AppTextfieldModel emailModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for Contactnumber.
  late AppTextfieldModel contactnumberModel;
  // Model for RiskScore.
  late AppTextfieldModel riskScoreModel;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController1;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController2;
  // Model for app_button component.
  late AppButtonModel appButtonModel;
  // Stores action output result for [Backend Call - API (update profile)] action in app_button widget.
  ApiCallResponse? updateProfileAction;

  @override
  void initState(BuildContext context) {
    fullNameModel = createModel(context, () => AppTextfieldModel());
    emailModel = createModel(context, () => AppTextfieldModel());
    contactnumberModel = createModel(context, () => AppTextfieldModel());
    riskScoreModel = createModel(context, () => AppTextfieldModel());
    appButtonModel = createModel(context, () => AppButtonModel());
    fullNameModel.textfieldTextControllerValidator = _formTextFieldValidator1;
    emailModel.textfieldTextControllerValidator = _formTextFieldValidator2;
    contactnumberModel.textfieldTextControllerValidator =
        _formTextFieldValidator3;
    riskScoreModel.textfieldTextControllerValidator = _formTextFieldValidator4;
  }

  @override
  void dispose() {
    fullNameModel.dispose();
    emailModel.dispose();
    contactnumberModel.dispose();
    riskScoreModel.dispose();
    appButtonModel.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rjfunfhv' /* Field is required */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zdcorn8l' /* Field is required */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator3(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'trnvqs7u' /* Field is required */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator4(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ho18gxz2' /* Field is required */,
      );
    }

    return null;
  }

  String? get radioButtonValue1 => radioButtonValueController1?.value;
  String? get radioButtonValue2 => radioButtonValueController2?.value;
}
