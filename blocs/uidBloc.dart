import 'package:flutter_bloc/flutter_bloc.dart';

class Uid extends Cubit<String>{
  Uid() : super('');

  setUid (uid) => emit(uid);
}