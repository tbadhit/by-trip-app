part of 'bookmark_cubit.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => [];
}

class BookmarkInitial extends BookmarkState {}

class BookmarkLoaded extends BookmarkState {
  final List<Wisata> bookmarkItems;

  const BookmarkLoaded(this.bookmarkItems);

  @override
  List<Object> get props => [bookmarkItems];
}

class BookmarkLoadingFailed extends BookmarkState {
  final String message;

  const BookmarkLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
