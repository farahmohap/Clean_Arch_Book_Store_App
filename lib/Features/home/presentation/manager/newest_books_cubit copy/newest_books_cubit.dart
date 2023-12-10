import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books.dart';
import 'package:bookly/Features/home/presentation/manager/newest_books_cubit%20copy/newest_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
   var result=await fetchNewestBooksUseCase.call();
  
  result.fold((failure) => {emit(NewestBooksFailure(
    errMessage: failure.errMessage))},
     (books) => {
      emit(NewestBooksSuccess(books: books))
     });
  }
}
