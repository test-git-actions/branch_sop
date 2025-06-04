import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/extensions/cubit_extension.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:branch_links/core/links/data/models/og_metadata.dart';
import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:branch_links/env.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_page_deep_link_state.dart';
part 'create_page_deep_link_cubit.freezed.dart';

class CreatePageDeepLinkCubit extends Cubit<CreatePageDeepLinkState> {
  final linksRepository = Env.sl<LinksRepository>();

  CreatePageDeepLinkCubit({required Link link})
      : super(CreatePageDeepLinkState.formData(link: link));

  void updateLinkName(String updatedLinkName) {
    safeEmit(
      state.copyWith(
        link: state.link.copyWith(
          name: updatedLinkName,
        ),
      ),
    );
  }

  Future generateNormalLink(
    Map<String, dynamic>? updateAnalyticsKeys,
    String? updatedAdobeDeepLinkParameter,
  ) async {
    safeEmit(state.copyWith(isLoading: true));

    // Build DeepLinkPath
    final deepLinkPath = Uri(
      path: '/${state.link.path}',
    ).toString();

    final linkEither = await linksRepository.createLink(
      deepLinkPath: deepLinkPath,
      feature: Constants.sop,
      metadata: OGMetadata(
        title: state.link.name,
      ),
      adobeParameter: updatedAdobeDeepLinkParameter,
      analyticsKeys: updateAnalyticsKeys,
    );

    linkEither.fold(
      (failures) => safeEmit(
        state.copyWith(
          isLoading: false,
          apiErrorMessage: failures.errorMessage,
        ),
      ),
      (deepLinkUrl) => safeEmit(
        state.copyWith(
          isLoading: false,
          generatedLink: deepLinkUrl,
        ),
      ),
    );
  }
}
