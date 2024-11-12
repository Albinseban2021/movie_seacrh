import 'package:html/parser.dart'; // Add this package to parse HTML.

class Movie {
  final String title;
  final String summary;
  final String imageUrl;
  final String type;
  final List<String> languages;
  final List<String> genres;
  final double rating;
  final String previousEpisode;

  Movie({
    required this.title,
    required this.summary,
    required this.imageUrl,
    required this.type,
    required this.languages,
    required this.genres,
    required this.rating,
    required this.previousEpisode,
  });

  // Helper method to parse the summary and remove HTML tags
  static String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    return document.body?.text ?? '';
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['show']['name'] ?? 'No title available',
      summary: parseHtmlString(json['show']['summary'] ?? 'No summary available'),
      imageUrl: json['show']['image']?['medium'] ?? '',
      type: json['show']['type'] ?? 'Unknown',
      languages: (json['show']['language'] != null) ? [json['show']['language']] : [],
      genres: List<String>.from(json['show']['genres'] ?? []),
      rating: (json['show']['rating']?['average'] ?? 0).toDouble(),
      previousEpisode: json['show']['_links']?['previousepisode']?['href'] ?? 'No previous episode available',
    );
  }
}
