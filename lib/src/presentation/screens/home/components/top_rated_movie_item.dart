import 'package:flutter/material.dart';
import 'package:flutter_base/src/domain/models/movie_model.dart';
import 'package:flutter_base/src/presentation/widgets/my_network_image.dart';

class TopRatedMovieItem extends StatelessWidget {
  const TopRatedMovieItem({required this.movie, super.key, this.onItemTap});
  final MovieModel movie;
  final ValueSetter<int>? onItemTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onItemTap?.call(movie.id),
      child: Container(
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: MyNetworkImage(
                url: movie.posterPath ?? '',
                width: 140,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                movie.title ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
