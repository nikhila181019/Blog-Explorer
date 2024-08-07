import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_explorer/services/api_service.dart';
import 'blog_event.dart';
import 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final ApiService apiService;

  BlogBloc(this.apiService) : super(BlogInitial()) {
    on<FetchBlogs>((event, emit) async {
      emit(BlogLoading());
      try {
        final blogs = await apiService.fetchBlogs();
        emit(BlogLoaded(blogs));
      } catch (e) {
        emit(BlogError(e.toString()));
      }
    });
  }
}
