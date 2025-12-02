import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @erectionTest.
  ///
  /// In en, this message translates to:
  /// **'Erection Test'**
  String get erectionTest;

  /// No description provided for @calculateScore.
  ///
  /// In en, this message translates to:
  /// **'Calculate Score'**
  String get calculateScore;

  /// No description provided for @questionnaireIncomplete.
  ///
  /// In en, this message translates to:
  /// **'Questionnaire Incomplete'**
  String get questionnaireIncomplete;

  /// No description provided for @questionnaireReset.
  ///
  /// In en, this message translates to:
  /// **'Questionnaire Reset'**
  String get questionnaireReset;

  /// No description provided for @retakeTest.
  ///
  /// In en, this message translates to:
  /// **'Re-Take Test'**
  String get retakeTest;

  /// No description provided for @designedByKareemZaher.
  ///
  /// In en, this message translates to:
  /// **'By Dr. Kareem Zaher'**
  String get designedByKareemZaher;

  /// No description provided for @copyright.
  ///
  /// In en, this message translates to:
  /// **'All Rights Reserved'**
  String get copyright;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @test.
  ///
  /// In en, this message translates to:
  /// **'Test'**
  String get test;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @beginTest.
  ///
  /// In en, this message translates to:
  /// **'Begin Test'**
  String get beginTest;

  /// No description provided for @introText.
  ///
  /// In en, this message translates to:
  /// **'These questions ask about the effects that your erection problems have had on your sex life over the last four weeks. Please try to answer the questions as honestly and as clearly as you are able. Your answers will help your doctor to choose the most effective treatment suited to your condition.'**
  String get introText;

  /// No description provided for @guidlinesTitle.
  ///
  /// In en, this message translates to:
  /// **'Guidelines on Clinical Application of IIEF Patient Questionnaire'**
  String get guidlinesTitle;

  /// No description provided for @guidlinesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The 15-question IIEF questionnaire is a validated tool for assessing erectile dysfunction across 4 domains:'**
  String get guidlinesSubtitle;

  /// No description provided for @domainOne.
  ///
  /// In en, this message translates to:
  /// **'Erectile function'**
  String get domainOne;

  /// No description provided for @domainTwo.
  ///
  /// In en, this message translates to:
  /// **'Orgasmic function'**
  String get domainTwo;

  /// No description provided for @domainThree.
  ///
  /// In en, this message translates to:
  /// **'Sexual desire'**
  String get domainThree;

  /// No description provided for @domainFour.
  ///
  /// In en, this message translates to:
  /// **'Intercourse satisfaction'**
  String get domainFour;

  /// No description provided for @domainFive.
  ///
  /// In en, this message translates to:
  /// **'Overall satisfaction'**
  String get domainFive;

  /// No description provided for @guidelinesEnd.
  ///
  /// In en, this message translates to:
  /// **'Mean scores in research show clear differences between healthy men and patients.'**
  String get guidelinesEnd;

  /// No description provided for @clinicalApplications.
  ///
  /// In en, this message translates to:
  /// **'Clinical application includes:'**
  String get clinicalApplications;

  /// No description provided for @cAppOne.
  ///
  /// In en, this message translates to:
  /// **'Low erectile function score → Trial of Sildenafil'**
  String get cAppOne;

  /// No description provided for @cAppTwo.
  ///
  /// In en, this message translates to:
  /// **'Primary orgasm/ejaculation disorder → Specialist referral'**
  String get cAppTwo;

  /// No description provided for @cAppThree.
  ///
  /// In en, this message translates to:
  /// **'Low desire → Check androgen & prolactin'**
  String get cAppThree;

  /// No description provided for @cAppFour.
  ///
  /// In en, this message translates to:
  /// **'Low satisfaction with moderate erectile dysfunction → Consider psychosexual counselling'**
  String get cAppFour;

  /// No description provided for @definitions.
  ///
  /// In en, this message translates to:
  /// **'Definitions'**
  String get definitions;

  /// No description provided for @defOne.
  ///
  /// In en, this message translates to:
  /// **'Sexual activity includes intercourse, caressing, foreplay & masturbation'**
  String get defOne;

  /// No description provided for @defTwo.
  ///
  /// In en, this message translates to:
  /// **'Sexual intercourse = sexual penetration of your partner'**
  String get defTwo;

  /// No description provided for @defThree.
  ///
  /// In en, this message translates to:
  /// **'Sexual stimulation = situations such as foreplay, erotic pictures etc.'**
  String get defThree;

  /// No description provided for @defFour.
  ///
  /// In en, this message translates to:
  /// **'Ejaculation = ejection of semen from the penis (or the feeling of this)'**
  String get defFour;

  /// No description provided for @defFive.
  ///
  /// In en, this message translates to:
  /// **'Orgasm = fulfilment or climax following sexual stimulation or intercourse'**
  String get defFive;

  /// No description provided for @disclaimerTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Disclaimer'**
  String get disclaimerTitle;

  /// No description provided for @disclaimerP1.
  ///
  /// In en, this message translates to:
  /// **'This website does not collect, store, or process any personal information from its users. We do not use cookies, tracking tools, analytics services, or any other technologies that collect data about your visit.'**
  String get disclaimerP1;

  /// No description provided for @disclaimerP2.
  ///
  /// In en, this message translates to:
  /// **'By using this website, you can be assured that your privacy is fully respected and protected.'**
  String get disclaimerP2;

  /// No description provided for @questionsLastFourWeeks.
  ///
  /// In en, this message translates to:
  /// **'Answer The Questions For The Last Four Weeks'**
  String get questionsLastFourWeeks;

  /// No description provided for @importantConsiderations.
  ///
  /// In en, this message translates to:
  /// **'Important Considerations'**
  String get importantConsiderations;

  /// No description provided for @considerationOne.
  ///
  /// In en, this message translates to:
  /// **'This test is resticted by the superficial knowledge of psychosexual background and the very limited background of partner relationship, both important factors in the presentation of male sexual dysfunction. Analysis of the questionnaire should, therefore, be viewed as an adjunct to, rather than  a substitute for, a detailed sexual history and examination.'**
  String get considerationOne;

  /// No description provided for @testResult.
  ///
  /// In en, this message translates to:
  /// **'Test Result'**
  String get testResult;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
