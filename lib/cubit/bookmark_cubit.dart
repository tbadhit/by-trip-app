// ignore_for_file: unnecessary_null_comparison

import 'package:bloc/bloc.dart';
import 'package:by_trip/models/models.dart';
import 'package:by_trip/services/services.dart';
import 'package:equatable/equatable.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  BookmarkCubit() : super(BookmarkInitial());

  Future<void> getBookmarks(User user) async {
    ApiReturnValue<List<Wisata>?> result =
        await BookmarkServices.readAllBookmarks(user);

    if (result != null) {
      emit(BookmarkLoaded(result.value!));
    } else {
      emit(BookmarkLoadingFailed(result.message!));
    }
  }

  Future<int?> addWisataToBookmark(Wisata bookmark) async {
    ApiReturnValue<Wisata> result =
        await BookmarkServices.addWisataToBookmark(bookmark);

    if (result.value != null) {
      var data = (state as BookmarkLoaded);
      emit(BookmarkLoaded(data.bookmarkItems + [result.value!]));
      return result.value!.id!;
    } else {
      emit(BookmarkLoadingFailed(result.message!));
      return null;
    }
  }

  Future<bool> removeCartItem(int id) async {
    ApiReturnValue<int> result = await BookmarkServices.removeBookmark(id);

    if (result.value != null) {
      emit(BookmarkLoaded((state as BookmarkLoaded).bookmarkItems));
      return true;
    } else {
      return false;
    }
  }
}
