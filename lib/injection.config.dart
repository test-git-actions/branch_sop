// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:branch_links/core/clients/api_client/api_client.dart' as _i660;
import 'package:branch_links/core/clients/api_client/api_client_impl.dart'
    as _i701;
import 'package:branch_links/core/clients/firestore_client/firestore_client.dart'
    as _i435;
import 'package:branch_links/core/clients/realtime_database_client/realtime_database_client.dart'
    as _i382;
import 'package:branch_links/core/data/product/repository/product_repository.dart'
    as _i158;
import 'package:branch_links/core/data/product/repository/product_repository_impl.dart'
    as _i284;
import 'package:branch_links/core/data/product/sources/product_remote_data_source.dart'
    as _i1030;
import 'package:branch_links/core/data/product/sources/product_remote_data_source_impl.dart'
    as _i441;
import 'package:branch_links/core/infrastructure/injectable_module.dart'
    as _i781;
import 'package:branch_links/core/links/data/repository/links_repository.dart'
    as _i711;
import 'package:branch_links/core/links/data/repository/links_repository_impl.dart'
    as _i231;
import 'package:branch_links/core/links/data/sources/links_creation_remote_data_source.dart'
    as _i947;
import 'package:branch_links/core/links/data/sources/links_creation_remote_data_source_impl.dart'
    as _i1050;
import 'package:branch_links/core/links/data/sources/links_listing_remote_data_source.dart'
    as _i63;
import 'package:branch_links/core/links/data/sources/links_listing_remote_data_source_impl.dart'
    as _i372;
import 'package:branch_links/features/auth/core/data/auth_data_source.dart'
    as _i500;
import 'package:branch_links/features/auth/core/data/auth_repository.dart'
    as _i502;
import 'package:branch_links/features/offers/data/data_sources/offers_remote_data_source.dart'
    as _i361;
import 'package:branch_links/features/offers/data/data_sources/offers_remote_data_source_impl.dart'
    as _i866;
import 'package:branch_links/features/offers/data/repositories/offers_repository.dart'
    as _i697;
import 'package:branch_links/features/offers/data/repositories/offers_repository_impl.dart'
    as _i358;
import 'package:branch_links/features/properties/data/data_sources/property_remote_data_source.dart'
    as _i400;
import 'package:branch_links/features/properties/data/data_sources/property_remote_data_source_impl.dart'
    as _i984;
import 'package:branch_links/features/properties/data/repositories/property_repository.dart'
    as _i556;
import 'package:branch_links/features/properties/data/repositories/property_repository_impl.dart'
    as _i848;
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_database/firebase_database.dart' as _i345;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logging/logging.dart' as _i831;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.factory<_i831.Logger>(() => injectableModule.logger);
    gh.factory<_i59.FirebaseAuth>(() => injectableModule.auth);
    gh.factory<_i974.FirebaseFirestore>(() => injectableModule.firestore);
    gh.factory<_i345.FirebaseDatabase>(() => injectableModule.database);
    gh.factory<_i361.Dio>(() => injectableModule.dio);
    gh.lazySingleton<_i500.AuthDataSource>(
        () => _i500.AuthDataSource(firebaseAuth: gh<_i59.FirebaseAuth>()));
    gh.lazySingleton<_i660.ApiClient>(
        () => _i701.ApiClientImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i435.FirestoreClient>(
        () => _i435.FirestoreClient(gh<_i974.FirebaseFirestore>()));
    gh.lazySingleton<_i947.LinksCreationRemoteDataSource>(
        () => _i1050.LinksCreationRemoteDataSourceImpl(gh<_i660.ApiClient>()));
    gh.lazySingleton<_i382.RealtimeDatabaseClient>(
        () => _i382.RealtimeDatabaseClient(gh<_i345.FirebaseDatabase>()));
    gh.lazySingleton<_i502.AuthRepository>(
        () => _i502.AuthRepository(gh<_i500.AuthDataSource>()));
    gh.lazySingleton<_i361.OffersRemoteDataSource>(
        () => _i866.OffersRemoteDataSourceImpl(gh<_i435.FirestoreClient>()));
    gh.lazySingleton<_i63.LinksListingRemoteDataSource>(() =>
        _i372.LinksListingRemoteDataSourceImpl(
            gh<_i382.RealtimeDatabaseClient>()));
    gh.lazySingleton<_i400.PropertyRemoteDataSource>(
        () => _i984.PropertyRemoteDataSourceImpl(gh<_i435.FirestoreClient>()));
    gh.lazySingleton<_i1030.ProductRemoteDataSource>(
        () => _i441.ProductRemoteDataSourceImpl(gh<_i435.FirestoreClient>()));
    gh.lazySingleton<_i158.ProductRepository>(() =>
        _i284.ProductRepositoryImpl(gh<_i1030.ProductRemoteDataSource>()));
    gh.lazySingleton<_i556.PropertyRepository>(() =>
        _i848.PropertiesRepositoryImpl(gh<_i400.PropertyRemoteDataSource>()));
    gh.lazySingleton<_i697.OffersRepository>(
        () => _i358.OffersRepositoryImpl(gh<_i361.OffersRemoteDataSource>()));
    gh.lazySingleton<_i711.LinksRepository>(() => _i231.LinksRepositoryImpl(
          detailsLinksRemoteDataSource: gh<_i63.LinksListingRemoteDataSource>(),
          linksCreationRemoteDataSource:
              gh<_i947.LinksCreationRemoteDataSource>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i781.InjectableModule {}
