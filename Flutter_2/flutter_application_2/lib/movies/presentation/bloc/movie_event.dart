part of 'movie_bloc.dart';

sealed class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetPopularMovies extends MovieEvent {}

class GetTopRatedMovies extends MovieEvent {}

class GetLastPublishedMovies extends MovieEvent {}
