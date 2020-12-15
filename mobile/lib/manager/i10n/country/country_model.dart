import 'package:flutter/foundation.dart';

/// A [Country] model represents an instance of a country which contains
/// information about the country
class Country {
  /// The name of the [Country]
  final String name;

  /// The isoCode of the [Country]
  final String countryCode;

  /// The dialCode of the [Country]
  final String dialCode;

  /// The flagUri which links to the flag for the [Country] in the library assets
  final String flagUri;

  /// The nameTranslation for translation
  final Map<String, String> nameTranslations;

  Country({
    @required this.name,
    @required this.countryCode,
    @required this.dialCode,
    @required this.flagUri,
    this.nameTranslations,
  });

  /// Convert [Countries.countryList] to [Country] model
  factory Country.fromJson(Map<String, dynamic> data) {
    return Country(
      name: data['en_short_name'],
      countryCode: data['alpha_2_code'],
      dialCode: data['dial_code'],
      flagUri: 'assets/flags/${data['alpha_2_code'].toLowerCase()}.png',
      nameTranslations: data['nameTranslations'],
    );
  }
}
