import 'package:flutter/material.dart';
import 'package:movie_search/Models/movie_model.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  const DetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(movie.imageUrl),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  movie.title,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              if (movie.type.isNotEmpty)
                Text(
                  "Type: ${movie.type}",
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
              if (movie.languages.isNotEmpty)
                Text(
                  "Language: ${movie.languages}",
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
              if (movie.genres.isNotEmpty)
                Text(
                  "Genres: ${movie.genres.join(", ")}",
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
              if (movie.rating != null)
                Text(
                  "Rating: ${movie.rating}",
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
              const SizedBox(height: 16),
              const Text(
                "Summary:",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              // Html(
              //   data: movie.summary,
              //   style: {
              //     "body": Style(color: Colors.white70, fontSize: FontSize(16)),
              //   },
              // ),
              if (movie.previousEpisode != null) ...[
                const SizedBox(height: 16),
                const Text(
                  "Previous Episode:",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  movie.previousEpisode!,
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
