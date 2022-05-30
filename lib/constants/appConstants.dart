import 'dart:core';
import 'package:sqflite/sqflite.dart';

import '../services/getData.dart';

const String SETTINGS_SCREEN_TITLE = 'Settings';
const String ABOUT_APP_SCREEN_TITLE = 'About App';
const String LEXICOLOGICAL_SCREEN_TITLE = 'Lexicological and Grammatical Terms';
const String LEXICOLOGICAL_SCREEN_TITLE_SHORT = 'Lexical Terms';
const String AUTHORITIES_SCREEN_TITLE = 'Indications of Authorities';
const String AUTHORITIES_SCREEN_TITLE_SHORT = 'Authorities';
const String ABBREVIATIONS_SCREEN_TITLE = 'Abbreviations';
const String SEARCH_SCREEN_TITLE = 'Search';
const String BROWSE_SCREEN_TITLE = 'Browse';
const String NOTIFICATION_SCREEN_TITLE = 'Notifications';
const String DONATE_SCREEN_TITLE = 'Donate';
const String FAVORITES_SCREEN_TITLE = 'Favorites';
const String HISTORY_SCREEN_TITLE = 'History';
const String MORE_APPS = 'More Apps';
const String ALL_MY_APPS = 'All Apps By Me';

const String FAV_IMAGE = 'assets/like_button.jpg';
const String DONATE_IMAGE = 'assets/donate.jpg';
const String QURANLE_IMAGE = 'assets/Quranle.jpg';
const String FOR_HIRE_IMAGE = 'assets/ForHire.webp';
final Uri quranleUri = Uri(
  scheme: "https",
  host: "www.quranle.com",
  queryParameters: {'ref': 'HansWehr'},
);

final Uri portfolioUri = Uri(
  scheme: "https",
  host: "gibreelabdullah.github.io",
  queryParameters: {'ref': 'HansWehr'},
);

final Uri hansWehrAndroidUri = Uri(
  scheme: "https",
  host: "play.google.com",
  path: "store/apps/details",
  queryParameters: {'id': 'com.muslimtechnet.hanswehr'},
);

final Uri lanesLexiconAndroidUri = Uri(
  scheme: "https",
  host: "play.google.com",
  path: "store/apps/details",
  queryParameters: {'id': 'com.muslimtechnet.lanelexicon'},
);

final Uri githubUri = Uri(
  scheme: "https",
  host: "github.com",
  path: "GibreelAbdullah",
);

final Uri linkedinUri = Uri(
  scheme: "https",
  host: "linkedin.com",
  path: "in/gibreel-abdullah",
);

final Uri prefaceUri = Uri(
  scheme: "https",
  host: "laneslexicon.github.io",
  path: "lexicon/site/lane/preface",
);

final Uri donateUri = Uri(
  scheme: 'https',
  host: 'donate.islamic-relief.org',
);

const String ABOUT_APP = '''
    <br>
    <p style="text-align:center"><i><b>Lanes's Lexicon or Arabic-English Lexicon</b></i> is an Arabic-English dictionary compiled by 
    <a href="https://en.wikipedia.org/wiki/Edward_William_Lane" title="Edward William Lane">Edward William Lane</a>.<br>''';
const String WHATS_NEW =
    '''<p style="text-align:center"><b> What's New :</b><br>
    - Design Changes<br>
    - Quranle integration<br>
    <a href = "https://github.com/MuslimTechNet/LaneLexicon">Source Code, Full Release Notes and Future Work</a></p><br>''';
const String COMMUNITY_INVITE =
    '''<p style="text-align:center">If you are a Muslim tech professional or aspiring to be one join the <br>
    <b>Muslim Tech Network</b></p><br>''';

const String DISCLAIMER =
    '''<p style="text-align:center"><b>DISCLAIMER - Not 100% Accurate.</b></br>
    Text was extracted from scanned pages and may have errors.</p>''';

const String CONTACT_ME =
    '<p style="text-align:center"><b>CONTACT ME</b><br><br>';

const String EMAIL = "gibreel.khan@gmail.com";

const String SOCIAL_PROFILES =
    '<p style="text-align:center"><b>SOCAIL PROFILES</b><br><br>';

