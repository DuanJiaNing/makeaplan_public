import 'country_list.dart';
import 'country_model.dart';

const String PropertyName = 'alpha_2_code';

class CountryProvider {
  static List<Country> getCountriesData() {
    List jsonList = Countries.countryList;
    return jsonList.map((country) => Country.fromJson(country)).toList();
  }
}
