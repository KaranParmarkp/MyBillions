import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_billions/auth/custom_auth/auth_util.dart';
import 'package:my_billions/backend/schema/structs/index.dart';
import 'package:my_billions/pages/base/dashboard/reports/transaction_report/transaction_report_filters/transaction_report_filters_widget.dart';

import '../../../../../backend/api_requests/api_calls.dart';
import '../../../../../flutter_flow/flutter_flow_icon_button.dart';
import '../../../../../flutter_flow/flutter_flow_theme.dart';
import '../../../../../flutter_flow/flutter_flow_util.dart';
import '../pf_filters/pf_filters_widget.dart';

class TransactionReportList extends StatefulWidget {
  const TransactionReportList({super.key});

  @override
  State<TransactionReportList> createState() => _TransactionReportListState();
}

class _TransactionReportListState extends State<TransactionReportList> {
  Future<ApiCallResponse>? _future;
  PortfolioRequestModelStruct? _modelStruct;

  @override
  void initState() {
    super.initState();
    _modelStruct = _defaultFilter();
    _future = fetchData(); // Call API once
  }

  fetchData() {
    return MyBillionsApiGroupGroup.transactionReportCall.call(
      customerId: currentUser!.userData!.customerId.toString(),
      //allFolio: _modelStruct!.allFolio!,
      category: _modelStruct?.category,
      clientCode: _modelStruct?.clientCode,
      customerPlanId: _modelStruct?.customderPlanId,
      transactionType: _modelStruct?.transactionType,
      startDate: _modelStruct?.startdate,
      endDate: _modelStruct?.enddate,
      folioNo: _modelStruct?.folioNumber,
      fundHouse: _modelStruct?.fundHouse,
      schemeCode: _modelStruct?.SchemeCode,
    );
  }

