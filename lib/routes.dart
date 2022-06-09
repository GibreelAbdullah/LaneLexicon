import 'package:flutter/widgets.dart';
import '../screens/history.dart';
import './screens/favorites.dart';
import './screens/moreApps.dart';
import 'constants/appConstants.dart';
import './screens/abbreviations.dart';
import './screens/aboutApp.dart';
import './screens/browse.dart';
import './screens/search.dart';
import './screens/settings.dart';
import './screens/donate.dart';

Map<String, WidgetBuilder> routes = {
  '/search': (context) => Search(),
  '/aboutus': (context) => AboutApp(),
  '/browse': (context) => Browse(),
  '/lexicologicalterms': (context) => Abbreviations(
        title: LEXICOLOGICAL_SCREEN_TITLE,
        abbreviations: LEXICOLOGICAL_TERMS,
        fullForms: LEXICOLOGICAL_FULL_FORMS,
      ),
  '/authorities': (context) => Abbreviations(
        title: AUTHORITIES_SCREEN_TITLE,
        abbreviations: AUTHORITIES_SHORT_FORMS,
        fullForms: AUTHORITIES_FULL_FORMS,
      ),
  '/moreapps': (context) => MoreApps(),
  '/donate': (context) => Donate(),
  '/settings': (context) => Settings(),
  '/favorites': (context) => Favorites(),
  '/history': (context) => History(),
};
