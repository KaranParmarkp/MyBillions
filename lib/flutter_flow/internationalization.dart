import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'de', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? deText = '',
    String? arText = '',
  }) =>
      [enText, esText, deText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // old_sign_in_screen
  {
    'q6ob0xyl': {
      'en': 'Welcome Back!',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0ovsjh1t': {
      'en': 'Forgot Password?',
      'ar': '',
      'de': '',
      'es': '',
    },
    'i493ezcj': {
      'en': 'Don\'t have an account?',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jpjkqjo8': {
      'en': 'Sign up here.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9ynx3492': {
      'en': 'Continue as guest',
      'ar': '',
      'de': '',
      'es': '',
    },
    'i9w5u9wz': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5ixxswxm': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fgviahlo': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // dashboard_screen
  {
    '8z7fcgm7': {
      'en': '   Financial Summery  ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tbjs6jxa': {
      'en': 'Overview',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2su4askl': {
      'en': 'Market Value',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5hl37btk': {
      'en': 'Appreciation',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1gyi7gq6': {
      'en': 'XIRR',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4v86puiy': {
      'en': 'Performance',
      'ar': '',
      'de': '',
      'es': '',
    },
    '797pk3yk': {
      'en': '12/01/2024\t',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k3tre77v': {
      'en': 'Portfolio',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qjmr2j8t': {
      'en': 'Nifty',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gyb35cf5': {
      'en': 'Return\nPerformance',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qejnh2uv': {
      'en': '1st Week\t',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7bszsr10': {
      'en': '15 Days\t',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9vmpx1p0': {
      'en': '1 Month\t',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5zu5gtns': {
      'en': '3 Month\t',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5kjk13kd': {
      'en': '6 Month\t',
      'ar': '',
      'de': '',
      'es': '',
    },
    'x3wx06qd': {
      'en': '1 Year',
      'ar': '',
      'de': '',
      'es': '',
    },
    'w4uvqu0w': {
      'en': 'Market Value',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fuowqctu': {
      'en': 'Appreciation',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3rzpm0kw': {
      'en': 'Target',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vuy4605d': {
      'en': '  Recommandations  ',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0ki8es5y': {
      'en': 'Tab View 2',
      'ar': '',
      'de': '',
      'es': '',
    },
    'psqt2z31': {
      'en': '  Reports  ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vvd36san': {
      'en': 'Tab View 3',
      'ar': '',
      'de': '',
      'es': '',
    },
    'c2tpa7a9': {
      'en': '  Trend Analysis  ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p72m8qjl': {
      'en': 'Tab View 4',
      'ar': '',
      'de': '',
      'es': '',
    },
    'w3tvu8z5': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // sign_in_screen
  {
    '43t0y3xs': {
      'en': 'Welcome back',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3fl1m6c9': {
      'en': 'Forgot Password?',
      'ar': '',
      'de': '',
      'es': '',
    },
    '40jyrp3x': {
      'en': 'Don\'t have an account?',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lncdba6b': {
      'en': 'Create',
      'ar': '',
      'de': '',
      'es': '',
    },
    'e5q9lvpr': {
      'en': 'Continue as Guest',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ud9msca3': {
      'en': 'Enter email.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0hsv8txv': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'b4jjjhib': {
      'en': 'Enter password.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'elcatcyb': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3hxzu1in': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // forgot_password_screen
  {
    's6tj9e8y': {
      'en': 'Forgot Password',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4rvkm36l': {
      'en': 'Enter email.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wu97299x': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'z41ebmoh': {
      'en': 'Enter password.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jswn01sv': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1skcaefr': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // sign_up_screen
  {
    '0n02yfyh': {
      'en': 'Register',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9psf6yrm': {
      'en': 'Forgot Password?',
      'ar': '',
      'de': '',
      'es': '',
    },
    'o1xk7b0j': {
      'en': 'Already have an account?',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ps110ezr': {
      'en': 'Login',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2e5vnbfe': {
      'en': 'Enter firstname.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '11fklys8': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    '306h25ij': {
      'en': 'Enter lastname.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3onnpkgr': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pa9d3nd7': {
      'en': 'Enter phone number.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5nolmk4z': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'df09m6ag': {
      'en': 'Enter email.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vbi91z2n': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ohidru6f': {
      'en': 'Enter password.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6qkq3heq': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'o1qn97rz': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // reset_password_screen
  {
    'idx79yiw': {
      'en': 'Reset Password',
      'ar': '',
      'de': '',
      'es': '',
    },
    '52fvmaed': {
      'en': 'Enter security code.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fzjg2525': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'g498p9hj': {
      'en': 'Enter new password.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'o36mrpxe': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4beq4mvg': {
      'en': 'Enter confirm new password.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mogyhgop': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
      'de': '',
      'es': '',
    },
    'b994gw54': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // goal_screen
  {
    's9lvh59k': {
      'en': 'Goal',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // profile_screen
  {
    'vwe8td70': {
      'en': '   Financial Summery  ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k5xvszsa': {
      'en': 'Overview',
      'ar': '',
      'de': '',
      'es': '',
    },
    'trilsovg': {
      'en': '1,18,250',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pn9uj0fl': {
      'en': 'Market Value',
      'ar': '',
      'de': '',
      'es': '',
    },
    '22dq2skq': {
      'en': '1,18,250',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tu641kvq': {
      'en': 'Appreciation',
      'ar': '',
      'de': '',
      'es': '',
    },
    'trihb9mu': {
      'en': '1,18,250',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ra0e9i8b': {
      'en': 'XIRR',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ylk70498': {
      'en': 'Performance',
      'ar': '',
      'de': '',
      'es': '',
    },
    'axgeittq': {
      'en': 'Preferred Date',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2mepj1ig': {
      'en': 'Edit Header 2',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qdjyx6aj': {
      'en': 'Edit Header 3',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8qjn0si3': {
      'en': 'Edit Column 1',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9jpimh0o': {
      'en': 'Edit Column 2',
      'ar': '',
      'de': '',
      'es': '',
    },
    'agnxsxox': {
      'en': 'Edit Column 3',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rqxvcg0u': {
      'en': '  Recommandations  ',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7cv2p8jd': {
      'en': 'Tab View 2',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7um8pjiq': {
      'en': '  Reports  ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'z6shqoar': {
      'en': 'Tab View 3',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0dxaxhn8': {
      'en': '  Trend Analysis  ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'z2nkrxuf': {
      'en': 'Tab View 4',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vqgmnr1c': {
      'en': 'Profile',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Miscellaneous
  {
    'qbmoi1av': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'de': 'Anmeldung',
      'es': 'Acceso',
    },
    'lzyb73wy': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kx9cdks4': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'efvtwj7k': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ec5hfa1e': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q5ljwvfo': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j4rmwb3h': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6ah1b18f': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2kos1hen': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sdhcuqaz': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ybbm4rlz': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cu8l0zlh': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nenija2a': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '123mk11n': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'aox3s4fb': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l8hv5a7z': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4pjwb70a': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0xlokf4y': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8twlwiwt': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lavxzhgu': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'awkz92m7': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p4iylqpr': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ixoh0sky': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kawxecus': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wk4nzbz1': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    't4xzlq9q': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '513nj4m0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a1jxfgju': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
