import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/constants/filters_constants.dart';
import 'package:branch_links/core/data/filter/models/filter.dart';
import 'package:branch_links/core/extensions/cubit_extension.dart';
import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:branch_links/core/links/data/models/og_metadata.dart';
import 'package:branch_links/env.dart';
import 'package:branch_links/features/properties/data/models/property.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dining_cubit.freezed.dart';

part 'dining_state.dart';

class DiningCubit extends Cubit<DiningState> {
  final linksRepository = Env.sl<LinksRepository>();

  DiningCubit() : super(const DiningState.formData());

  void setMealTypeFilters(Set<Filter> filters) {
    safeEmit(state.copyWith(selectedMealTypeFilters: filters));
  }

  void setCuisineFilters(Set<Filter> filters) {
    safeEmit(state.copyWith(selectedCuisineFilters: filters));
  }

  void setPriceFilters(Set<Filter> filters) {
    safeEmit(state.copyWith(selectedPriceFilters: filters));
  }

  void setProperties(Set<Property> properties) {
    safeEmit(state.copyWith(selectedProperties: properties));
  }

  void setOptionsFilters(Set<Filter> properties) {
    safeEmit(state.copyWith(selectedOptionFilters: properties));
  }

  Future<void> createLink(
    Map<String, dynamic>? updateAnalyticsKeys,
    String? updatedAdobeDeepLinkParameter,
  ) async {
    safeEmit(
      state.copyWith(deepLinkURL: null, isLoading: true, errorMessage: null),
    );

    final tags = {
      ...state.selectedCuisineFilters,
      ...state.selectedMealTypeFilters,
      ...state.selectedPriceFilters,
      ...state.selectedOptionFilters,
    };

    final Map<String, String> queryParameters = {
      if (tags.isNotEmpty)
        FilterConstants.filter: tags.map((e) => e.key).join(','),
      if (state.selectedProperties.isNotEmpty)
        FilterConstants.propertyId:
            state.selectedProperties.map((e) => e.id).join(','),
    };

    final deepLinkPath =
        Uri(path: '/discover/dining', queryParameters: queryParameters)
            .toString();

    const metadata = OGMetadata(
      title: Constants.dining,
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