  _defaultFilter() {
    return PortfolioRequestModelStruct(
      endDateTime: getCurrentTimestamp,
      startDateTime: DateTime.fromMicrosecondsSinceEpoch(1547577000000000),
      startdate: '16/1/2019',
      enddate: dateTimeFormat(
        "d/M/y",
        getCurrentTimestamp,
        //locale: FFLocalizations.of(context).languageCode,
      ),
      allFolioName: "AllNonFolio",
      category: '',
      customerPlainId: "0",
      clientCode: "0",
      customerId: currentUserData?.customerId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      /*future: MyBillionsApiGroupGroup.transactionReportCall.call(
          customerId: currentUser!.userData!.customerId.toString(),
        ),*/
      //future: _future,
      future: MyBillionsApiGroupGroup.transactionReportCall.call(
          customerId: currentUser!.userData!.customerId.toString(),
          //allFolio: _modelStruct!.allFolio!,
          category: _modelStruct?.category,
          clientCode: _modelStruct?.clientCode,
          customerPlanId: _modelStruct?.customderPlanId,
          transactionType: _modelStruct?.transactionType,
          startDate: _modelStruct?.startdate,
          endDate: _modelStruct?.enddate,
          folioNo: _modelStruct?.folioNumber,
          fundHouse: _modelStruct?.fundHouse,
          schemeCode: _modelStruct?.SchemeCode,
          investorId: _modelStruct?.investorId.toString(),
          planId: _modelStruct?.planID.toString(),
          schemeName: _modelStruct?.schemeName.toString(),
          allFolio: _modelStruct?.allFolioName),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40.0,
              height: 40.0,
              child: SpinKitPulse(
                color: FlutterFlowTheme.of(context).secondary,
                size: 40.0,
              ),
            ),
          );
        }
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          TransactionReportModel? transactionReportModel =
              TransactionReportModel.fromJson(snapshot.data!.jsonBody);
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.filter_alt,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        isDismissible: false,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: TransactionReportFiltersWidget(
                              requestModelFromScreen: _modelStruct,
                              onSubmitClick: (filtersRequestModel) async {
                                _modelStruct = filtersRequestModel;
                                setState(() {});
                              },
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                  ),
                ],
              ),

              ///Summery
              _buildTransactionReportSummery(
                  transactionReportModel.summaries!.first),
              Expanded(
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  margin: const EdgeInsets.only(top: 10),
                  //height: MediaQuery.sizeOf(context).height * 0.4,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 100,
                                  decoration: const BoxDecoration(),
                                  child: Text(
                                    "Purchase Date",
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  decoration: const BoxDecoration(),
                                  child: Text(
                                    "Transaction Type",
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  decoration: const BoxDecoration(),
                                  child: Text(
                                    "Purchase Price(INR)",
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  decoration: const BoxDecoration(),
                                  child: Text(
                                    "Amount(INR)",
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  decoration: const BoxDecoration(),
                                  child: Text(
                                    "Unit/No.",
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  decoration: const BoxDecoration(),
                                  child: Text(
                                    "Balance",
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: List.generate(
                                        transactionReportModel.investorObj
                                            .investors.length, (investorIndex) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          /// investor name below
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            child: Text(
                                              "Client Name: ${transactionReportModel.investorObj.investors[investorIndex].investorName}",
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ),

                                          /// scheme type below
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: List.generate(
                                              transactionReportModel
                                                  .investorObj
                                                  .investors[investorIndex]
                                                  .schemeTypeDetailsObj
                                                  .schemeType
                                                  .length,
                                              (schemeTypeIndex) {
                                                SchemeType scheme =
                                                    transactionReportModel
                                                            .investorObj!
                                                            .investors[
                                                                investorIndex]
                                                            .schemeTypeDetailsObj
                                                            .schemeType[
                                                        schemeTypeIndex];
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 5,
                                                          horizontal: 10),
                                                      child: Text(
                                                        "Scheme Type: ${scheme.schemeType}",
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: List.generate(
                                                        scheme
                                                            .fundDetailsModelObj
                                                            .fundDetails
                                                            .length,
                                                        (fundDetailIndex) {
                                                          FundDetail fund = scheme
                                                                  .fundDetailsModelObj
                                                                  .fundDetails[
                                                              fundDetailIndex];
                                                          return Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                        .withOpacity(
                                                                            0.5)),
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        10,
                                                                    horizontal:
                                                                        10),
                                                                child: Text(
                                                                  "${fund.schemeName} - (${fund.schemeCode})\nFolio: ${fund.folioNumber}",
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: List
                                                                    .generate(
                                                                  fund.transactionReportDataNewList
                                                                      .length,
                                                                  (transactionIndex) {
                                                                    TransactionReportDataNewList
                                                                        transaction =
                                                                        fund.transactionReportDataNewList[
                                                                            transactionIndex];
                                                                    return Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border:
                                                                            Border.all(),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent1,
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                const BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              dateTimeFormat(
                                                                                "d/M/y",
                                                                                transaction.navDate,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                const BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              transaction.transactionType,
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                const BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              formatNumber(
                                                                                transaction.navRate,
                                                                                formatType: FormatType.decimal,
                                                                                decimalType: DecimalType.automatic,
                                                                                currency: '₹',
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                const BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              formatNumber(
                                                                                transaction.amount,
                                                                                formatType: FormatType.decimal,
                                                                                decimalType: DecimalType.automatic,
                                                                                currency: '₹',
                                                                              ),
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                const BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              transaction.units.toStringAsFixed(2),
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                const BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              transaction.balanceUnit.toStringAsFixed(2),
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        10,
                                                                    horizontal:
                                                                        10),
                                                                child: Text(
                                                                  "NAV(${dateTimeFormat(
                                                                    "d/M/y",
                                                                    fund.navDate,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  )}): INR ${fund.nav} \n[CURRENT VALUE: ${fund.balanceUnit}] Bank: ${fund.bankName} A/C: ${fund.accountNo} \nEmail: ${fund.emailId}, \nNominee 1: ${fund.nominee1}",
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          )

                                          /*Builder(
                                                builder: (context) {
                                                  final fundsList = getJsonField(
                                                    categoryListItem,
                                                    r'''$.SchemeTypes[:].Funds[:]''',
                                                  ).toList();

                                                  return Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: List.generate(
                                                        fundsList.length,
                                                            (fundsListIndex) {
                                                          final fundsListItem =
                                                          fundsList[fundsListIndex];
                                                          return Column(
                                                            mainAxisSize:
                                                            MainAxisSize.max,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    0.0,
                                                                    10.0),
                                                                child: Text(
                                                                  valueOrDefault<String>(
                                                                    getJsonField(
                                                                      fundsListItem,
                                                                      r'''$.FundName''',
                                                                    )?.toString(),
                                                                    'fundName',
                                                                  ),
                                                                  style:
                                                                  FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyMedium
                                                                      .override(
                                                                    fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                        .bodyMediumFamily,
                                                                    fontSize:
                                                                    14.0,
                                                                    letterSpacing:
                                                                    0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                        .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                                  ),
                                                                ),
                                                              ),
                                                              Builder(
                                                                builder: (context) {
                                                                  final transactionList =
                                                                  getJsonField(
                                                                    fundsListItem,
                                                                    r'''$.Trans''',
                                                                  ).toList();

                                                                  return Column(
                                                                    mainAxisSize:
                                                                    MainAxisSize.max,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: List.generate(
                                                                        transactionList
                                                                            .length,
                                                                            (transactionListIndex) {
                                                                          final transactionListItem =
                                                                          transactionList[
                                                                          transactionListIndex];
                                                                          return Container(
                                                                            height: 60.0,
                                                                            decoration:
                                                                            BoxDecoration(
                                                                              color: FlutterFlowTheme.of(
                                                                                  context)
                                                                                  .accent1,
                                                                              borderRadius:
                                                                              BorderRadius
                                                                                  .only(
                                                                                bottomLeft: Radius
                                                                                    .circular(
                                                                                    0.0),
                                                                                bottomRight: Radius
                                                                                    .circular(
                                                                                    0.0),
                                                                                topLeft: Radius
                                                                                    .circular(
                                                                                    0.0),
                                                                                topRight: Radius
                                                                                    .circular(
                                                                                    0.0),
                                                                              ),
                                                                            ),
                                                                            child: Row(
                                                                              mainAxisSize:
                                                                              MainAxisSize
                                                                                  .min,
                                                                              children: [
                                                                                Container(
                                                                                  width:
                                                                                  150.0,
                                                                                  decoration:
                                                                                  BoxDecoration(),
                                                                                  child: Text(
                                                                                    valueOrDefault<
                                                                                        String>(
                                                                                      getJsonField(
                                                                                        transactionListItem,
                                                                                        r'''$.FolioNo''',
                                                                                      )?.toString(),
                                                                                      '0',
                                                                                    ),
                                                                                    textAlign:
                                                                                    TextAlign
                                                                                        .center,
                                                                                    style: FlutterFlowTheme.of(
                                                                                        context)
                                                                                        .bodyMedium
                                                                                        .override(
                                                                                      fontFamily:
                                                                                      FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color:
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing:
                                                                                      0.0,
                                                                                      fontWeight:
                                                                                      FontWeight.w500,
                                                                                      useGoogleFonts:
                                                                                      GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width:
                                                                                  100.0,
                                                                                  decoration:
                                                                                  BoxDecoration(),
                                                                                  child: Text(
                                                                                    dateTimeFormat(
                                                                                      "d/M/y",
                                                                                      functions
                                                                                          .stringToDateTime(valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          transactionListItem,
                                                                                          r'''$.SaleDate''',
                                                                                        )?.toString(),
                                                                                        '0',
                                                                                      )),
                                                                                      locale:
                                                                                      FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    textAlign:
                                                                                    TextAlign
                                                                                        .center,
                                                                                    style: FlutterFlowTheme.of(
                                                                                        context)
                                                                                        .bodyMedium
                                                                                        .override(
                                                                                      fontFamily:
                                                                                      FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color:
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing:
                                                                                      0.0,
                                                                                      fontWeight:
                                                                                      FontWeight.w500,
                                                                                      useGoogleFonts:
                                                                                      GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width:
                                                                                  100.0,
                                                                                  decoration:
                                                                                  BoxDecoration(),
                                                                                  child: Text(
                                                                                    valueOrDefault<
                                                                                        String>(
                                                                                      getJsonField(
                                                                                        transactionListItem,
                                                                                        r'''$.Units''',
                                                                                      )?.toString(),
                                                                                      '0',
                                                                                    ),
                                                                                    textAlign:
                                                                                    TextAlign
                                                                                        .center,
                                                                                    style: FlutterFlowTheme.of(
                                                                                        context)
                                                                                        .bodyMedium
                                                                                        .override(
                                                                                      fontFamily:
                                                                                      FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color:
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing:
                                                                                      0.0,
                                                                                      fontWeight:
                                                                                      FontWeight.w500,
                                                                                      useGoogleFonts:
                                                                                      GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width:
                                                                                  125.0,
                                                                                  decoration:
                                                                                  BoxDecoration(),
                                                                                  child: Text(
                                                                                    valueOrDefault<
                                                                                        String>(
                                                                                      getJsonField(
                                                                                        transactionListItem,
                                                                                        r'''$.SaleRate''',
                                                                                      )?.toString(),
                                                                                      '0',
                                                                                    ),
                                                                                    textAlign:
                                                                                    TextAlign
                                                                                        .center,
                                                                                    style: FlutterFlowTheme.of(
                                                                                        context)
                                                                                        .bodyMedium
                                                                                        .override(
                                                                                      fontFamily:
                                                                                      FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color:
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing:
                                                                                      0.0,
                                                                                      fontWeight:
                                                                                      FontWeight.w500,
                                                                                      useGoogleFonts:
                                                                                      GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width:
                                                                                  125.0,
                                                                                  decoration:
                                                                                  BoxDecoration(),
                                                                                  child: Text(
                                                                                    functions.doubleToStringFixed(
                                                                                        2,
                                                                                        valueOrDefault<double>(
                                                                                          getJsonField(
                                                                                            transactionListItem,
                                                                                            r'''$.SaleAmount''',
                                                                                          ),
                                                                                          0.0,
                                                                                        )),
                                                                                    textAlign:
                                                                                    TextAlign
                                                                                        .center,
                                                                                    style: FlutterFlowTheme.of(
                                                                                        context)
                                                                                        .bodyMedium
                                                                                        .override(
                                                                                      fontFamily:
                                                                                      FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color:
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing:
                                                                                      0.0,
                                                                                      fontWeight:
                                                                                      FontWeight.w500,
                                                                                      useGoogleFonts:
                                                                                      GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width:
                                                                                  125.0,
                                                                                  decoration:
                                                                                  BoxDecoration(),
                                                                                  child: Text(
                                                                                    valueOrDefault<
                                                                                        String>(
                                                                                      getJsonField(
                                                                                        transactionListItem,
                                                                                        r'''$.purchaseDate''',
                                                                                      )?.toString(),
                                                                                      '0',
                                                                                    ),
                                                                                    textAlign:
                                                                                    TextAlign
                                                                                        .center,
                                                                                    style: FlutterFlowTheme.of(
                                                                                        context)
                                                                                        .bodyMedium
                                                                                        .override(
                                                                                      fontFamily:
                                                                                      FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color:
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing:
                                                                                      0.0,
                                                                                      fontWeight:
                                                                                      FontWeight.w500,
                                                                                      useGoogleFonts:
                                                                                      GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width:
                                                                                  125.0,
                                                                                  decoration:
                                                                                  BoxDecoration(),
                                                                                  child: Text(
                                                                                    valueOrDefault<
                                                                                        String>(
                                                                                      getJsonField(
                                                                                        transactionListItem,
                                                                                        r'''$.purchaseRate''',
                                                                                      )?.toString(),
                                                                                      '0',
                                                                                    ),
                                                                                    textAlign:
                                                                                    TextAlign
                                                                                        .center,
                                                                                    style: FlutterFlowTheme.of(
                                                                                        context)
                                                                                        .bodyMedium
                                                                                        .override(
                                                                                      fontFamily:
                                                                                      FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color:
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing:
                                                                                      0.0,
                                                                                      fontWeight:
                                                                                      FontWeight.w500,
                                                                                      useGoogleFonts:
                                                                                      GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width:
                                                                                  125.0,
                                                                                  decoration:
                                                                                  BoxDecoration(),
                                                                                  child: Text(
                                                                                    valueOrDefault<
                                                                                        String>(
                                                                                      getJsonField(
                                                                                        transactionListItem,
                                                                                        r'''$.purchaseCost''',
                                                                                      )?.toString(),
                                                                                      '0',
                                                                                    ),
                                                                                    textAlign:
                                                                                    TextAlign
                                                                                        .center,
                                                                                    style: FlutterFlowTheme.of(
                                                                                        context)
                                                                                        .bodyMedium
                                                                                        .override(
                                                                                      fontFamily:
                                                                                      FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color:
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing:
                                                                                      0.0,
                                                                                      fontWeight:
                                                                                      FontWeight.w500,
                                                                                      useGoogleFonts:
                                                                                      GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width:
                                                                                  125.0,
                                                                                  decoration:
                                                                                  BoxDecoration(),
                                                                                  child: Text(
                                                                                    valueOrDefault<
                                                                                        String>(
                                                                                      getJsonField(
                                                                                        transactionListItem,
                                                                                        r'''$.STG''',
                                                                                      )?.toString(),
                                                                                      '0',
                                                                                    ),
                                                                                    textAlign:
                                                                                    TextAlign
                                                                                        .center,
                                                                                    style: FlutterFlowTheme.of(
                                                                                        context)
                                                                                        .bodyMedium
                                                                                        .override(
                                                                                      fontFamily:
                                                                                      FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color:
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing:
                                                                                      0.0,
                                                                                      fontWeight:
                                                                                      FontWeight.w500,
                                                                                      useGoogleFonts:
                                                                                      GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width:
                                                                                  125.0,
                                                                                  decoration:
                                                                                  BoxDecoration(),
                                                                                  child: Text(
                                                                                    valueOrDefault<
                                                                                        String>(
                                                                                      getJsonField(
                                                                                        transactionListItem,
                                                                                        r'''$.LTG''',
                                                                                      )?.toString(),
                                                                                      '0',
                                                                                    ),
                                                                                    textAlign:
                                                                                    TextAlign
                                                                                        .center,
                                                                                    style: FlutterFlowTheme.of(
                                                                                        context)
                                                                                        .bodyMedium
                                                                                        .override(
                                                                                      fontFamily:
                                                                                      FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color:
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing:
                                                                                      0.0,
                                                                                      fontWeight:
                                                                                      FontWeight.w500,
                                                                                      useGoogleFonts:
                                                                                      GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width:
                                                                                  125.0,
                                                                                  decoration:
                                                                                  BoxDecoration(),
                                                                                  child: Text(
                                                                                    FFLocalizations.of(
                                                                                        context)
                                                                                        .getText(
                                                                                      '7ecs49is' */ /* 0 */ /*,
                                                                                    ),
                                                                                    textAlign:
                                                                                    TextAlign
                                                                                        .center,
                                                                                    style: FlutterFlowTheme.of(
                                                                                        context)
                                                                                        .bodyMedium
                                                                                        .override(
                                                                                      fontFamily:
                                                                                      FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color:
                                                                                      FlutterFlowTheme.of(context).primaryText,
                                                                                      letterSpacing:
                                                                                      0.0,
                                                                                      fontWeight:
                                                                                      FontWeight.w500,
                                                                                      useGoogleFonts:
                                                                                      GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        }),
                                                                  );
                                                                },
                                                              ),
                                                              Container(
                                                                height: 60.0,
                                                                decoration: BoxDecoration(
                                                                  color:
                                                                  FlutterFlowTheme.of(
                                                                      context)
                                                                      .accent2,
                                                                  borderRadius:
                                                                  BorderRadius.only(
                                                                    bottomLeft:
                                                                    Radius.circular(
                                                                        0.0),
                                                                    bottomRight:
                                                                    Radius.circular(
                                                                        0.0),
                                                                    topLeft:
                                                                    Radius.circular(
                                                                        0.0),
                                                                    topRight:
                                                                    Radius.circular(
                                                                        0.0),
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                  MainAxisSize.min,
                                                                  children: [
                                                                    Container(
                                                                      width: 475.0,
                                                                      decoration:
                                                                      BoxDecoration(),
                                                                      child: Text(
                                                                        FFLocalizations.of(
                                                                            context)
                                                                            .getText(
                                                                          'sbx6an9q' */ /* Total Sale Amount */ /*,
                                                                        ),
                                                                        textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                        style: FlutterFlowTheme
                                                                            .of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                          fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                          color: FlutterFlowTheme.of(
                                                                              context)
                                                                              .primaryText,
                                                                          letterSpacing:
                                                                          0.0,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                          useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                              .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 125.0,
                                                                      decoration:
                                                                      BoxDecoration(),
                                                                      child: Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          functions
                                                                              .doubleToStringFixed(
                                                                              2,
                                                                              getJsonField(
                                                                                fundsListItem,
                                                                                r'''$.totalSaleAmount''',
                                                                              )),
                                                                          '0',
                                                                        ),
                                                                        textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                        style: FlutterFlowTheme
                                                                            .of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                          fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                          color: FlutterFlowTheme.of(
                                                                              context)
                                                                              .primaryText,
                                                                          letterSpacing:
                                                                          0.0,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                          useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                              .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 190.0,
                                                                      decoration:
                                                                      BoxDecoration(),
                                                                      child: Text(
                                                                        FFLocalizations.of(
                                                                            context)
                                                                            .getText(
                                                                          'hgcjurwx' */ /* Total Purchase Cost */ /*,
                                                                        ),
                                                                        textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                        style: FlutterFlowTheme
                                                                            .of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                          fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                          color: FlutterFlowTheme.of(
                                                                              context)
                                                                              .primaryText,
                                                                          letterSpacing:
                                                                          0.0,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                          useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                              .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 250.0,
                                                                      decoration:
                                                                      BoxDecoration(),
                                                                      child: Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          functions
                                                                              .doubleToStringFixed(
                                                                              2,
                                                                              getJsonField(
                                                                                fundsListItem,
                                                                                r'''$.totalPurchaseCost''',
                                                                              )),
                                                                          '0',
                                                                        ),
                                                                        textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                        style: FlutterFlowTheme
                                                                            .of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                          fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                          color: FlutterFlowTheme.of(
                                                                              context)
                                                                              .primaryText,
                                                                          letterSpacing:
                                                                          0.0,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                          useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                              .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        }),
                                                  );
                                                },
                                              ),*/
                                        ],
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  _buildTransactionReportSummery(Summary summery) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondary,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            child: Center(
                child: Text(
              summery.investor,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                _buildSummerPriceRow("Purchase", summery.freshCost),
                _buildSummerPriceRow("SIP", summery.sipCost),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                _buildSummerPriceRow("Dividend", summery.dividendCost),
                _buildSummerPriceRow("Redemption", summery.redeemCost),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                _buildSummerPriceRow("Switch In", summery.switchInCost),
                _buildSummerPriceRow("Switch Out", summery.switchOutCost),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildSummerPriceRow(String title, double price) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "$title:",
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
            Text(
              formatNumber(
                price,
                formatType: FormatType.decimal,
                decimalType: DecimalType.automatic,
                currency: '₹',
              ),
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
