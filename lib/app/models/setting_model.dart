import 'parents/model.dart';

class Setting extends Model {
  late String appName;
  late bool enableStripe;
  late String defaultTax;
  late String defaultCurrency;
  late String fcmKey;
  late bool enablePaypal;
  late String defaultTheme;
  late String mainColor;
  late String mainDarkColor;
  late String secondColor;
  late String secondDarkColor;
  late String accentColor;
  late String accentDarkColor;
  late String scaffoldDarkColor;
  late String scaffoldColor;
  late String googleMapsKey;
  late String mobileLanguage;
  late String defaultCountryCode;
  late String appVersion;
  late bool enableVersion;
  late bool currencyRight;
  late int defaultCurrencyDecimalDigits;
  late bool enableRazorpay;
  late String distanceUnit;
  late bool enableOtp;
  late List modules;

  Setting(
      {required this.appName,
      required this.enableStripe,
      required this.defaultTax,
      required this.defaultCurrency,
      required this.fcmKey,
      required this.enablePaypal,
      required this.mainColor,
      required this.mainDarkColor,
      required this.secondColor,
      required this.secondDarkColor,
      required this.accentColor,
      required this.accentDarkColor,
      required this.scaffoldDarkColor,
      required this.scaffoldColor,
      required this.googleMapsKey,
      required this.mobileLanguage,
      required this.defaultCountryCode,
      required this.appVersion,
      required this.enableVersion,
      required this.currencyRight,
      required this.defaultCurrencyDecimalDigits,
      required this.enableRazorpay,
      required this.distanceUnit,
      required this.enableOtp,
      required this.modules});

  Setting.fromJson(Map<String, dynamic> json) {
    appName = json['app_name'];
    defaultTax = json['default_tax'];
    defaultCurrency = json['default_currency'];
    fcmKey = json['fcm_key'];
    defaultTheme = json['default_theme'];
    mainColor = json['main_color'];
    mainDarkColor = json['main_dark_color'];
    secondColor = json['second_color'];
    secondDarkColor = json['second_dark_color'];
    accentColor = json['accent_color'];
    accentDarkColor = json['accent_dark_color'];
    scaffoldDarkColor = json['scaffold_dark_color'];
    scaffoldColor = json['scaffold_color'];
    googleMapsKey = json['google_maps_key'];
    mobileLanguage = json['mobile_language'];
    defaultCountryCode = json['default_country_code'];
    appVersion = json['app_version'];
    enableVersion = boolFromJson(json, 'enable_version');
    currencyRight = boolFromJson(json, 'currency_right');
    enableRazorpay = boolFromJson(json, 'enable_razorpay');
    enableStripe = boolFromJson(json, 'enable_stripe');
    enablePaypal = boolFromJson(json, 'enable_paypal');
    defaultCurrencyDecimalDigits =
        int.tryParse(json['default_currency_decimal_digits'] ?? '2') ?? 2;
    distanceUnit = stringFromJson(json, 'distance_unit');
    enableOtp = boolFromJson(json, 'enable_otp');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['app_name'] = this.appName;
    data['enable_stripe'] = this.enableStripe;
    data['default_tax'] = this.defaultTax;
    data['default_currency'] = this.defaultCurrency;
    data['fcm_key'] = this.fcmKey;
    data['enable_paypal'] = this.enablePaypal;
    data['main_color'] = this.mainColor;
    data['default_theme'] = this.defaultTheme;
    data['main_dark_color'] = this.mainDarkColor;
    data['second_color'] = this.secondColor;
    data['second_dark_color'] = this.secondDarkColor;
    data['accent_color'] = this.accentColor;
    data['accent_dark_color'] = this.accentDarkColor;
    data['scaffold_dark_color'] = this.scaffoldDarkColor;
    data['scaffold_color'] = this.scaffoldColor;
    data['google_maps_key'] = this.googleMapsKey;
    data['mobile_language'] = this.mobileLanguage;
    data['default_country_code'] = this.defaultCountryCode;
    data['app_version'] = this.appVersion;
    data['enable_version'] = this.enableVersion;
    data['currency_right'] = this.currencyRight;
    data['default_currency_decimal_digits'] = this.defaultCurrencyDecimalDigits;
    data['enable_razorpay'] = this.enableRazorpay;
    data['distance_unit'] = this.distanceUnit;
    data['enable_otp'] = this.enableOtp;
    return data;
  }
}
