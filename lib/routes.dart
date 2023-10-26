import 'package:flutter/widgets.dart';
import '../screens/history.dart';
import './screens/favorites.dart';
import 'screens/more_apps.dart';
import 'constants/app_constants.dart';
import './screens/abbreviations.dart';
import 'screens/about_app.dart';
import './screens/browse.dart';
import './screens/search.dart';
import './screens/settings.dart';
import './screens/donate.dart';

Map<String, WidgetBuilder> routes = {
  '/search': (context) => const Search(),
  '/aboutus': (context) => const AboutApp(),
  '/browse': (context) => const Browse(),
  '/lexicologicalterms': (context) => const Abbreviations(
        title: lexicologicalScreenTitle,
        abbreviations: lexicologicalTerms,
        fullForms: lexicologicalFullForms,
      ),
  '/authorities': (context) => const Abbreviations(
        title: authoritiesScreenTitle,
        abbreviations: authoritiesShortForm,
        fullForms: authoritiesFullForm,
      ),
  '/moreapps': (context) => const MoreApps(),
  '/donate': (context) => const Donate(),
  '/settings': (context) => const Settings(),
  '/favorites': (context) => const Favorites(),
  '/history': (context) => const History(),
};
