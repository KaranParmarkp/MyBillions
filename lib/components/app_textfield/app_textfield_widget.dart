import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_textfield_model.dart';
export 'app_textfield_model.dart';

class AppTextfieldWidget extends StatefulWidget {
  const AppTextfieldWidget({
    super.key,
    String? hint,
    String? label,
    this.initialValue,
    bool? readOnly,
  })  : this.hint = hint ?? ' ',
        this.label = label ?? ' ',
        this.readOnly = readOnly ?? false;

  final String hint;
  final String label;
  final String? initialValue;
  final bool readOnly;

  @override
  State<AppTextfieldWidget> createState() => _AppTextfieldWidgetState();
}

class _AppTextfieldWidgetState extends State<AppTextfieldWidget> {
  late AppTextfieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppTextfieldModel());

    _model.textfieldTextController ??=
        TextEditingController(text: widget!.initialValue);
    _model.textfieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
      child: TextFormField(
        controller: _model.textfieldTextController,
        focusNode: _model.textfieldFocusNode,
        readOnly: widget!.readOnly,
        obscureText: false,
        decoration: InputDecoration(
          labelText: widget!.label,
          labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
              ),
          hintText: widget!.hint,
          hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).textColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primaryText,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          contentPadding:
              EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
              letterSpacing: 0.0,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
            ),
        cursorColor: FlutterFlowTheme.of(context).primaryText,
        validator: _model.textfieldTextControllerValidator.asValidator(context),
      ),
    );
  }
}
