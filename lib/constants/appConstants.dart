import 'dart:core';
import 'package:sqflite/sqflite.dart';

import '../services/getData.dart';

const String SETTINGS_SCREEN_TITLE = 'Settings';
const String ABOUT_APP_SCREEN_TITLE = 'About App';
const String ABBREVIATIONS_SCREEN_TITLE = 'Abbreviations';
const String SEARCH_SCREEN_TITLE = 'Search';
const String BROWSE_SCREEN_TITLE = 'Browse';
const String NOTIFICATION_SCREEN_TITLE = 'Notifications';
const String DONATE_SCREEN_TITLE = 'Donate';

const String ABOUT_APP = '''
    <br>
    <p style="text-align:center"><i><b>Lanes's Lexicon or Arabic-English Lexicon</b></i> is an Arabic-English dictionary compiled by 
    <a href="https://en.wikipedia.org/wiki/Edward_William_Lane" title="Edward William Lane">Edward William Lane</a>.<br>''';
const String WHATS_NEW =
    '''<p style="text-align:center"><b> What's New :</b> </p>
    <p style="text-align:left">
    - First Version <br>
    </p> <p style="text-align:center"> <a href = "https://github.com/MuslimTechNet/LaneLexicon/blob/master/README.md">Source Code, Full Release Notes and Future Work</a></p><br>''';
const String COMMUNITY_INVITE =
    '''<p style="text-align:center">If you are a Muslim tech professional or aspiring to be one join the <br>
    <b>Muslim Tech Network</b></p><br>''';
const String DISCORD_INVITE_LINK = 'https://discord.gg/QFKwtFC';
const String REDDIT_INVITE_LINK = 'https://www.reddit.com/r/muslimtechnet/';
const String DONATE_LINK = 'https://www.islamic-relief.org/';

const String DISCLAIMER =
    '''<p style="text-align:center"><b>DISCLAIMER</b></br>The original source was a PDF file,
    which was converted to an XML and parsed which isn't a foolproof method.
    A lot of manual correction was needed and might still have a few errors. 
    Do let me know if you find any - <a href = "mailto: gibreel.khan@gmail.com">gibreel.khan@gmail.com</a><br>
    (Mail me if you have a job offer.)</p><br>''';
final DatabaseAccess databaseObject = new DatabaseAccess();
final Future<Database> databaseConnection =
    DatabaseAccess().openDatabaseConnection();

const String PLAY_STORE_LINK =
    'https://play.google.com/store/apps/details?id=com.muslimtechnet.lanelexicon';

const String PAYPAL_LINK = 'https://www.paypal.me/gibreelabdullah';
const String UPI_LINK =
    'upi://pay?pa=gibreelkhan@okaxis&pn=Gibreel+Abdullah&tn=Donation+:+Lane+Lexicon+Dictionary';

const List<String> VERB_FORMS = [
  'I - فَعَل/فَعُل/فَعِل',
  'II - فَعّل',
  'III - فَاعَل',
  'IV - أَفْعَل',
  'V - تَفَعّل',
  'VI - تَفَاعَل',
  'VII - اِنْفَعَل',
  'VIII - اِفْتَعَل',
  'IX - اِفْعَل',
  'X - اِسْتَفْعَل',
];

const List<String> VERB_FORM_DESCRIPTIONS = [
  'Basic root',
  'Doing something intensively/ repeatedly, doing or causing something to someone else',
  'To try to do something, to do something with someone else',
  'Transitive, immediate, doing something to other/ someone else, causing something ',
  'Doing something intensively/ repeatedly, doing or causing something to yourself',
  'Doing something with each other, to pretend to do something, expressing a state ',
  'Intransitive, Passive meaning ',
  'No consistent meaning pattern, being in a state of something ',
  'Used for colors or defects',
  'To seek or ask something, wanting, trying',
];

const List<String> VERB_FORM_EXAMPLES = [
  'غفر - He forgave',
  'علّم - He taught',
  'قاتل - He fought',
  'اخرج - He took out',
  'توكّل - He trusted',
  'تعاون - He cooperated',
  'اِنْفَقلب - He overturned',
  'اِختلف - He differed',
  'اِحمرّ - He became red',
  'اِسْتَغفر - He sought forgiveness',
];

const List<String> ALL_ALPHABETS = [
  "ا",
  "ب",
  "ت",
  "ث",
  "ج",
  "ح",
  "خ",
  "د",
  "ذ",
  "ر",
  "ز",
  "س",
  "ش",
  "ص",
  "ض",
  "ط",
  "ظ",
  "ع",
  "غ",
  "ف",
  "ق",
  "ك",
  "ل",
  "م",
  "ن",
  "ه",
  "و",
  "ي"
];

const List<String> ABBREVIATIONS = ['P', 'P.', 'W', 'W.'];
const List<String> FULL_FORM = [
  '',
  'Page under construction.',
  '',
  'Will Update Soon InShaAllah'
];
