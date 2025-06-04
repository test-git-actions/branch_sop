import 'package:branch_links/core/clients/firestore_client/collections.dart';
import 'package:branch_links/core/constants/constants.dart';

extension ProductTypeX on ProductType {
  String get productTypeToPathSegment {
    return switch (this) {
      ProductType.restaurant => '/discover/dining/restaurant',
      ProductType.show => '/discover/entertainment/show',
      ProductType.club => '/discover/nightlife/club',
    };
  }
}

extension ProductTypeToCollectionName on ProductType {
  String get productTypeToCollectionName {
    return switch (this) {
      ProductType.restaurant => Collections.restaurants,
      ProductType.show => Collections.shows,
      ProductType.club => Collections.clubs,
    };
  }
}
