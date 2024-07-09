import 'package:flutter_base/src/data/mapper/movie_mapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mapper_provider.g.dart';

@Riverpod(keepAlive: true)
MovieMapper movieMapper(MovieMapperRef ref) => MovieMapper();
