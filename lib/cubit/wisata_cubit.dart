import 'package:by_trip/models/models.dart';
import 'package:by_trip/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wisata_state.dart';

class WisataCubit extends Cubit<WisataState> {
  WisataCubit() : super(WisataInitial());

  Future<void> getWisata(User user) async {
    ApiReturnValue<List<Wisata>> result = await WisataServices.getWisata(user);

    if (result.value != null) {
      emit(WisataLoaded(result.value!));
    } else {
      emit(WisataLoadingFailed(result.message!));
    }
  }
}
