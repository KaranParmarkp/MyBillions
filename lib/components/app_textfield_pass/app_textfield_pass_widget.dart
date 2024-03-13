import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_textfield_pass_model.dart';
export 'app_textfield_pass_model.dart';

class AppTextfieldPassWidget extends StatefulWidget {
  const AppTextfieldPassWidget({
    super.key,
    String? hint,
    String? label,
  })  : this.hint = hint ?? ' ',
        this.label = label ?? ' ';

  final String hint;
  final String label;

  @override
  State<AppTextfieldPassWidget> createState() => _AppTextfieldPassWidgetState();
}

class _AppTextfieldPassWidgetState extends State<AppTextfieldPassWidget> {
  late AppTextfieldPassModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppTextfieldPassModel());

    _model.textfieldController ??= TextEditingController();
    _model.textfieldFocusNode ??= FocusNode();

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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
      child: TextFormField(
        controller: _model.textfieldController,
        focusNode: _model.textfieldFocusNode,
        obscureText: !_model.textfieldVisibility,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: FlutterFlowTheme.of(context).bodySmall,
          hintText: widget.hint,
          hintStyle: FlutterFlowTheme.of(context).bodySmall,
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
          suffixIcon: InkWell(
            onTap: () => setState(
              () => _model.textfieldVisibility = !_model.textfieldVisibility,
            ),
            focusNode: FocusNode(skipTraversal: true),
            child: Icon(
              _model.textfieldVisibility
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Color(0xFF757575),
              size: 22.0,
            ),
          ),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium,
        validator: _model.textfieldControllerValidator.asValidator(context),
      ),
    );
  }
}
