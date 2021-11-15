part of 'models.dart';

class ApiReturnValue<T> {
  final T? value; // kalo valuenya ada pemanggilan API berhasil
  final String? message; // kalo valuenya ga ada nanti akan munculkan pesan message

  ApiReturnValue({this.value, this.message});
}