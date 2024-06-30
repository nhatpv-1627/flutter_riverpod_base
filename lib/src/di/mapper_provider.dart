import 'package:flutter_base/src/data/mapper/movie_mapper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final movieMapper = Provider<MovieMapper>((ref) => MovieMapper());
