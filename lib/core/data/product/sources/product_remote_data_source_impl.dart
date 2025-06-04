import 'package:branch_links/core/clients/firestore_client/firestore_client.dart';
import 'package:branch_links/core/clients/firestore_client/firestore_failure.dart';
import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/data/product/sources/product_remote_data_source.dart';
import 'package:branch_links/core/data/product/models/product.dart';
import 'package:branch_links/core/extensions/product_type_extensions.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final FirestoreClient _firestoreClient;

  ProductRemoteDataSourceImpl(this._firestoreClient);

  @override
  Future<Either<FirestoreFailure, Product>> getProductById(
    String productId,
    ProductType productType,
  ) async {
    final collectionName = productType.productTypeToCollectionName;
    final collection = _firestoreClient.parsedCollectionRef(
      collectionName,
      Product.fromJson,
    );

    final productEither = await _firestoreClient.getDocumentById(
      collectionRef: collection,
      id: productId,
    );

    return productEither.fold(
      (failure) => left(failure),
      (product) {
        // Return the product with the updated product type
        return right(
          product.copyWith(
            productType: productType,
          ),
        );
      },
    );
  }
}
