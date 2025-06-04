enum AuthenticationState {
  anonymous,
  idVerified,
  rewards;

  String get title {
    return switch (this) {
      AuthenticationState.anonymous => 'Anonymous',
      AuthenticationState.idVerified => 'ID Verified',
      AuthenticationState.rewards => 'Logged In',
    };
  }
}
