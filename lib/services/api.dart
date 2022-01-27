import '../models/api_model.dart';
import 'package:http/http.dart' as http;

class API {
  static Future<List<DataModel>> getAPI(int index) async {
    print(index);
    final url =
        Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/apple');
    var response = await http.get(url);
    // print(response.statusCode);
    // print(response.body);

    if (response.statusCode != 200) {
      throw Exception('error has occurred');
    }

    return dataModelFromJson(response.body);
  }

  static Future<void> getListData() async {
    final url = Uri.parse(
        'https://raw.githubusercontent.com/meetDeveloper/freeDictionaryAPI/master/meta/wordList/english.txt');
    var response = await http.get(url);
    // print(response.statusCode);
    // print(response.body);

    if (response.statusCode != 200) {
      throw Exception('error has occurred');
    }
    List<String> sid = [response.body];
    print(sid);
  }
}
