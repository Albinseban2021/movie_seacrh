import 'package:http/http.dart' as http;
import 'package:movie_search/Models/movie_model.dart';
import 'dart:convert';


class MovieService {
  static Future<List<Movie>> fetchMovies(String query) async {
    final url = 'https://api.tvmaze.com/search/shows?q=$query';
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }
}
