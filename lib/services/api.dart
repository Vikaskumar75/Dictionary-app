import 'package:flash_cards/models/api_model.dart';
import 'package:http/http.dart' as http;

class API {
  int count = 0;

  Future<List<DataModel>> getAPI() async {
    List words = ["apple", "banana"];

    final url = Uri.parse(
        'https://api.dictionaryapi.dev/api/v2/entries/en/${words[count]}');
    var response = await http.get(url);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode != 200) {
      throw Exception('error has occurred');
    }

    return dataModelFromJson(response.body);
  }

  void counter() {
    count++;
  }
}
