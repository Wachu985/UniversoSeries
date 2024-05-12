// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Signed In`
  String get signIntoasTitle {
    return Intl.message(
      'Signed In',
      name: 'signIntoasTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy your stay.`
  String get signIntoasDescription {
    return Intl.message(
      'Enjoy your stay.',
      name: 'signIntoasDescription',
      desc: '',
      args: [],
    );
  }

  /// `An error has occurred.`
  String get signIntoasErrorTitle {
    return Intl.message(
      'An error has occurred.',
      name: 'signIntoasErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signInBoxTitle {
    return Intl.message(
      'Sign In',
      name: 'signInBoxTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get signInEmail {
    return Intl.message(
      'Email',
      name: 'signInEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signInPassword {
    return Intl.message(
      'Password',
      name: 'signInPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signInButton {
    return Intl.message(
      'Sign In',
      name: 'signInButton',
      desc: '',
      args: [],
    );
  }

  /// `Sign In with Google`
  String get signInButtonGoogle {
    return Intl.message(
      'Sign In with Google',
      name: 'signInButtonGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Dont have an account?`
  String get signInCreateAccount1 {
    return Intl.message(
      'Dont have an account?',
      name: 'signInCreateAccount1',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get signInCreateAccount2 {
    return Intl.message(
      'Create Account',
      name: 'signInCreateAccount2',
      desc: '',
      args: [],
    );
  }

  /// `Account Created`
  String get signUptoasTitle {
    return Intl.message(
      'Account Created',
      name: 'signUptoasTitle',
      desc: '',
      args: [],
    );
  }

  /// `Check your email.`
  String get signUptoasDescription {
    return Intl.message(
      'Check your email.',
      name: 'signUptoasDescription',
      desc: '',
      args: [],
    );
  }

  /// `An error has occurred.`
  String get signUptoasErrorTitle {
    return Intl.message(
      'An error has occurred.',
      name: 'signUptoasErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get signUpBoxTitle {
    return Intl.message(
      'Create Account',
      name: 'signUpBoxTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get signUpEmail {
    return Intl.message(
      'Email',
      name: 'signUpEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signUpPassword {
    return Intl.message(
      'Password',
      name: 'signUpPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUpButton {
    return Intl.message(
      'Sign Up',
      name: 'signUpButton',
      desc: '',
      args: [],
    );
  }

  /// `Sign In with Google`
  String get signUpButtonGoogle {
    return Intl.message(
      'Sign In with Google',
      name: 'signUpButtonGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get signUpCreateAccount1 {
    return Intl.message(
      'Already have an account?',
      name: 'signUpCreateAccount1',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signUpCreateAccount2 {
    return Intl.message(
      'Sign In',
      name: 'signUpCreateAccount2',
      desc: '',
      args: [],
    );
  }

  /// `Session Closed`
  String get settingsToastTitle {
    return Intl.message(
      'Session Closed',
      name: 'settingsToastTitle',
      desc: '',
      args: [],
    );
  }

  /// `Come back soon.`
  String get settingsToastDescription {
    return Intl.message(
      'Come back soon.',
      name: 'settingsToastDescription',
      desc: '',
      args: [],
    );
  }

  /// `Developer`
  String get settingsDeveloperName {
    return Intl.message(
      'Developer',
      name: 'settingsDeveloperName',
      desc: '',
      args: [],
    );
  }

  /// `Github Repository`
  String get settingsGithubRepository {
    return Intl.message(
      'Github Repository',
      name: 'settingsGithubRepository',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get settingsDarkModeTitle {
    return Intl.message(
      'Dark Mode',
      name: 'settingsDarkModeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enable dark mode`
  String get settingsDarkModeSustitle {
    return Intl.message(
      'Enable dark mode',
      name: 'settingsDarkModeSustitle',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get settingsColorTitle {
    return Intl.message(
      'Color',
      name: 'settingsColorTitle',
      desc: '',
      args: [],
    );
  }

  /// `App color`
  String get settingsColorSustitle {
    return Intl.message(
      'App color',
      name: 'settingsColorSustitle',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get settingsAboutTitle {
    return Intl.message(
      'About',
      name: 'settingsAboutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Information`
  String get settingsAboutSustitle {
    return Intl.message(
      'Information',
      name: 'settingsAboutSustitle',
      desc: '',
      args: [],
    );
  }

  /// `Application developed by:`
  String get settingsAboutText1 {
    return Intl.message(
      'Application developed by:',
      name: 'settingsAboutText1',
      desc: '',
      args: [],
    );
  }

  /// `@All rights reserved.`
  String get settingsAboutText2 {
    return Intl.message(
      '@All rights reserved.',
      name: 'settingsAboutText2',
      desc: '',
      args: [],
    );
  }

  /// `Close Session`
  String get settingsCloseSesionTitle {
    return Intl.message(
      'Close Session',
      name: 'settingsCloseSesionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Close user session.`
  String get settingsCloseSesionSubtitle {
    return Intl.message(
      'Close user session.',
      name: 'settingsCloseSesionSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsAppbarTitle {
    return Intl.message(
      'Settings',
      name: 'settingsAppbarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get settingsLanguageTitle {
    return Intl.message(
      'Language',
      name: 'settingsLanguageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Change the application language.`
  String get settingsLanguageSubtitle {
    return Intl.message(
      'Change the application language.',
      name: 'settingsLanguageSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `See Seasons`
  String get descriptionSeeSeasons {
    return Intl.message(
      'See Seasons',
      name: 'descriptionSeeSeasons',
      desc: '',
      args: [],
    );
  }

  /// `Latest Series`
  String get homeText1 {
    return Intl.message(
      'Latest Series',
      name: 'homeText1',
      desc: '',
      args: [],
    );
  }

  /// `Catalog`
  String get homeText2 {
    return Intl.message(
      'Catalog',
      name: 'homeText2',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get homeText3 {
    return Intl.message(
      'Favorites',
      name: 'homeText3',
      desc: '',
      args: [],
    );
  }

  /// `Seasons`
  String get temporadasText {
    return Intl.message(
      'Seasons',
      name: 'temporadasText',
      desc: '',
      args: [],
    );
  }

  /// `You have no favorite series.`
  String get favoritesViewText {
    return Intl.message(
      'You have no favorite series.',
      name: 'favoritesViewText',
      desc: '',
      args: [],
    );
  }

  /// `Popular Series`
  String get homeViewText {
    return Intl.message(
      'Popular Series',
      name: 'homeViewText',
      desc: '',
      args: [],
    );
  }

  /// `There are no series on the server.`
  String get mediaViewText1 {
    return Intl.message(
      'There are no series on the server.',
      name: 'mediaViewText1',
      desc: '',
      args: [],
    );
  }

  /// `There was an error connecting to the server.`
  String get mediaViewText2 {
    return Intl.message(
      'There was an error connecting to the server.',
      name: 'mediaViewText2',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get label1 {
    return Intl.message(
      'Home',
      name: 'label1',
      desc: '',
      args: [],
    );
  }

  /// `Catalog`
  String get label2 {
    return Intl.message(
      'Catalog',
      name: 'label2',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get label3 {
    return Intl.message(
      'Favorites',
      name: 'label3',
      desc: '',
      args: [],
    );
  }

  /// `User not found.`
  String get userNotFound {
    return Intl.message(
      'User not found.',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Access token not found.`
  String get accessTokenNotFound {
    return Intl.message(
      'Access token not found.',
      name: 'accessTokenNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Id token not found.`
  String get idTokenNotFound {
    return Intl.message(
      'Id token not found.',
      name: 'idTokenNotFound',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while signing in with Google.`
  String get googleError {
    return Intl.message(
      'An error occurred while signing in with Google.',
      name: 'googleError',
      desc: '',
      args: [],
    );
  }

  /// `Field is required`
  String get fieldRequired {
    return Intl.message(
      'Field is required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get emailError {
    return Intl.message(
      'Invalid email',
      name: 'emailError',
      desc: '',
      args: [],
    );
  }

  /// `Minimum 6 characters`
  String get passwordError {
    return Intl.message(
      'Minimum 6 characters',
      name: 'passwordError',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
