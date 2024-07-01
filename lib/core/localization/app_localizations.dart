import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @features.
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get features;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @lang.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get lang;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create An Account'**
  String get createAccount;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @heroTitle.
  ///
  /// In en, this message translates to:
  /// **'A Doctor\'s Second Brain and Companion.'**
  String get heroTitle;

  /// No description provided for @heroSubtitle.
  ///
  /// In en, this message translates to:
  /// **'ProKliniK HealthCare CRM is a Powerful Tool to Manage Your Workday and Keep in Touch With Your Patients.'**
  String get heroSubtitle;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @howItWorks.
  ///
  /// In en, this message translates to:
  /// **'How It Works?'**
  String get howItWorks;

  /// No description provided for @transparent.
  ///
  /// In en, this message translates to:
  /// **'Transparent Pricing For All.'**
  String get transparent;

  /// No description provided for @financing.
  ///
  /// In en, this message translates to:
  /// **'Online Business Financing With No Hidden Fees.'**
  String get financing;

  /// No description provided for @choosePlan.
  ///
  /// In en, this message translates to:
  /// **'Choose Subscription Plan'**
  String get choosePlan;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @yearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get yearly;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Package Name'**
  String get title;

  /// No description provided for @desc.
  ///
  /// In en, this message translates to:
  /// **'Package Description'**
  String get desc;

  /// No description provided for @fees.
  ///
  /// In en, this message translates to:
  /// **'Package Fees'**
  String get fees;

  /// No description provided for @egp.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get egp;

  /// No description provided for @try_.
  ///
  /// In en, this message translates to:
  /// **'Try'**
  String get try_;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions ?'**
  String get faq;

  /// No description provided for @better.
  ///
  /// In en, this message translates to:
  /// **'It\'s Better Than You Think.'**
  String get better;

  /// No description provided for @beyond.
  ///
  /// In en, this message translates to:
  /// **'It Goes Beyond Any Other Medical Software.'**
  String get beyond;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contact;

  /// No description provided for @letsTalk.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Talk.'**
  String get letsTalk;

  /// No description provided for @haveQuestions.
  ///
  /// In en, this message translates to:
  /// **'If You Have Any Questions About The Subscription Or Are Not Sure Which Plan is Right For You, Contact Our Team And Let\'s Schedule A Call.'**
  String get haveQuestions;

  /// No description provided for @callUs.
  ///
  /// In en, this message translates to:
  /// **'Call Us'**
  String get callUs;

  /// No description provided for @emailUs.
  ///
  /// In en, this message translates to:
  /// **'Email Us'**
  String get emailUs;

  /// No description provided for @visitHelpCenter.
  ///
  /// In en, this message translates to:
  /// **'Visit Help Center'**
  String get visitHelpCenter;

  /// No description provided for @visitUsPersonally.
  ///
  /// In en, this message translates to:
  /// **'Visit Us Personally'**
  String get visitUsPersonally;

  /// No description provided for @addressOne.
  ///
  /// In en, this message translates to:
  /// **'Zahraa El Maadi'**
  String get addressOne;

  /// No description provided for @addressTwo.
  ///
  /// In en, this message translates to:
  /// **'El Nada Tower'**
  String get addressTwo;

  /// No description provided for @addressThree.
  ///
  /// In en, this message translates to:
  /// **'First Floor'**
  String get addressThree;

  /// No description provided for @plansToPowerBus.
  ///
  /// In en, this message translates to:
  /// **'We Have Plans To Power Your Clinic Business. Tell Us Your Needs And We Will Contact You Shortly.'**
  String get plansToPowerBus;

  /// No description provided for @existingCustomer.
  ///
  /// In en, this message translates to:
  /// **'Are You An Existing Customer ?'**
  String get existingCustomer;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @onTrial.
  ///
  /// In en, this message translates to:
  /// **'On Trial'**
  String get onTrial;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get email;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone;

  /// No description provided for @helpYouWith.
  ///
  /// In en, this message translates to:
  /// **'What Can We Help You With ?'**
  String get helpYouWith;

  /// No description provided for @pricing.
  ///
  /// In en, this message translates to:
  /// **'Pricing'**
  String get pricing;

  /// No description provided for @learnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn More About Our Services.'**
  String get learnMore;

  /// No description provided for @legal.
  ///
  /// In en, this message translates to:
  /// **'Terms & Legal'**
  String get legal;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Kindly Enter Your Name.'**
  String get enterName;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Kindly Enter Your Valid Email Address.'**
  String get enterEmail;

  /// No description provided for @enterPhone.
  ///
  /// In en, this message translates to:
  /// **'Kindly Enter Your Mobile Phone Number.'**
  String get enterPhone;

  /// No description provided for @validatePhone.
  ///
  /// In en, this message translates to:
  /// **'Kindly Enter a Valid Mobile Number With 11 Digits.'**
  String get validatePhone;

  /// No description provided for @enterMessage.
  ///
  /// In en, this message translates to:
  /// **'Kindly Enter Your Message.'**
  String get enterMessage;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Your Message Got To Us Successfully.'**
  String get success;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Something Went Wrong. Please Try Again Later.'**
  String get failed;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
