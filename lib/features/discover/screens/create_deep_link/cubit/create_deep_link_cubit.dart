import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/data/product/repository/product_repository.dart';
import 'package:branch_links/core/extensions/cubit_extension.dart';
import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:branch_links/env.dart';
import 'package:branch_links/core/links/data/models/og_metadata.dart';
import 'package:branch_links/features/properties/data/repositories/property_repository.dart';
import 'package:branch_links/core/extensions/product_type_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_deep_link_state.dart';
part 'create_deep_link_cubit.freezed.dart';

class CreatePdpLinkCubit extends Cubit<CreateDeepLinkState> {
  final linksRepository = Env.sl<LinksRepository>();
  final propertyRepository = Env.sl<PropertyRepository>();
  final productRepository = Env.sl<ProductRepository>();

  CreatePdpLinkCubit({
    required this.productType,
    required this.link,
  }) : super(
          CreateDeepLinkState.formData(
            productType: productType,
            link: link,
          ),
        );

  final ProductType productType;
  final Link link;

  Future generateDeepLink(
    Map<String, dynamic>? updateAnalyticsKeys,
    String? updatedAdobeDeepLinkParameter,
  ) async {
    safeEmit(state.copyWith(isLoading: true));

    // Get Product
    final productEither = await productRepository.getProductById(
      state.link.id,
      state.productType,
    );

    final product = productEither.fold(
      (failure) => null,
      (product) => product,
    );

    if (product == null) {
      return safeEmit(
        state.copyWith(
          isLoading: false,
          apiErrorMessage: 'Failed to find ${state.productType} data',
        ),
      );
    }

    // Get Properties by showId
    final propertyEither = await propertyRepository.getPropertyById(
      product.propertyId!,
    );

    final property = propertyEither.fold(
      (failure) => null,
      (property) => property,
    );

    if (property == null) {
      return safeEmit(
        state.copyWith(
          isLoading: false,
          apiErrorMessage: 'Failed to find ${state.productType} property data',
        ),
      );
    }

    // Build OGMetadataModel Title
    final title = product.createTitle(
      propertyName: property.name,
    );

    // Build OGMetadataModel Description
    final description = product.shortDescription();

    // Get OGMetadataModel Image Overview path
    String? imageOverview;
    if (product.images['overview'] != null) {
      imageOverview = product.images['overview']['url'];
    }

    // Build DeepLinkPath
    final deepLinkPath = Uri(
      path: state.productType.productTypeToPathSegment,
      queryParameters: {
        'path': product.path,
      },
    ).toString();

    // Call API
    final linkEither = await linksRepository.createLink(
      deepLinkPath: deepLinkPath,
      feature: Constants.sop,
      metadata: OGMetadata(
        title: title,
        description: description,
        imageURL: imageOverview != null
            ? 'https://static.mgmresorts.com$imageOverview.image.240.240.high.jpg'
            : null,
        imageHeight: imageOverview != null ? 240 : null,
        imageWidth: imageOverview != null ? 240 : null,
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
