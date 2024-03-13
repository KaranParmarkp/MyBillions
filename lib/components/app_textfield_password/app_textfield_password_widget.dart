import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_textfield_password_model.dart';
export 'app_textfield_password_model.dart';

class AppTextfieldPasswordWidget extends StatefulWidget {
  const AppTextfieldPasswordWidget({
    super.key,
    String? hint,
  }) : this.hint = hint ?? ' ';

  final String hint;

  @override
  State<AppTextfieldPasswordWidget> createState() =>
      _AppTextfieldPasswordWidgetState();
}

class _AppTextfieldPasswordWidgetState
    extends State<AppTextfieldPasswordWidget> {
  late AppTextfieldPasswordModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppTextfieldPasswordModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
      child: TextFormField(
        controller: _model.textController,
        focusNode: _model.textFieldFocusNode,
        autofocus: true,
        obscureText: !_model.passwordVisibility,
        decoration: InputDecoration(
          labelStyle: FlutterFlowTheme.of(context).labelMedium,
          hintText: widget.hint,
          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                color: FlutterFlowTheme.of(context).accent2,
                useGoogleFonts: GoogleFonts.asMap().containsKey(
                    FlutterFlowTheme.of(context).labelMediumFamily),
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x4D7A7A7A),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0x337A7A7A),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          fillColor: Color(0x197A7A7A),
          suffixIcon: InkWell(
            onTap: () => setState(
              () => _model.passwordVisibility = !_model.passwordVisibility,
            ),
            focusNode: FocusNode(skipTraversal: true),
            child: Icon(
              _model.passwordVisibility
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 20.0,
            ),
          ),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium,
        cursorColor: FlutterFlowTheme.of(context).primaryText,
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
