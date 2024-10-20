import 'package:booklyapp/feature/saved_books/presentation/view_model/saved_books_controller/saved_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedBooksCubit extends Cubit<SavedBooksState> {
  SavedBooksCubit() : super(SavedBooksInitialState());

}
