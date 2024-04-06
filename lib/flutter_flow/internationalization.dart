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
  // dashboard_screen
  {
    'tjqo0w8o': {
      'en': 'Financial Summary',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1adj995k': {
      'en': 'Financial Summary',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1evkulr5': {
      'en': 'Recommendations',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dw3g7vqf': {
      'en': 'Reports',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9s3j5jon': {
      'en': 'Trend Analysis',
      'ar': '',
      'de': '',
      'es': '',
    },
    'houe2s3t': {
      'en': 'Search for an item...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'w3tvu8z5': {
      'en': 'Dashboard',
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
    '6ecsvbt9': {
      'en': 'Personal Details',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ik1wsoxn': {
      'en': 'Client Management',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4lvlfhb1': {
      'en': 'Fee Details',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xfllog23': {
      'en': 'SIP Details',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2yngf2sz': {
      'en': 'Change Password',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ajf4itwa': {
      'en': 'Logout',
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
  // personal_details_screen
  {
    'p8nxyfu8': {
      'en': 'Tax Type',
      'ar': '',
      'de': '',
      'es': '',
    },
    'swyxzzg8': {
      'en': 'Below 30%',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rhugfwjx': {
      'en': 'Above 30%',
      'ar': '',
      'de': '',
      'es': '',
    },
    'aodafwim': {
      'en': 'Res Type',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xpxo7l0n': {
      'en': 'Indian',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fpqe7r2x': {
      'en': 'NRI (USA/Canada)',
      'ar': '',
      'de': '',
      'es': '',
    },
    'h4akqgwv': {
      'en': 'Other NRI',
      'ar': '',
      'de': '',
      'es': '',
    },
    '17v3oe7v': {
      'en': 'Personal Details',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6y69059q': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // fees_details_screen
  {
    'uriuwq1y': {
      'en': 'Billing Cycle',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ry1vqvsa': {
      'en': 'Net Amount',
      'ar': '',
      'de': '',
      'es': '',
    },
    '17iyvowr': {
      'en': 'GST',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wt38z6k8': {
      'en': 'Total Amount',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5h8kdxcu': {
      'en': 'DOWNLOAD',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qppt28xc': {
      'en': 'Fees Details',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dj8jhkjt': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // client_screen
  {
    '8jbxxezz': {
      'en': 'Client Code',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ho9jxa6b': {
      'en': 'IFSC',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ani945rh': {
      'en': 'A/C No.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'uer1olm4': {
      'en': 'Holding',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bf1rmzjj': {
      'en': 'Bank Name',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1795b9kz': {
      'en': 'Tax Status',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zj3467pf': {
      'en': 'Client Management',
      'ar': '',
      'de': '',
      'es': '',
    },
    'deuw0um1': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // recommendation_component
  {
    'j9bdev43': {
      'en': 'Plan Name\t',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4zduvm00': {
      'en': 'Current Scheme\t',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bqoh47gg': {
      'en': 'Type',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2m51f4sz': {
      'en': 'New Scheme\t',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2b5axjzt': {
      'en': 'Amount',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vkzakfbr': {
      'en': 'Unit',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3s1delma': {
      'en': 'Expiry',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // recommendations_list
  {
    'vrccb3w9': {
      'en': 'Current Scheme',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fzex5abw': {
      'en': 'New Scheme',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kepsg7kr': {
      'en': 'Amount',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l5edn708': {
      'en': 'Expiray',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gf3ptt0b': {
      'en': 'Remarks',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // financial_summary
  {
    'nr4ftbry': {
      'en': 'Overview',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jr6g25va': {
      'en': 'Market Value',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ix6w006n': {
      'en': 'Appreciation',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4jfuyhe1': {
      'en': 'XIRR',
      'ar': '',
      'de': '',
      'es': '',
    },
    '59kahniy': {
      'en': 'Performance',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sas7gor9': {
      'en': '12/01/2024\t',
      'ar': '',
      'de': '',
      'es': '',
    },
    'axs5by4i': {
      'en': 'Portfolio',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3ff6xf20': {
      'en': 'Nifty',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q9brrqkk': {
      'en': 'Return\nPerformance',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q2lyvn90': {
      'en': '1st Week\t',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ty0zuspy': {
      'en': '15 Days\t',
      'ar': '',
      'de': '',
      'es': '',
    },
    'f6qoqzsg': {
      'en': '1 Month\t',
      'ar': '',
      'de': '',
      'es': '',
    },
    '189bhi84': {
      'en': '3 Month\t',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ja3cy3qb': {
      'en': '6 Month\t',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6e717uf0': {
      'en': '1 Year',
      'ar': '',
      'de': '',
      'es': '',
    },
    'frppkyvg': {
      'en': 'Goals',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q8oq6y5f': {
      'en': 'Market Value',
      'ar': '',
      'de': '',
      'es': '',
    },
    'oruv8k1g': {
      'en': 'Appreciation',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7uhv5pab': {
      'en': 'Target',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // reports
  {
    '7591v64d': {
      'en': 'Portfolio Summary',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2s8ciah3': {
      'en': 'Portfolio Summary',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wmkjs0v8': {
      'en': 'Transaction Report',
      'ar': '',
      'de': '',
      'es': '',
    },
    '081ff49z': {
      'en': 'Capital Gain',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vyesc9ie': {
      'en': 'Portfolio Allocation',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lsyw0c0u': {
      'en': 'US PFIC',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xdjfrw5c': {
      'en': 'Search for an item...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j1odlb89': {
      'en': 'Filters',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // pf_filters
  {
    'zxcf4vcy': {
      'en': 'Applicant',
      'ar': '',
      'de': '',
      'es': '',
    },
    '07zfvzsj': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zd9sbwoj': {
      'en': 'Portfolio Summary',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wsqaq78f': {
      'en': 'Transaction Report',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7vd1bw1u': {
      'en': 'Capital Gain',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ny4dnud3': {
      'en': 'Portfolio Allocation',
      'ar': '',
      'de': '',
      'es': '',
    },
    'u69909x8': {
      'en': 'US PFIC',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3i8u78y9': {
      'en': 'Search for an item...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'n1i2nl2q': {
      'en': 'Goals',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pgzgs0xq': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dvef5x3g': {
      'en': 'Portfolio Summary',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hy640gvg': {
      'en': 'Transaction Report',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3aygx4yq': {
      'en': 'Capital Gain',
      'ar': '',
      'de': '',
      'es': '',
    },
    '50fi1khr': {
      'en': 'Portfolio Allocation',
      'ar': '',
      'de': '',
      'es': '',
    },
    'oya1wrwp': {
      'en': 'US PFIC',
      'ar': '',
      'de': '',
      'es': '',
    },
    'iau4r46d': {
      'en': 'Search for an item...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dofqtu08': {
      'en': 'Category',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vdjzjp10': {
      'en': 'All',
      'ar': '',
      'de': '',
      'es': '',
    },
    'i449h7cj': {
      'en': 'All',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gdh05wag': {
      'en': 'Equity',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jr7vqomw': {
      'en': 'Debt',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gdoqlc72': {
      'en': 'Search for an item...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nini1d2f': {
      'en': 'StartDate',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nmeuniew': {
      'en': 'EndDate',
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
