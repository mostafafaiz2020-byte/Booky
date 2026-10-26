import 'package:bloc/bloc.dart';
import 'package:bookia/features/home/data/model/books_model.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  getBestSellerBooks() async {
    emit(GetBestSellerLoading());
    final Response = await HomeRepo.getBestSellerBooks();
    if (Response is BooksModel) {
      emit(GetBestSellerSuccess(Response.data?.products));
    } else {
      emit(GetBestSellerError());
    }
  }
}
