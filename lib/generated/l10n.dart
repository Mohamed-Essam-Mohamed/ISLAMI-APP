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

  /// `Islami`
  String get Islami {
    return Intl.message(
      'Islami',
      name: 'Islami',
      desc: '',
      args: [],
    );
  }

  /// `Quran`
  String get Quran {
    return Intl.message(
      'Quran',
      name: 'Quran',
      desc: '',
      args: [],
    );
  }

  /// `hadeth`
  String get Hadeth {
    return Intl.message(
      'hadeth',
      name: 'Hadeth',
      desc: '',
      args: [],
    );
  }

  /// `sebha`
  String get Sebha {
    return Intl.message(
      'sebha',
      name: 'Sebha',
      desc: '',
      args: [],
    );
  }

  /// `radio`
  String get Radio {
    return Intl.message(
      'radio',
      name: 'Radio',
      desc: '',
      args: [],
    );
  }

  /// `Sura Name`
  String get Sura_name {
    return Intl.message(
      'Sura Name',
      name: 'Sura_name',
      desc: '',
      args: [],
    );
  }

  /// `hadeth name`
  String get Hadeth_name {
    return Intl.message(
      'hadeth name',
      name: 'Hadeth_name',
      desc: '',
      args: [],
    );
  }

  /// `Broadcast Al quran Al karim`
  String get BroadcastAlquranAlkarim {
    return Intl.message(
      'Broadcast Al quran Al karim',
      name: 'BroadcastAlquranAlkarim',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get Light {
    return Intl.message(
      'Light',
      name: 'Light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get Dark {
    return Intl.message(
      'Dark',
      name: 'Dark',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get Theme {
    return Intl.message(
      'Theme',
      name: 'Theme',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get Setting {
    return Intl.message(
      'Setting',
      name: 'Setting',
      desc: '',
      args: [],
    );
  }

  /// `Number Of Al tasbihat`
  String get NumberOfAltasbihat {
    return Intl.message(
      'Number Of Al tasbihat',
      name: 'NumberOfAltasbihat',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
