import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'app_textfield_pass_widget.dart' show AppTextfieldPassWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppTextfieldPassModel extends FlutterFlowModel<AppTextfieldPassWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for textfield widget.
  FocusNode? textfieldFocusNode;
  TextEditingController? textfieldTextController;
  late bool textfieldVisibility;
  String? Function(BuildContext, String?)? textfieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    textfieldVisibility = false;
  }

  @override
  void dispose() {
    textfieldFocusNode?.dispose();
    textfieldTextController?.dispose();
  }
}
