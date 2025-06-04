import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_link.freezed.dart';

@freezed
class ChallengeLink with _$ChallengeLink {
  const ChallengeLink._();

  const factory ChallengeLink({
    String? challengeId,
    String? memberId,
  }) = _ChallengeLink;

  String toUri() {
    return Uri(
      path: '/rewards/challenge-details',
      queryParameters: {
        if (challengeId?.isNotEmpty == true && memberId?.isNotEmpty == true)
          'id': '$challengeId-$memberId',
      },
    ).toString();
  }
}
