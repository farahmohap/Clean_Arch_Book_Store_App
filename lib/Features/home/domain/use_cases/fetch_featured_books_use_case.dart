import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/faliure.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Faliure, List<BookEntity>>> call([int param=0]) async {
    // TODO: implement call
    return await homeRepo.fetchFeaturedBooks(pageNumber: param);
  }

  // Future<Either<Faliure, List<BookEntity>>> call() {
  //   //check permission
  //   return homeRepo.fetchFeaturedBooks();
  // }
}

// difference-> call,execute
