import 'package:branch_links/env.dart';
import 'package:branch_links/features/auth/core/data/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final _authRepository = Env.sl<AuthRepository>();

  SignInCubit() : super(const SignInState.initial());

  void signIn(String password) async {
    emit(const SignInState.signingIn());
    final result = await _authRepository.signIn(password);
    emit(
      result.fold(
        SignInState.failure,
        (_) => const SignInState.signedIn(),
      ),
    );
  }
}
