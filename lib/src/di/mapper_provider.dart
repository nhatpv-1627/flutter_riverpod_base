import 'package:flutter_base/src/data/mapper/movie_detail_mapper.dart';
import 'package:flutter_base/src/data/mapper/movie_mapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mapper_provider.g.dart';

@Riverpod(keepAlive: true)
MovieMapper movieMapper(MovieMapperRef ref) => MovieMapper();

@Riverpod(keepAlive: true)
GenreMapper genreMapper(GenreMapperRef ref) => GenreMapper();

@Riverpod(keepAlive: true)
CollectionMapper collectionMapper(CollectionMapperRef ref) =>
    CollectionMapper();

@Riverpod(keepAlive: true)
MovieDetailMapper movieDetailMapper(MovieDetailMapperRef ref) =>
    MovieDetailMapper(
      collectionMapper: ref.watch(collectionMapperProvider),
      genreMapper: ref.watch(genreMapperProvider),
    );
