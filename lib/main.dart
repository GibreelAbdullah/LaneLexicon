import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/migration.dart';
import 'data/database_init.dart' as db_init;
import 'presentation/providers/dictionary_providers.dart';
import 'presentation/providers/theme_provider.dart';
import 'presentation/router.dart';
import 'presentation/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  db_init.initDatabaseFactory();
  await migrateFromOldApp();
  runApp(const ProviderScope(child: LaneLexiconApp()));
}

class LaneLexiconApp extends ConsumerWidget {
  const LaneLexiconApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final router = ref.watch(routerProvider);
    final themeSettings = ref.watch(themeSettingsProvider).value ?? const ThemeSettings();
    final fontScale = ref.watch(fontScaleProvider).value ?? 1.0;
    final appFont = ref.watch(appFontProvider).value ?? AppFont.system;
    return MaterialApp.router(
      title: "Lane's Lexicon",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.buildLight(themeSettings, font: appFont),
      darkTheme: AppTheme.buildDark(themeSettings, font: appFont),
      themeMode: themeMode,
      routerConfig: router,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(fontScale),
          ),
          child: child!,
        );
      },
    );
  }
}
