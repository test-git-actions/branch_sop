import 'package:branch_links/core/extensions/cubit_extension.dart';
import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:branch_links/core/links/data/models/og_metadata.dart';
import 'package:branch_links/env.dart';
import 'package:branch_links/features/checkin/models/create_checkin_link.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_checkin_link_cubit.freezed.dart';

part 'create_checkin_link_state.dart';

class CreateCheckinLinkCubit extends Cubit<CreateCheckinLinkState> {
  final linksRepository = Env.sl<LinksRepository>();

  CreateCheckinLinkCubit() : super(const CreateCheckinLinkState());

  void updateLastName(String lastName) {
    final updatedDeepLink = state.deepLink.copyWith(lastName: lastName);

    safeEmit(state.copyWith(deepLink: updatedDeepLink));
  }

  void updateReservationNumber(String reservationNumber) {
    final updatedDeepLink = state.deepLink.copyWith(
      reservationConfirmationNumber: reservationNumber,
    );

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
      deepLinkPath: deepLinkPath,
      metadata: const OGMetadata(
        title: 'My reservation in the MGM Rewards app',
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
