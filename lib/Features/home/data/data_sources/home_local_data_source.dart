import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:hive_flutter/adapters.dart';

//cach data on device
abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    return box.values.toList();//iterable is collection
  }

  @override
  List<BookEntity> fetchNewestBooks() {
   var box = Hive.box<BookEntity>(kNewestdBox);
    return box.values.toList();//iterable is collection
  }
}