const String COURTSEY = '''<p style="text-align:center"><b>COURTSEY</b>
    <ul>
      <li><a href="http://www.perseus.tufts.edu/hopper/">Perseus Digital Library</a> for the digitisation of Lane's Lexicon.
      <li><a href="https://github.com/laneslexicon/LexiconDatabase">Graeme Andrews</a> for providing Perseus' work in database form</li>
      <li><a href="https://corpus.quran.com/">Quran.com</a> for their word-by-word breakdown of Quranic text</li>
    </ul>
    </p><br>''';
final DatabaseAccess databaseObject = new DatabaseAccess();
final Future<Database> databaseConnection =
    DatabaseAccess().openDatabaseConnection();

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

const List<String> LEXICOLOGICAL_TERMS = [
  'A',
  'Accord.',
  'Accus. case',
  'Act.',
  'Act. part. n.',
  'Adv. n.',
  'Agent',
  'Analogous',
  'Analogy',
  'Anomolous',
  'Aor.',
  'Aplastic',
  'App.',
  'Appositive',
  'Attribute',
  'B',
  'Broken pl.',
  'C',
  'Coll. gen. n.',
  'Complement of a prefixed noun',
  'Complete',
  'Conj.',
  'Conjunct',
  'Conjuction',
  'Contr.',
  'Conventional term',
  'D',
  'Decl.',
  'Defective verb',
  'Dev.',
  'Dial.',
  'Dial. var. of',
  'Dim.',
  'E',
  'Enunciative',
  'Epithet',
  'Ex.',
  'Expl.',
  'Expos.',
  'Extr.',
  'F',
  'Fut.',
  'G',
  'Gen. case',
  'Gen. n.',
  'H',
  'Hollow verb',
  'Homonym',
  'I',
  'I. q.',
  'Ideal (as opposed to real) subst.',
  'Imitative sequent',
  'Imperative',
  'Inchoative',
  'Incomplete',
  'Indecl.',
  'Inf. n.',
  'Instrumental noun',
  'Instrans.',
  'Irreg.',
  'L',
  'Lit.',
  'M',
  'Mahmooz verb',
  'Manṣoob aor.',
  'Masc.',
  'Measure',
  'Mejzoom aor.',
  'Metaphor',
  'Metaphorical',
  'Metonymy',
  'N',
  'N.',
  'N. un.',
  'Nom. case',
  'O',
  'Objective complement of a verb',
  'P',
  'Part.',
  'Particle',
  'Pass.',
  'Perfect pl.',
  'Perfect verb',
  'Pers.',
  'Pl.',
  'Possessive noun or epithet (such as تَامِرٌ and لَابِنٌ &c.)',
  'Post-classical',
  'Predicate',
  'Prefixed noun',
  'Pret.',
  'Prov.',
  'Q',
  'Q.',
  'Q.Q.',
  'Q. v.',
  'Quasi-coordinate',
  'Quasi-inf.n.',
  'Quasi-pl. n.',
  'Quasi-sound verb',
  'R',
  'R.Q.',
  'Real (as opposed to ideal) subst.',
  'Receptacular noun',
  'Reg.',
  'Rel. n.',
  'S',
  'Simple subst. (as opposed to inf. n.)',
  'Sing.',
  'Sound pl.',
  'Sound verb',
  'Specificative',
  'State',
  'Subject (as correlative of attribute or predicate)',
  'Subst.',
  'Substitute',
  'Syll. signs',
  'Syn.',
  'T',
  'Trad.',
  'Trans.',
  'Transposition',
  'Tropical',
  'U',
  'Unsound verb',
  'V',
  'V.',
  'Verbal noun',
  'Note',
  '',
  '',
  '',
];
const List<String> LEXICOLOGICAL_FULL_FORMS = [
  '',
  'according',
  'accusative case, نَصْبٌ.',
  'active, لِلْفَاعِلِ مَبْنِىٌّ or لِلْمَعْلُومِ',
  'active participial noun, اِسْمُ فَاعِلٍ',
  'adverbial noun, ظَرْفٌ, and sometimes صِغَةٌ; of place, ظَرْفُ مَكَانٍ; and of time,ظَرْفُ زَمَانٍ.',
  'فَاعِلٌ.',
  'or regular, قِيَاسِىٌّ and مَقِيسٌ.',
  'قِيَاسٌ.',
  'or irregular, غَيْرُ قِيَاسِىٍّ and غَيْرُ مَقِيسٍ or شَاذٌّ (see "Dev.") or نَادِرٌ (see "Extr.").',
  'aorist, مُضَارِعٌ.',
  'applied to a noun and to a verb, جَامِدٌ.',
  'apparently.',
  'تَابِعٌ.',
  'or predicate, مُسْنَدٌ and خَبَرٌ.',
  '',
  'broken plural, جَمْعٌ مُكَسَّرٌ.',
  '',
  'collective generic noun, جِنْسٍ جَمْعِىٌ اِسْمُ; also called a lexicological plural, جَمْعٌ لُغَوِىٌّ.',
  'مُضَافٌ إِلَيْهِ.',
  'i.e. attributive, verb, فِعْلٌ تَامٌّ.',
  'conjugation, بَابٌ.',
  'مَوْصُولٌ: conjunct noun, مَوْصُولٌ ٱسْمِىٌّ : conjunct particle, مَوْصُولٌ حَرْفِىٌّ.',
  'حَرْفُ عَطْفٍ and حَرْفٌ عَاطِفٌ.',
  'contrary.',
  'اِصْطِلَاحٌ. — Conventional language, عُرْفٌ.',
  '',
  'declinable, مُعْرَبٌ: pefectly decl., مَصْرُوفٌ and مُنْصَرِفٌ: imperfectly decl., مَصْرُوفٍ غَيْرُ and غَيْرُ مُنْصَرِفٍ.',
  'i.e. having a و or a ى for the last radical letter, فِعْلٌ نَاقِصٌ.',
  'deviating; as in the phrase, Deviating from the constant course of speech (with respect to analogy, or rule, or with respect to usage); شَاذٌّ. This term and نَادِرٌ (see "Extr.") are often used in the lexicons indiscriminately.',
  'dialect, لُغَةٌ.',
  'dialect variant of, لُغَةٌ فِى.',
  'diminuitive, مُصَغَّرٌ.',
  '',
  'خَبَرٌ.',
  'and epithetic phrase, نَعْتٌ and وَصْفٌ and صِفَةٌ.',
  'example.',
  'explained.',
  'exposition, شَرْحٌ and تَفْسِيرٌ: the latter particularly applied to an exposition of the Qur-án.',
  'extraordinary ( with respect to analogy, or rule, or with respect to used), نَادِرٌ. (See "Dev.") 	Fem., for feminine مُؤَنَّثٌ',
  '',
  'future, مُسْتَقْبَلٌ',
  '',
  'genetive case, خَفْضٌ and جَرٌّ',
  'generic noun أِسْمُ جِنْسٍ',
  '',
  'فِعْلٌ أَجْوَفُ',
  'مُشْتَرَكٌ, for مُشْتَرَكٌ فِيهِ.',
  '',
  'idem quod.',
  'اِسْمُ مَعْنًى, or simply مَعْنًى.',
  'إِتْنَاعٌ.',
  'أَمْرٌ',
  'مُبْتَدَأٌ.',
  'i.e. non-attributive, verb, فِعْلٌ نَاقِصٌ, or فَعْلٌ غَيْرُ تَامٍّ.',
  'indeclinable, مَبْنِىٌّ.',
  'infinitive noun, مَصْدَرٌ. Inf. n. of unity, مَصْدَرٌ لِلْمَرَّةِ. Inf. n. of modality, مَصْدَرٌ لِلنَّوْعِ.',
  'اِسْمُ آلَةٍ.',
  'intransitive, غَيْرُ مُتَعَدٍّ and لَازِمٌ.',
  'irregular: see "Anomalous."',
  '',
  'literally.',
  '',
  'فِعْلٌ مَهْمُوزٌ',
  'manṣoob aor, مُضْارِعٌ مَنْصُوبٌ',
  'masculine, مُذَكَّرٌ.',
  'وَزْنٌ.',
  'mejzoom aorist, مُضَارِعٌ مَجْزُومٌ.',
  'اِسْتِعَارَةٌ.',
  'اِسْتِعَارِىٌّ.',
  'كِنَايَةٌ.',
  '',
  'noun, اِسْمٌ.',
  'noun of unity, وَاحِدَةٌ and وَاحِدٌ.',
  'nominative case, رَفْعٌ.',
  '',
  'مَفْعُولٌ or مَفْعُولٌ بِهِ.',
  '',
  'n.: see "act. part. n." and "pass. part. n."',
  'حَرْفٌ.',
  'passive, مَبْنِىٌّ لِلْمَفْعُولِ or لِلْمَجْهُولِ.',
  'perfect plural, جَمْعٌ سَالِمٌ; also called a sound pl., جَمْعٌ صَحِيحٌ.',
  'i.e. one which has not two radical letters alike, nor has ء nor و nor ى for one of its radical letters, فِعْلٌ سَالِمٌ. (See also "Sound verb.")',
  'person (of a verb).',
  'plural, جَمْعٌ. Pl. of pauc., for plural of paucity, جَمْعُ قِلَّةٍ. Pl of mult., for plural of multitude, جَمْعُ كَثْرَةٍ. Pl. pl., for plural of a plural, جَمْعُ جَمْعٍ.',
  'اِسْمٌ عَلى النَّسَبِ (a kind of relative noun).',
  'مُوَلَّدٌ and مُحْدَثٌ.',
  'see "Attribute."',
  'مُضَافٌ. 	Prep., for preposition حَرْفُ جَرًّ and sometimes صِفَةٌ',
  'preterite, مَاضٍ',
  'proverb مَشَلٌ',
  '',
  'quadriliteral-radical verb, فِعْلٌ رُبَاِٰىٌّ',
  'quasi-quadriliteral-radical verb, مُلْحَقٌ بِالرُّبَاعِىِّ فِعْلٌ',
  'quod vide.',
  'مُلْحَقٌ: see art. لحق.',
  'quasi-infinitive noun, اِسْمُ مَصْدَرٍ and اِسْمٌ لِلْمَصْدَرِ',
  'quasi-passive, مُطَاوِعٌ',
  'i.e. one having و or ى for its first radical letter, فَعْلٌ مِثَالٌ',
  '',
  'reduplicative quadriliteral-radical verb, فَِعْلٌ وُبَاِٰىٌّ مُضَاعَفٌ',
  'اِسْمُ عَيْنٍ or simply عَيْنٌ, and اِسْمُ ذَاتٍ or simply ذَاتٌ.',
  'اِسْمُ وِعَاءٍ',
  'regular: see "Analogous."',
  'relative noun, اِسْمٌ مَنْسُوبٌ, or نِسْبَةٌ',
  '',
  'اِسْمٌ.',
  'singular, مُفْرَدٌ and وَاحِدٌ.',
  'sound pluar: see "Perfect pl."',
  'i.e. one which is not of the class termed "perfect," but which has not و nor ى for one of this radical letters: or, as used in the \'Eyn and several other lexicons, one that has not و nor ى nor ء for one of its radical letters: فِعْلٌ صَحيِحٌ. (See "Perfect verb.")',
  'or discriminative, تَمْيِيزٌ',
  'denotative of, حَالٌ.',
  'مُسْنَدٌ إِلَيْهِ',
  'substantive, اِسْمٌ.',
  'بَدَلٌ.',
  'syllabical signs, شَكْلٌ',
  'synonym and synonymous, مُرَادِفٌ and مُتَرَادِفٌ. Syn. with, for synonymous with, لُغَةٌ فِى',
  '',
  'tradition, حَدِيثٌ',
  'transitive, مُتَعَدٍّ and وَاقِعٌ',
  'قَلْبٌ. Formed by transposition, مَقْلُوبٌ.',
  'مَجَازٌ and مَجَازِىٌّ',
  '',
  'i.e. one having و or ى for one of its radical letters: or, as used in the \'Eyn and several other lexicons, one having و or ى or ء for one of its radical letters: فِعْلٌ مُعْتَلٌّ',
  '',
  'verb, فِعْلٌ.',
  'اِسْمُ فِعْلٍ',
  '',
  '‡ means asserted to be tropical.',
  '‡‡ means asserted to be doubly tropical.',
  '† means supposed by me to tropical. ',
];
const List<String> AUTHORITIES_SHORT_FORMS = [
  'A',
  '†A',
  'AA',
  'AAF',
  'ADQ',
  'AḤát',
  'AḤei',
  'AHeyth',
  'AḤn',
  '†AM',
  'AO',
  'A\'Obeyd',
  'AZ',
  'Aal',
  'Akh',
  'Aṣ',
  '†Az',
  'B',
  'B',
  '†Bḍ',
  'Bkh',
  'Bṭl',
  'C',
  '‡CQ',
  'D',
  'Dmr',
  'E',
  '‡EM',
  'F',
  '†F',
  '†Fei',
  'Fr',
  'Fṣ',
  'H',
  '†Ḥam',
  '‡Ḥar',
  'Hr',
  'I',
  'I\'Aar',
  'I\'Ab',
  '‡I\'AQ',
  'IAmb',
  'IAth',
  'IB',
  '†IDrd',
  'IDrst',
  'IF',
  '†IHsh',
  'IJ',
  'IKh',
  'IQooṭ',
  'IQt',
  'IQṭṭ',
  '†IM',
  'IO',
  '†ISd',
  'ISk',
  '‡IbrD',
  'J',
  '†J',
  '‡JK',
  '‡JM',
  '‡JeL',
  'Jm',
  'K',
  '†Q',
  'QI',
  '‡KL',
  '‡KT',
  'Kf',
  'Kh',
  '†Kr',
  'Ks',
  '†Ksh',
  'Qt',
  'Qṭr',
  '‡Kull',
  '†Qur',
  'Qz',
  '†Qzw',
  'L',
  '†L',
  'Lb',
  'Lḥ',
  'Lth',
  'M',
  '†M',
  '‡MA',
  '†MF',
  '†MṢ',
  'Mbr',
  '†Meyd',
  '†Mgh',
  'Mj',
  '†Mṣb',
  '†Mṭr',
  '†Mughnee',
  '†Mz',
  'N',
  'Nh',
  'Ns',
  'O',
  'O',
  'P',
  '‡PṢ',
  'R',
  'R',
  'S',
  '†Ṣ',
  '‡SM',
  'Sb',
  'Seer',
  'Ṣgh',
  'Sh',
  'Suh',
  'T',
  '†T',
  '‡TA',
  '‡TK',
  'TṢ',
  '†TT',
  'Th',
  'W',
  '†W',
  'Y',
  'Yoo',
  'Yz',
  'Z',
  '†Z',
  'Zbd',
  '†Zj',
  'Note',
  '',
  '',
  '',
];

