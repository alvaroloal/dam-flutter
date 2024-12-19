import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<GetPopularMovies>((event, emit) {
      // TODO: implement event handler
    });
    on<GetTopRatedMovies>((event, emit) {
      // TODO: implement event handler
    });
    on<GetLastPublishedMovies>((event, emit) {
      // TODO: implement event handler
    });
  }
}
