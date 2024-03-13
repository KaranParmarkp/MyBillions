import '/auth/custom_auth/auth_util.dart';
import '/components/app_logo_new/app_logo_new_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appbar_logo_model.dart';
export 'appbar_logo_model.dart';

class AppbarLogoWidget extends StatefulWidget {
  const AppbarLogoWidget({super.key});

  @override
  State<AppbarLogoWidget> createState() => _AppbarLogoWidgetState();
}

class _AppbarLogoWidgetState extends State<AppbarLogoWidget> {
  late AppbarLogoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppbarLogoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: wrapWithModel(
              model: _model.appLogoNewModel,
              updateCallback: () => setState(() {}),
              child: AppLogoNewWidget(
                showPadding: false,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
          child: FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).secondary,
            borderRadius: 100.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.logout_outlined,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 25.0,
            ),
            onPressed: () async {
              GoRouter.of(context).prepareAuthEvent();
              await authManager.signOut();
              GoRouter.of(context).clearRedirectLocation();

              context.goNamedAuth('sign_in_screen', context.mounted);
            },
          ),
        ),
      ],
    );
  }
}
