import '../utilities/http_exception.dart';
import 'package:http/http.dart' as http;

class SearchTracksService {
  Future<http.Response> fetchTracks(String artistName) async {
    var url = Uri.parse('https://itunes.apple.com/search?term=jack+johnson&limit=25');
    try {
      final response = await http.get(url);

      HttpException.validateResponse(response);

      return response;
    } catch (error) {
      throw error;
    }
  }
}
