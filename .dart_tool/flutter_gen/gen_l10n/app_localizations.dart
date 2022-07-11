
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_zh.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'gen_l10n/app_localizations.dart';
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
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ta'),
    Locale('tr'),
    Locale('zh')
  ];

  /// Geçerli Dil
  ///
  /// In tr, this message translates to:
  /// **'Türkçe'**
  String get language;

  /// No description provided for @find.
  ///
  /// In tr, this message translates to:
  /// **'Daha Fazla Bilgi'**
  String get find;

  /// No description provided for @home.
  ///
  /// In tr, this message translates to:
  /// **'Ana Sayfa'**
  String get home;

  /// No description provided for @n1.
  ///
  /// In tr, this message translates to:
  /// **'Bitki Yetiştiriciliği hakkında bilgi almak için tıklayınız'**
  String get n1;

  /// No description provided for @n2.
  ///
  /// In tr, this message translates to:
  /// **'Tübitak araştırma kurumuyla ilgili bilgi almak için tıklayınız'**
  String get n2;

  /// No description provided for @n3.
  ///
  /// In tr, this message translates to:
  /// **'mmlik yağış durumları ve 14 günlük hava durumu '**
  String get n3;

  /// No description provided for @system.
  ///
  /// In tr, this message translates to:
  /// **'Sistem'**
  String get system;

  /// No description provided for @asystem.
  ///
  /// In tr, this message translates to:
  /// **'Yeni sistem ekle'**
  String get asystem;

  /// No description provided for @wm.
  ///
  /// In tr, this message translates to:
  /// **'Toprak İzleme ve NPK Kontrol Sistemi'**
  String get wm;

  /// No description provided for @nL.
  ///
  /// In tr, this message translates to:
  /// **'Giriş yap'**
  String get nL;

  /// No description provided for @nS.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt ol'**
  String get nS;

  /// No description provided for @analytics.
  ///
  /// In tr, this message translates to:
  /// **'Grafikler'**
  String get analytics;

  /// No description provided for @noti.
  ///
  /// In tr, this message translates to:
  /// **'Bilgilendirme'**
  String get noti;

  /// No description provided for @messages.
  ///
  /// In tr, this message translates to:
  /// **'Ürünler'**
  String get messages;

  /// No description provided for @qA.
  ///
  /// In tr, this message translates to:
  /// **'Ürünler'**
  String get qA;

  /// No description provided for @fq.
  ///
  /// In tr, this message translates to:
  /// **'Bilgiler'**
  String get fq;

  /// No description provided for @lan.
  ///
  /// In tr, this message translates to:
  /// **'Diller'**
  String get lan;

  /// No description provided for @sout.
  ///
  /// In tr, this message translates to:
  /// **'Çıkış Yap'**
  String get sout;

  /// No description provided for @setting.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get setting;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ta', 'tr', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ta': return AppLocalizationsTa();
    case 'tr': return AppLocalizationsTr();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
