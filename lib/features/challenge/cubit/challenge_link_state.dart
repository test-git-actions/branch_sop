part of 'challenge_link_cubit.dart';

@freezed
class ChallengeLinkState with _$ChallengeLinkState {
  const factory ChallengeLinkState({
    @Default(ChallengeLink()) ChallengeLink deepLink,
    @Default(false) bool isLoading,
    String? generatedDeepLink,
    String? apiErrorMessage,
  }) = _FormLoaded;
}
