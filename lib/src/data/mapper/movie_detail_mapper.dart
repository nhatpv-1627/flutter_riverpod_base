import 'package:flutter_base/config/environment.dart';
import 'package:flutter_base/src/data/mapper/data_mapper.dart';
import 'package:flutter_base/src/data/model/movie_detail.dart';
import 'package:flutter_base/src/domain/models/movie_detail_model.dart';

class MovieDetailMapper extends DataMapper<MovieDetail, MovieDetailModel> {
  MovieDetailMapper({
    required this.collectionMapper,
    required this.genreMapper,
  });
  final CollectionMapper collectionMapper;
  final GenreMapper genreMapper;

  @override
  MovieDetailModel map(MovieDetail? data) {
    return MovieDetailModel(
      adult: data?.adult,
      backdropPath: '${Environment.baseAssetLink}${data?.backdropPath}',
      belongsToCollection: collectionMapper.map(data?.belongsToCollection),
      budget: data?.budget,
      genres: genreMapper.mapNullableList(data?.genres),
      homepage: data?.homepage,
      id: data?.id ?? -1,
      imdbId: data?.imdbId,
      originCountry: data?.originCountry,
      originalLanguage: data?.originalLanguage,
      originalTitle: data?.originalTitle,
      overview: data?.overview,
      popularity: data?.popularity,
      posterPath: '${Environment.baseAssetLink}${data?.posterPath}',
      releaseDate: data?.releaseDate,
      revenue: data?.revenue,
      runtime: data?.runtime,
      status: data?.status,
      tagline: data?.tagline,
      title: data?.title,
      video: data?.video,
      voteAverage: data?.voteAverage,
      voteCount: data?.voteCount,
    );
  }
}

class GenreMapper extends DataMapper<Genre, GenreModel> {
  @override
  GenreModel map(Genre? data) {
    return GenreModel(
      id: data?.id ?? -1,
      name: data?.name,
    );
  }
}

class CollectionMapper extends DataMapper<Collection, CollectionModel> {
  @override
  CollectionModel map(Collection? data) {
    return CollectionModel(
      id: data?.id ?? -1,
      name: data?.name,
      posterPath: '${Environment.baseAssetLink}${data?.posterPath}',
      backdropPath: '${Environment.baseAssetLink}${data?.backdropPath}',
    );
  }
}
