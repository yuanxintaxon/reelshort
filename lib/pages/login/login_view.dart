import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource_common/resource_common.dart';
import 'package:sprintf/sprintf.dart';
import 'login_logic.dart';

class LoginPage extends StatelessWidget {
  final logic = Get.find<LoginLogic>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Styles.c_000000,
      body: Stack(
        alignment: Alignment.center,
        children: [
          ImageRes.loginBg.toImage
            ..width = width
            ..height = height
            ..fit = BoxFit.cover,
          Positioned(
            right: 18,
            top: 30,
            child: ImageRes.closeWhite.toImage
              ..width = 18
              ..height = 18
              ..fit = BoxFit.cover
              ..onTap = logic.startDashboard,
          ),
          _buildContentView(),
        ],
      ),
    );
  }

  Widget _buildContentView() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageRes.appLogo.toImage
            ..width = 80
            ..height = 80,
          10.vSpace,
          StrRes.reelShort.toText
            ..style = Styles.ts_FFFFFF_30sp_black_sofia_pro,
          sprintf(StrRes.welcomeToX, [StrRes.reelShort]).toText
            ..style = Styles.ts_FFFFFF_17sp_semibold_sofia_pro
            ..textAlign = TextAlign.center,
          65.vSpace,
          _buildGoogleSignIn(),
          15.vSpace,
          _buildFacebookSignIn(),
          15.vSpace,
          _buildAppleSignIn(),
          100.vSpace,
          _buildAgreementLines(),
        ],
      );

  Widget _buildGoogleSignIn() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        child: ExpandedImageTextButton.signInWithGoogle(
            // onTap: logic.continueWithFacebook,
            ),
      );

  Widget _buildFacebookSignIn() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        child: ExpandedImageTextButton.signInWithFacebook(
            // onTap: logic.continueWithFacebook,
            ),
      );
  Widget _buildAppleSignIn() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        child: ExpandedImageTextButton.signInWithApple(
            // onTap: logic.continueWithFacebook,
            ),
      );

  Widget _buildAgreementLines() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(height: 1.3),
            children: [
              TextSpan(
                  text: "${StrRes.byContinuingIAgree} ",
                  style: Styles.ts_807F80_12sp_bold_sofia_pro),
              TextSpan(
                  text: StrRes.serviceAgreement,
                  style: Styles.ts_FFFFFF_12sp_bold_sofia_pro.merge(
                      const TextStyle(decoration: TextDecoration.underline))),
              TextSpan(
                  text: " ${StrRes.and.toLowerCase()} ",
                  style: Styles.ts_807F80_12sp_bold_sofia_pro),
              TextSpan(
                  text: StrRes.privacyPolicy,
                  style: Styles.ts_FFFFFF_12sp_bold_sofia_pro.merge(
                      const TextStyle(decoration: TextDecoration.underline))),
            ],
          ),
        ),
      );
}
