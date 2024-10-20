import 'package:booklyapp/feature/home/data/model/book_model.dart';
import 'package:booklyapp/feature/saved_books/presentation/view_model/saved_books_controller/saved_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedBooksCubit extends Cubit<SavedBooksState> {
  SavedBooksCubit() : super(SavedBooksInitialState());
  List<BookModel> savedBooksList=[];

  changeSavedBookIcon({required BookModel bookModel}){
    if (!savedBooksList.contains(bookModel)){
      addSavedBook(bookModel: bookModel);
    } else {
      removeSavedBook(bookModel: bookModel);
    }
  }

  addSavedBook({required BookModel bookModel}){
    bookModel.saveBook=!bookModel.saveBook;
    savedBooksList.add(bookModel);
    emit(SavedBooksAddState());
  }

  removeSavedBook({required BookModel bookModel}){
    bookModel.saveBook=!bookModel.saveBook;
    savedBooksList.remove(bookModel);
    emit(SavedBooksRemoveState());
  }
}