const List<String> AUTHORITIES_FULL_FORMS = [
  '',
  'The "Asás" of Ez-Zamakhsheree',
  'Aboo-\'Amr Ibn-El-\'Alà, and Aboo-\'AMr Esh-Sheybáee: each being cited simply by the name of "Aboo-\'Amr."',
  'Aboo-\'Alee El-Fárisee',
  'Abu-d-DuQeysh',
  'Aboo-Hátim Es-Sijistánee',
  'Aboo-Heiyán',
  'Abu-l-Heythem',
  'Aboo-Ḥaneefeh Ed-Deenawaree, author of the "Book of Plants"',
  'Aboo-Manṣoor (same as Az)',
  'Aboo-\'Obeydeh',
  'Aboo-\'Obeyd',
  'Aboo-Zeyd',
  'El-Aalam',
  'El-Akhfash',
  'El-Aṣma\'ee',
  'El-Azheree (same AM), author of the "Tahdheeb"',
  '',
  'The "Baṣáïr" by the author of the "Qámoos"',
  'El-Beyḍáwee\'s "Exposition of the "Qur-án"',
  'El-Bukháree',
  'EL-Baṭalyowsee',
  '',
  'The Calcutta edition of the "Qámoos"',
  '',
  'Ed-Demeeree',
  '',
  'The "Exposition of the Mo\'allaQát" printed in Calcutta',
  '',
  'El-Feyroozábádee, author of the "Qámoos"',
  'El-Feiyoomee, author of the "Miṣbáḥ"',
  'El-Farrà',
  'The "Faṣeeḥ" of Thaalab',
  '',
  'The "Exposition of the Ḥamáseh" ("Hamasae Carmina") by Et-Tebreezee',
  'El-Hareeree\'s "MuQámút" the Commentary on; 2nd edit. of Paris',
  'El-Harawee',
  '',
  'Ibn-El-Ararábee',
  'Ibn-\'Abbás',
  'Ibn-\'AQeel\'s "Exposition of the Alfeeyeh of Ibn-Málik" edited by Dr. Dieteriei"',
  'Ibn-El-Ambáree',
  'Ibn-El-Atheer El-Jezere, (Mejd-ed-Deen) author of the "Niháyeh"',
  'Ibn-Barree, author of the "Annotations on the Ṣiḥáḥ" with El-Busṭee',
  'Ibn-Dureyd, author of the "Jemharah" &c.',
  'Ibn-Durustaweyh',
  'Ibn-Fáris, author of the "Mujmal"',
  'Ibn-Hishám, author of the "Mughnee"',
  'Ibn-Jinnee',
  'Ibn-Khálaweyh',
  'Ibn-El-Qooṭeeyeh',
  'Ibn-Quteybeh',
  'Ibn-El-Qaṭṭáa',
  'Ibn-Mukarram, (commonly called in the Táj el-\'Aroos "Ibn-Manḍhoor") author of the "Lisán el-\'Arab"',
  'Ibn-\'Odeys',
  'Ibn-Seedeh, author of the "Moḥkam"',
  'Ibn-Es-Sikkeet (YaaQoob)',
  'Ibráheem Ed-DasooQee',
  '',
  'El-Jowharee, author of the "Ṣiḥáh"',
  'A MS. supposed to be the "Jámi\'" of El-Karmánee: a lexicon founded upon the "\'Eyn," with additions from the "Tekmilet el-\'Eyn" of El-Khárzenjee',
  'The "Jámi\'" of the seyyid Moḥammad',
  'The "Exposition of the Qur-án" by the Jeláleyn',
  'The "Jemharah" of Ibn-Dureyd.',
  '',
  'The "Qámoos"',
  'The Qáḍee of \'Iyáḍ',
  'The "Kenz el-Loghah," of Ibn-Maaroof; an Arabic-Persian Dictionary',
  'The Kitáb et-Taareefát',
  'The "Kifáyet el-Mutaḥaffiḍh"',
  'El-Khaleel, commonly supposed to be the author of the "\'Eyn"',
  'Kuráa, author of the "Munjid"',
  'El-Kisá-ee',
  'The "Keshsháf" of Ez-Zamakhsheree',
  'El-Quteybee',
  'Quṭrub',
  'The "Kulleeyát" of A bu-l-BaQà',
  'The "Qur-án"',
  'El-Qazzáz',
  'El-Qazweenee',
  '',
  'The "Lisán el-\'Arab"',
  'El-Leblee',
  'El-Liḥyánee',
  'El-Leyth Ibn-Naṣr Ibn-Seiyár, held by El-Azheree to be the author of the "\'Eyn," which he calls "Kitáb Leyth"',
  '',
  'The "Moḥkam"',
  'The "MuQaddamet of el-Adab" of Ez-Zamakhsheree',
  'Moḥammad Ibn-Eṭ-Teiyib El-Fásee, author of "Annotations on the Qámoos"',
  'The "Mukhtár eṣ-Ṣiḥáḥ"',
  'El-Mubarrad',
  'El-Meydánee\'s "Proverbs"',
  'The "Mughrib" of El-Muṭarrizee',
  'The "Mujmal" of Ibn-Fáris',
  '"The Miṣbáḥ" of El-Feiyoomee',
  'El-Muṭarrizee, author of the "Mughrib"',
  'The "Mughni-l-Lebeeb" of Ibn-Hishám',
  'The "Muzhir" of Es-Suyooṭee',
  '',
  'The "Niháye" of Ibn-El-Atheer El-Jezeree (Mejd ed-Deen)',
  'En-Nesa-ee',
  '',
  'The "\'Obáb" of Eṣ-Ṣaghánee',
  '',
  'The "Persian Translation of the Ṣiḥáḥ"',
  '',
  'The "Rowḍ" ("Er-Rowḍ el-Unuf") of Es-Suheylee',
  '',
  'The "Ṣiḥáḥ"',
  'The seyyid Murtaḍà, author of the "Táj el-\'Aroos"',
  'Seebawyh',
  'Es-Seeráfee',
  'Es-Ṣaghánee, author of the "\'Obáb" and the "Tekmileh fi-ṣ-Ṣiḥáḥ"',
  'Shemir',
  'Es-Suheylee, author of the "Rowḍ"',
  '',
  'The "Tahdheeb" of El-AZheree',
  'The "Táj el-\'Aroos"',
  'The "Turkish Translation of the Qámoos"',
  'The "Tekmileh fi-ṣ-Ṣiḥáḥ" of Eṣ-Ṣaghánee',
  'The "Tahdheeb et-Tahdheeb"',
  'Thaalab, author of the "Faṣeeḥ"',
  '',
  'El-Wáhidee\'s "Exposition of the Deewán of El-Mutanebbee," edited by Dr. Dieteriei',
  '',
  'Yoonus',
  'El-Yezeedee',
  '',
  'Ez-Zamakhsheree',
  'Ez-Zubeydee, author of an "Abridgement of the \'Eyn"',
  'Ez-Zejjáj',
  '',
  'All authorities are drawn through the medium of the Táj el-'
      'Aroos or the Lisán el-'
      'Arab except denoted by below marks.',
  '‡ - drawn immediately, from many of them they are drawn through the medium of some other lexicon than those two above.',
  '† - generally drawn immediately.',
];
