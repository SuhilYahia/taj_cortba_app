import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_router.dart';
import 'core/localization/language_provider.dart';
import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TajCortbaApp());
}

class TajCortbaApp extends StatefulWidget {
  const TajCortbaApp({super.key});

  @override
  State<TajCortbaApp> createState() => _TajCortbaAppState();
}

class _TajCortbaAppState extends State<TajCortbaApp> {
  final LanguageProvider _languageProvider = LanguageProvider();

  @override
  void initState() {
    super.initState();
    _languageProvider.addListener(_onLanguageChanged);
  }

  @override
  void dispose() {
    _languageProvider.removeListener(_onLanguageChanged);
    super.dispose();
  }

  void _onLanguageChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final router = createRouter(_languageProvider);

    return MaterialApp.router(
      title: 'تاج قرطبة للتشغيل والصيانة',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      locale: _languageProvider.locale,
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: router,
    );
  }
}
