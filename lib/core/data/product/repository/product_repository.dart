import 'package:branch_links/core/clients/firestore_client/firestore_failure.dart';
import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/data/product/models/product.dart';
import 'package:dartz/dartz.dart';

/// A repository for accessing Product data
abstract class ProductRepository {
  /// Retrieves a Product by its ID
  Future<Either<FirestoreFailure, Product>> getProductById(
    String productId,
    ProductType productType,
  );
}
