import 'package:branch_links/core/clients/firestore_client/firestore_failure.dart';
import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/data/product/sources/product_remote_data_source.dart';
import 'package:branch_links/core/data/product/models/product.dart';
import 'package:branch_links/core/data/product/repository/product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _productRemoteDataSource;

  ProductRepositoryImpl(this._productRemoteDataSource);

  @override
  Future<Either<FirestoreFailure, Product>> getProductById(
    String productId,
    ProductType productType,
  ) {
    return _productRemoteDataSource.getProductById(
      productId,
      productType,
    );
  }
}
