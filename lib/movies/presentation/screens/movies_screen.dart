import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_clean_architecture/core/services/services_locator.dart';
import 'package:movies_clean_architecture/movies/presentation/blocs/main_screen_bloc/movies_bloc.dart';
import 'package:movies_clean_architecture/movies/presentation/components/main_screen/now_playing_movies.dart';
import 'package:movies_clean_architecture/movies/presentation/components/main_screen/popular_movies.dart';
import 'package:movies_clean_architecture/movies/presentation/components/main_screen/search_movie.dart';
import 'package:movies_clean_architecture/movies/presentation/components/main_screen/top_rated_movies.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: MovieSearchDelegate());
                },
                icon: const Icon(Icons.search),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingMoviesComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO POPULAR SCREEN
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text('See More'),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularMoviesComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Rated",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO Top Rated Movies Screen
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text('See More'),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRatedMoviesComponent(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                // change the searchBar Text
                query = '';
              }
            },
            icon: const Icon(Icons.clear)),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      // would close the searchBar
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back));

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> movieSuggestions = [
      'Iron Man',
      'Avengers',
      'John Wick',
    ];
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(movieSuggestions[index]),
        onTap: () => query = movieSuggestions[index],
      ),
      itemCount: movieSuggestions.length,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
      //! The movie db Api request usese %20 between words
      create: (context) => sl<MoviesBloc>()
        ..add(SearchForMovieEvent(query.replaceAll(' ', '%20'))),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is SearchForMovieState) {
            return ListView.builder(
              itemBuilder: (context, index) => SearchForMovieComponent(
                movie: state.searchMovieResults![index],
              ),
              itemCount: state.searchMovieResults!.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
