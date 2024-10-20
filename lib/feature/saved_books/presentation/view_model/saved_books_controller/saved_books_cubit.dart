import 'package:booklyapp/core/utils/app_box.dart';
import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:booklyapp/feature/saved_books/presentation/view_model/saved_books_controller/saved_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class SavedBooksCubit extends Cubit<SavedBooksState> {
  SavedBooksCubit() : super(SavedBooksInitialState());
  List<BookModel> savedBooksList=[];
   var box= Hive.box<BookModel>(BoxApp.savedBookBox);

  changeSavedBookIcon({required BookModel bookModel}) {
    if (!savedBooksList.any((savedBook) => savedBook.id == bookModel.id)) {
      addSavedBook(bookModel: bookModel);
    } else {
      removeSavedBook(bookModel: bookModel);
    }
  }


  addSavedBook({required BookModel bookModel})async{
    bookModel.saveBook=!bookModel.saveBook;
    savedBooksList.add(bookModel);
     box.put("${bookModel.id}", bookModel);
    emit(SavedBooksAddState());
  }

  removeSavedBook({required BookModel bookModel}){
    bookModel.saveBook=!bookModel.saveBook;
    savedBooksList.remove(bookModel);
    box.delete("${bookModel.id}");
    emit(SavedBooksRemoveState());
  }

   fetchSavedBooks(){
    savedBooksList = box.values.toList();
  }
}