import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/extensions/cubit_extension.dart';
import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:branch_links/core/links/data/models/og_metadata.dart';
import 'package:branch_links/env.dart';
import 'package:branch_links/features/challenge/model/challenge_link.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_link_cubit.freezed.dart';

part 'challenge_link_state.dart';

class ChallengeLinkCubit extends Cubit<ChallengeLinkState> {
  final linksRepository = Env.sl<LinksRepository>();

  ChallengeLinkCubit() : super(const ChallengeLinkState());

  void updateChallengeId(String challengeId) {
    final updatedDeepLink = state.deepLink.copyWith(challengeId: challengeId);

    safeEmit(state.copyWith(deepLink: updatedDeepLink));
  }

  void updateMemberId(String memberId) {
    final updatedDeepLink = state.deepLink.copyWith(memberId: memberId);

    safeEmit(state.copyWith(deepLink: updatedDeepLink));
  }

  void generateDeepLink(
    Map<String, dynamic>? updateAnalyticsKeys,
    String? updatedAdobeDeepLinkParameter,
  ) async {
    safeEmit(
      state.copyWith(
        isLoading: true,
        apiErrorMessage: null,
        generatedDeepLink: null,
      ),
    );

    final deepLinkPath = state.deepLink.toUri();

    final linkEither = await linksRepository.createLink(
      feature: Constants.sop,
      deepLinkPath: deepLinkPath,
      metadata: const OGMetadata(
        title: 'Unlock this challenge and start earning more!',
      ),
      adobeParameter: updatedAdobeDeepLinkParameter,
      analyticsKeys: updateAnalyticsKeys,
    );

    linkEither.fold(
      (failure) => safeEmit(
        state.copyWith(
          isLoading: false,
          apiErrorMessage: failure.errorMessage,
        ),
      ),
      (deepLinkUrl) => safeEmit(
        state.copyWith(
          generatedDeepLink: deepLinkUrl,
          isLoading: false,
        ),
      ),
    );
  }
}
