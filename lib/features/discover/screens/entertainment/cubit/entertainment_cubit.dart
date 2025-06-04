import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/constants/filters_constants.dart';
import 'package:branch_links/core/data/filter/models/filter.dart';
import 'package:branch_links/core/extensions/cubit_extension.dart';
import 'package:branch_links/core/extensions/date_time_extension.dart';
import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:branch_links/core/links/data/models/og_metadata.dart';
import 'package:branch_links/env.dart';
import 'package:branch_links/features/properties/data/models/property.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entertainment_cubit.freezed.dart';

part 'entertainment_state.dart';

class EntertainmentCubit extends Cubit<EntertainmentState> {
  final linksRepository = Env.sl<LinksRepository>();

  EntertainmentCubit() : super(const EntertainmentState.formData());

  void setStartDate(DateTime? date) {
    safeEmit(state.copyWith(startDate: date));
  }

  void setEndDate(DateTime? date) {
    safeEmit(state.copyWith(endDate: date));
  }

  void setCategoriesFilters(Set<Filter> filters) {
    safeEmit(state.copyWith(selectedCategoriesFilters: filters));
  }

  void setProperties(Set<Property> properties) {
    safeEmit(state.copyWith(selectedProperties: properties));
  }

  Future<void> createLink({
    List<Property> properties = const [],
    Map<String, dynamic>? updateAnalyticsKeys,
    String? updatedAdobeDeepLinkParameter,
  }) async {
    safeEmit(
      state.copyWith(deepLinkURL: null, isLoading: true, errorMessage: null),
    );

    final Map<String, String> queryParameters = {
      if (state.selectedCategoriesFilters.isNotEmpty)
        FilterConstants.filter:
            state.selectedCategoriesFilters.map((e) => e.key).join(','),
      if (state.selectedProperties.isNotEmpty)
        FilterConstants.propertyId:
            state.selectedProperties.map((e) => e.id).join(','),
      if (state.startDate != null)
        FilterConstants.startDate: state.startDate!.deepLinkDateFormat,
      if (state.endDate != null)
        FilterConstants.endDate: state.endDate!.deepLinkDateFormat,
    };

    final deepLinkPath = Uri(
      path: '/discover/entertainment',
      queryParameters: queryParameters,
    ).toString();

    const metadata = OGMetadata(
      title: Constants.entertainment,
    );

    final linkEither = await linksRepository.createLink(
      deepLinkPath: deepLinkPath,
      feature: Constants.sop,
      metadata: metadata,
      adobeParameter: updatedAdobeDeepLinkParameter,
      analyticsKeys: updateAnalyticsKeys,
    );

    linkEither.fold(
      (failure) => safeEmit(
        state.copyWith(isLoading: false, errorMessage: failure.errorMessage),
      ),
      (deepLinkURL) => safeEmit(
        state.copyWith(
          deepLinkURL: deepLinkURL,
          isLoading: false,
          metadata: metadata,
        ),
      ),
    );
  }
}
