import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';


//cache data
void saveBoxData(List<BookEntity> books,String boxName) {
     var box = Hive.box<BookEntity>(boxName);
    box.addAll(books);
  }