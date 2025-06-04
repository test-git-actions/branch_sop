import 'package:flutter_bloc/flutter_bloc.dart';

extension CubitX<T> on Cubit<T> {
  void safeEmit(T state) {
    if (!isClosed) {
      // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, prefer_safe_emit
      emit(state);
    }
  }
}
