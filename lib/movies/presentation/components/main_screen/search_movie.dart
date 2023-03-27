import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_clean_architecture/core/network/api_constants.dart';
import 'package:movies_clean_architecture/movies/domain/entities/movie.dart';
import 'package:movies_clean_architecture/movies/presentation/screens/movie_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

class SearchForMovieComponent extends StatelessWidget {
  const SearchForMovieComponent({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    //! Sometimes the server return no backdrop
    if (movie.backdropPath == '') {
      return const SizedBox.shrink();
    } else {
      return GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailScreen(movieId: movie.id),
            )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xff2b2a2b),
            ),
            height: 150,
            child: Card(
              clipBehavior: Clip.hardEdge,
              child: Row(
                children: [
                  // Poster
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    child: CachedNetworkImage(
                      height: 150,
                      width: 120,
                      fit: BoxFit.fill,
                      imageUrl: ApiConstants.imageUrl(movie.backdropPath),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[850]!,
                        highlightColor: Colors.grey[800]!,
                        child: Container(
                          height: 170.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  // Body
                  Expanded(
                    child: Column(
                      children: [
                        // title
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, bottom: 8, left: 16),
                          child: Text(
                            movie.title,
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.visible,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 16),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2.0,
                                  horizontal: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade700,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Text(
                                  movie.releaseDate.split('-')[0],
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20.0,
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  (movie.voteAverage / 2).toStringAsFixed(1),
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  '(${movie.voteAverage})',
                                  style: const TextStyle(
                                    fontSize: 1.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //description
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 8),
                          child: Text(
                            movie.overview,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
