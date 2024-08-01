import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'terms_condition_model.dart';
export 'terms_condition_model.dart';

class TermsConditionWidget extends StatefulWidget {
  const TermsConditionWidget({super.key});

  @override
  State<TermsConditionWidget> createState() => _TermsConditionWidgetState();
}

class _TermsConditionWidgetState extends State<TermsConditionWidget> {
  late TermsConditionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsConditionModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryText,
            automaticallyImplyLeading: false,
            leading: Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 40.0,
                ),
              ),
            ),
            title: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Text(
                'Terms & Conditions',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 2.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 0.0),
                  child: RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '\nTerms and Conditions for Ride-Hailing App\n\nWelcome to ManzilNow! Please read these Terms and Conditions carefully before using our services.\n\nAcceptance of Terms:',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const TextSpan(
                          text:
                              ' By accessing or using the services provided by ManzilNow. you agree to be bound by these Terms and Conditions, including any policies referenced herein. If you do not agree to these terms, please do not use the services.',
                          style: TextStyle(),
                        ),
                        const TextSpan(
                          text: '\n\nDescription of Services:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text:
                              ' ManzilNow provides a platform that connects users with independent third-party transportation providers. Users can request transportation services using the app, and drivers can accept and fulfill those requests.',
                          style: TextStyle(),
                        ),
                        const TextSpan(
                          text: '\n\nUser Eligibility:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text:
                              ' To use our services, you must be at least 18 years old or the legal age of majority in your jurisdiction. By using the services, you represent and warrant that you meet these eligibility requirements',
                          style: TextStyle(),
                        ),
                        const TextSpan(
                          text: '\n\nAccount Registration:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text:
                              ' Users must create an account to access certain features of the app. You agree to provide accurate, current, and complete information during the registration process and to update such information to keep it accurate, current, and complete.',
                          style: TextStyle(),
                        ),
                        const TextSpan(
                          text: '\n\nUser Conduct:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text:
                              ' You agree to use the services for lawful purposes only and to comply with all applicable laws and regulations. You will not use the services to:\n\n - Violate any third-party rights.\n - Upload, post, or transmit any content that is unlawful, harmful, threatening, abusive, harassing, defamatory, vulgar, obscene, or otherwise objectionable.\n - Engage in any fraudulent or deceptive activities.\n - Interfere with or disrupt the operation of the services.',
                          style: TextStyle(),
                        ),
                        const TextSpan(
                          text: '\n\nPayment: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text:
                              ' Users agree to pay for transportation services provided through the app based on the fare calculated at the time of booking. Payment methods accepted may vary and will be specified in the app.',
                          style: TextStyle(),
                        ),
                        const TextSpan(
                          text: '\n\nDriver Conduct:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text:
                              ' Drivers using the platform agree to provide transportation services in a professional and courteous manner. They must comply with all applicable laws and regulations, including those related to vehicle maintenance, insurance, and licensing.',
                          style: TextStyle(),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
