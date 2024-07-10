import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resource_common/resource_common.dart';
import 'dashboard_logic.dart';

class DashboardPage extends StatelessWidget {
  final logic = Get.find<DashboardLogic>();

  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.c_000000,
      appBar: TitleBar.navbar(
        onViewHome: logic.viewHome,
      ),
      body: Column(
        children: [
          20.vSpace,
          _buildUserInfoView(),
          20.vSpace,
          _buildWalletBalanceView(),
          15.vSpace,
          _buildMenuListView(),
          50.vSpace,
          if (logic.ssoType.isEmpty) ...[
            _buildSignInView(),
          ] else ...[
            _buildLogOutView(),
          ],
        ],
      ),
    );
  }

  Widget _buildUserInfoView() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            ImageRes.profilePlaceholder.toImage
              ..width = 54
              ..height = 54,
            10.hSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StrRes.guest.toText
                    ..style = Styles.ts_FFFFFF_17sp_medium_sofia_pro,
                  Row(
                    children: [
                      if (logic.ssoType.isNotEmpty) ...[
                        _buildSSOLogo(logic.ssoType.value),
                        2.hSpace,
                      ],
                      "${StrRes.uidLabel}${144807174}".toText
                        ..style = Styles.ts_807F80_12sp_bold_sofia_pro,
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );

  Widget _buildSSOLogo(String ssoType) {
    if (ssoType == SSOType.GOOGLE.string) {
      return Container(
          padding: const EdgeInsets.all(0),
          height: 13,
          width: 13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          child: ImageRes.google.toImage);
    } else if (ssoType == SSOType.APPLE.string) {
      return Container(
          padding: const EdgeInsets.all(1),
          height: 13,
          width: 13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
          ),
          child: ImageRes.appleWhite.toImage);
    } else if (ssoType == SSOType.FACEBOOK.string) {
      return Container(
          padding: const EdgeInsets.all(1),
          height: 13,
          width: 13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
          ),
          child: ImageRes.facebook.toImage);
    }
    return Container();
  }

  Widget _buildWalletBalanceView() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Container(
          decoration: BoxDecoration(
            color: Styles.c_181818,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    ImageRes.coin.toImage
                      ..width = 22
                      ..height = 22,
                    4.hSpace,
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Row(
                        children: [
                          /// coins
                          Row(
                            children: [
                              "${0}".toText
                                ..style =
                                    Styles.ts_FFFFFF_20sp_semibold_sofia_pro,
                              2.hSpace,
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: StrRes.coins.toText
                                  ..style =
                                      Styles.ts_807F80_13sp_semibold_sofia_pro,
                              ),
                            ],
                          ),
                          8.hSpace,

                          /// bonus
                          Row(
                            children: [
                              "${0}".toText
                                ..style =
                                    Styles.ts_FFFFFF_20sp_semibold_sofia_pro,
                              2.hSpace,
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: StrRes.bonus.toText
                                  ..style =
                                      Styles.ts_807F80_13sp_semibold_sofia_pro,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Button(
                text: StrRes.topUp,
                padding: const EdgeInsets.symmetric(horizontal: 22),
                textStyle: Styles.ts_FFFFFF_13sp_semibold_sofia_pro,
                height: 30,
                enabledColor: Styles.c_E83A56,
              ),
            ],
          ),
        ),
      );

  Widget _buildMenuListView() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            _buildMenuItem(icon: ImageRes.wallet, label: StrRes.myWallet),
            _buildMenuItem(
                icon: ImageRes.listAndHistory, label: StrRes.myListNHistory),
            _buildMenuItem(icon: ImageRes.feedback, label: StrRes.feedback),
          ],
        ),
      );

  Widget _buildMenuItem({required String icon, required String label}) =>
      SizedBox(
        height: 56,
        child: Row(
          children: [
            icon.toImage
              ..width = 24
              ..height = 24,
            10.hSpace,
            Expanded(
                child: label.toText
                  ..style = Styles.ts_FFFFFF_13sp_semibold_sofia_pro),
            ImageRes.rightChevronGrey.toImage
              ..width = 10
              ..height = 10,
          ],
        ),
      );

  Widget _buildSignInView() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 18 + 28),
        width: double.infinity,
        child: Button(
          height: 44,
          onTap: logic.signIn,
          text: StrRes.signIn,
          textStyle: Styles.ts_FFFFFF_15sp_medium_sofia_pro,
          border: Border.all(
            color: Styles.c_5D5D5D,
            width: 1.5,
          ),
          radius: 5,
        ),
      );

  Widget _buildLogOutView() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 18 + 28),
        width: double.infinity,
        child: Button(
          height: 44,
          onTap: logic.logOut,
          text: StrRes.logOut,
          textStyle: Styles.ts_FFFFFF_15sp_medium_sofia_pro,
          border: Border.all(
            color: Styles.c_5D5D5D,
            width: 1.5,
          ),
          radius: 5,
        ),
      );
}
