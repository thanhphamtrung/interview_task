import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:interview_task/src/configs/routes.dart';
import 'package:interview_task/src/screens/splash/splash_screen.dart';
import 'package:interview_task/src/services/app_localization/app_localizations.dart';
import 'package:interview_task/src/styles/app_theme.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    var dpi = tester.binding.window.devicePixelRatio;
    tester.binding.window.physicalSizeTestValue = Size(500 * dpi, 1200 * dpi);

    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

    await tester.pumpWidget(MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.getAppTheme(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('vi', ''),
      ],
      routes: buildRoutes(),
      home: const SplashScreen(),
    ));
    await tester.pumpAndSettle();
    await Future.delayed(Duration(minutes: 1));

    var bgFinder = find.byWidgetPredicate((widget) {
      return widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName ==
              'assets/images/splash_bg.png';
    });

    expect(bgFinder, findsOneWidget);

    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
