import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/app_button/app_button_widget.dart';
import '/components/app_textfield/app_textfield_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'personal_details_screen_widget.dart' show PersonalDetailsScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PersonalDetailsScreenModel
    extends FlutterFlowModel<PersonalDetailsScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for fullName.
  late AppTextfieldModel fullNameModel;
  // Model for Email.
  late AppTextfieldModel emailModel;
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

  @override
  void initState(BuildContext context) {
    fullNameModel = createModel(context, () => AppTextfieldModel());
    emailModel = createModel(context, () => AppTextfieldModel());
    contactnumberModel = createModel(context, () => AppTextfieldModel());
    riskScoreModel = createModel(context, () => AppTextfieldModel());
    appButtonModel = createModel(context, () => AppButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    fullNameModel.dispose();
    emailModel.dispose();
    contactnumberModel.dispose();
    riskScoreModel.dispose();
    appButtonModel.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue1 => radioButtonValueController1?.value;
  String? get radioButtonValue2 => radioButtonValueController2?.value;
}
