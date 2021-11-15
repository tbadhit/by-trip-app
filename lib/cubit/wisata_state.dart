part of 'wisata_cubit.dart';

abstract class WisataState extends Equatable {
  const WisataState();

  @override
  List<Object> get props => [];
}

class WisataInitial extends WisataState {}

class WisataLoaded extends WisataState {
  final List<Wisata> item;

  const WisataLoaded(this.item);

  @override
  List<Object> get props => [item];
}

class WisataLoadingFailed extends WisataState {
  final String message;

  const WisataLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
