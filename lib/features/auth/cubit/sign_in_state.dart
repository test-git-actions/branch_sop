part of 'sign_in_cubit.dart';

sealed class SignInState extends Equatable {
  const SignInState();
  const factory SignInState.initial() = SignInStateInitial;
  const factory SignInState.signingIn() = SignInStateSigningIn;
  const factory SignInState.signedIn() = SignInStateSignedIn;
  const factory SignInState.failure(String failure) = SignInFailure;

  @override
  List<Object?> get props => [];
}

class SignInStateInitial extends SignInState {
  const SignInStateInitial();
}

class SignInStateSigningIn extends SignInState {
  const SignInStateSigningIn();
}

class SignInStateSignedIn extends SignInState {
  const SignInStateSignedIn();
}

class SignInFailure extends SignInState {
  const SignInFailure(this.failure);

  final String failure;

  @override
  List<Object?> get props => [failure];
}
