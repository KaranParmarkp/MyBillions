import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/app_button/app_button_widget.dart';
import '/components/app_textfield/app_textfield_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'financial_question_screen_widget.dart'
    show FinancialQuestionScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FinancialQuestionScreenModel
    extends FlutterFlowModel<FinancialQuestionScreenWidget> {
  ///  Local state fields for this page.

  int currentPageIndex = 0;

  List<String> questions = [
    'What is your expense for this goal (As on date) ?',
    'How long do you have to achieve your financial goal ( in Months)?',
    'How much money are you starting off with ?',
    'How much money do you intend to deposit each month(SIP) ?'
  ];
  void addToQuestions(String item) => questions.add(item);
  void removeFromQuestions(String item) => questions.remove(item);
  void removeAtIndexFromQuestions(int index) => questions.removeAt(index);
  void insertAtIndexInQuestions(int index, String item) =>
      questions.insert(index, item);
  void updateQuestionsAtIndex(int index, Function(String) updateFn) =>
      questions[index] = updateFn(questions[index]);

  List<String> answers = [];
  void addToAnswers(String item) => answers.add(item);
  void removeFromAnswers(String item) => answers.remove(item);
  void removeAtIndexFromAnswers(int index) => answers.removeAt(index);
  void insertAtIndexInAnswers(int index, String item) =>
      answers.insert(index, item);
  void updateAnswersAtIndex(int index, Function(String) updateFn) =>
      answers[index] = updateFn(answers[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for app_textfield component.
  late AppTextfieldModel appTextfieldModel;
  // Model for app_button component.
  late AppButtonModel appButtonModel;
  // Stores action output result for [Backend Call - API (tax saving )] action in app_button widget.
  ApiCallResponse? apiResult;

  @override
  void initState(BuildContext context) {
    appTextfieldModel = createModel(context, () => AppTextfieldModel());
    appButtonModel = createModel(context, () => AppButtonModel());
    appTextfieldModel.textfieldTextControllerValidator =
        _formTextFieldValidator;
  }

  @override
  void dispose() {
    appTextfieldModel.dispose();
    appButtonModel.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3yd162ao' /* Field is required */,
      );
    }

    return null;
  }
}
