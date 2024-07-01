import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:resource_common/resource_common.dart';

import 'routes/app_pages.dart';
import 'widgets/app_view.dart';

Future<bool> get isLoggedIn async =>
    null != (await DataSp.userID) && null != (await DataSp.imToken);

class AuthGuard extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    Logger.print("creturn auth middleware location ${route.location}");
    if (!(await isLoggedIn)) {
      return GetNavConfig.fromRoute(AppRoutes.home);
    }
    return SynchronousFuture(route);
  }
}

class ArgumentMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    // // Check if arguments are empty
    Logger.print("creturn middleware argument ${route.currentPage?.arguments}");
    Logger.print("creturn middleware state ${route.toString()}");
    Logger.print("creturn middleware arg location ${route.location}");
    if (route.currentPage?.arguments == null) {
      if (await isLoggedIn) {
        return GetNavConfig.fromRoute(AppRoutes.home);
      } else {
        return GetNavConfig.fromRoute(AppRoutes.home);
      }
    }
    // Proceed with the original route
    return SynchronousFuture(route);
  }
}

class ReelShortApp extends StatelessWidget {
  const ReelShortApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppView(
      builder: (locale, builder) => GetMaterialApp.router(
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            selectionColor:
                Styles.c_000000_opacity10, // Set the background color
          ),
          primarySwatch: Styles.primaryBlack,
        ),
        debugShowCheckedModeBanner: true,
        enableLog: true,
        builder: builder,
        logWriterCallback: Logger.print,
        translations: TranslationService(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          // DefaultCupertinoLocalizations.delegate,
        ],
        fallbackLocale: TranslationService.fallbackLocale,
        locale: locale,
        localeResolutionCallback: (locale, list) {
          Get.locale ??= locale;
          return locale;
        },
        supportedLocales:
            TranslationService.reverseLanguageKeys.keys.map((code) {
          final parts = code.split('_');
          return Locale(parts[0], parts[1]);
        }),
        getPages: AppPages.routes,
        initialBinding: InitBinding(),
        unknownRoute: AppPages.unkownRoute,
        routeInformationParser:
            GetInformationParser(initialRoute: AppRoutes.home),
      ),
    );
  }
}

class InitBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put<DownloadController>(DownloadController());
  }
}
