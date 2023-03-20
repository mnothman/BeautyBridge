import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/disability/disability_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'features_model.dart';
export 'features_model.dart';

class FeaturesWidget extends StatefulWidget {
  const FeaturesWidget({
    Key? key,
    this.toDoNote,
  }) : super(key: key);

  final DocumentReference? toDoNote;

  @override
  _FeaturesWidgetState createState() => _FeaturesWidgetState();
}

class _FeaturesWidgetState extends State<FeaturesWidget> {
  late FeaturesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FeaturesModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ToDoListRecord>(
      stream: ToDoListRecord.getDocument(widget.toDoNote!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final featuresToDoListRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFAF1F4F8),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DisabilityWidget(),
                ),
              );
            },
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            elevation: 8.0,
            child: Icon(
              Icons.arrow_forward_outlined,
              color: FlutterFlowTheme.of(context).white,
              size: 28.0,
            ),
          ),
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
            ),
            title: Align(
              alignment: AlignmentDirectional(-0.35, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'pdwx8rq6' /* Features */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Outfit',
                      color: Colors.black,
                      fontSize: 45.0,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Color(0x230E151B),
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Color(0xFF95A1AC),
                  ),
                  child: CheckboxListTile(
                    value: _model.checkboxListTileValue1 ??= true,
                    onChanged: (newValue) async {
                      setState(() => _model.checkboxListTileValue1 = newValue!);
                    },
                    title: Text(
                      FFLocalizations.of(context).getText(
                        '0b2l02w0' /* Feature 1 */,
                      ),
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        'ceaw49il' /* Freckles */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    activeColor: FlutterFlowTheme.of(context).primaryColor,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Color(0xFF95A1AC),
                  ),
                  child: CheckboxListTile(
                    value: _model.checkboxListTileValue2 ??= true,
                    onChanged: (newValue) async {
                      setState(() => _model.checkboxListTileValue2 = newValue!);
                    },
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'n0wqz89t' /* Feature 2 */,
                      ),
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        'savyyxv2' /* Acne scars */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    activeColor: FlutterFlowTheme.of(context).primaryColor,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Color(0xFF95A1AC),
                  ),
                  child: CheckboxListTile(
                    value: _model.checkboxListTileValue3 ??= true,
                    onChanged: (newValue) async {
                      setState(() => _model.checkboxListTileValue3 = newValue!);
                    },
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'gkk4cg2m' /* Feature 3 */,
                      ),
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        's890chax' /* Dry skin */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    activeColor: FlutterFlowTheme.of(context).primaryColor,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Color(0xFF95A1AC),
                  ),
                  child: CheckboxListTile(
                    value: _model.checkboxListTileValue4 ??= true,
                    onChanged: (newValue) async {
                      setState(() => _model.checkboxListTileValue4 = newValue!);
                    },
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'feohg242' /* Feature 4 */,
                      ),
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        'zp7j4fo0' /* Dry lips */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    activeColor: FlutterFlowTheme.of(context).primaryColor,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Color(0xFF95A1AC),
                  ),
                  child: CheckboxListTile(
                    value: _model.checkboxListTileValue5 ??= true,
                    onChanged: (newValue) async {
                      setState(() => _model.checkboxListTileValue5 = newValue!);
                    },
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'jmtb9tql' /* Feature 5 */,
                      ),
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        '95x3p98v' /* Skin tags */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    activeColor: FlutterFlowTheme.of(context).primaryColor,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Color(0xFF95A1AC),
                  ),
                  child: CheckboxListTile(
                    value: _model.checkboxListTileValue6 ??= true,
                    onChanged: (newValue) async {
                      setState(() => _model.checkboxListTileValue6 = newValue!);
                    },
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'vfuyq9sk' /* Feature 6 */,
                      ),
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        'bwfxahft' /* example */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    activeColor: FlutterFlowTheme.of(context).primaryColor,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Color(0xFF95A1AC),
                  ),
                  child: CheckboxListTile(
                    value: _model.checkboxListTileValue7 ??= true,
                    onChanged: (newValue) async {
                      setState(() => _model.checkboxListTileValue7 = newValue!);
                    },
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'fmff9jap' /* Feature 7 */,
                      ),
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        'k1m8gbxl' /* example */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    activeColor: FlutterFlowTheme.of(context).primaryColor,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Color(0xFF95A1AC),
                  ),
                  child: CheckboxListTile(
                    value: _model.checkboxListTileValue8 ??= true,
                    onChanged: (newValue) async {
                      setState(() => _model.checkboxListTileValue8 = newValue!);
                    },
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'dmq6wyj5' /* Feature 8 */,
                      ),
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        '7z5x6u86' /* example */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    activeColor: FlutterFlowTheme.of(context).primaryColor,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Color(0xFF95A1AC),
                  ),
                  child: CheckboxListTile(
                    value: _model.checkboxListTileValue9 ??= true,
                    onChanged: (newValue) async {
                      setState(() => _model.checkboxListTileValue9 = newValue!);
                    },
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'f8zp09gg' /* Feature 9 */,
                      ),
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        'vpgp4glf' /* example */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    activeColor: FlutterFlowTheme.of(context).primaryColor,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Color(0xFF95A1AC),
                  ),
                  child: CheckboxListTile(
                    value: _model.checkboxListTileValue10 ??= true,
                    onChanged: (newValue) async {
                      setState(
                          () => _model.checkboxListTileValue10 = newValue!);
                    },
                    title: Text(
                      FFLocalizations.of(context).getText(
                        '28yv1eoc' /* Feature 10 */,
                      ),
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        'h29m8dc8' /* example */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    activeColor: FlutterFlowTheme.of(context).primaryColor,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Color(0xFF95A1AC),
                  ),
                  child: CheckboxListTile(
                    value: _model.checkboxListTileValue11 ??= true,
                    onChanged: (newValue) async {
                      setState(
                          () => _model.checkboxListTileValue11 = newValue!);
                    },
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'kbt01zj8' /* Other: */,
                      ),
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    subtitle: Text(
                      FFLocalizations.of(context).getText(
                        '0b3u7u8z' /* type below */,
                      ),
                      style: FlutterFlowTheme.of(context).subtitle2,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    activeColor: FlutterFlowTheme.of(context).primaryColor,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
                TextFormField(
                  controller: _model.textController,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: FFLocalizations.of(context).getText(
                      'oemevj2a' /* Type other here: */,
                    ),
                    hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily: 'Outfit',
                          fontSize: 20.0,
                        ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
