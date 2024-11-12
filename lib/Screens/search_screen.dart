import 'package:flutter/material.dart';
import 'package:movie_search/API/fetch_movie.dart';
import 'package:movie_search/Models/movie_model.dart';
import 'package:movie_search/widgets/movie_card.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Movie> movies = [];
  bool isLoading = false;

  void searchMovies(String query) async {
    setState(() => isLoading = true);
    try {
      movies = await MovieService.fetchMovies(query);
    } catch (e) {
      print(e);
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var crossAxisCount = screenSize.width > 1200
        ? 6
        : screenSize.width > 800
            ? 4
            : 2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Search for a movie",
            hintStyle: TextStyle(color: Colors.white54),
          ),
          onSubmitted: searchMovies,
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              itemCount: movies.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return MovieCard(movie: movies[index]);
              },
            ),
    );
  }
}
