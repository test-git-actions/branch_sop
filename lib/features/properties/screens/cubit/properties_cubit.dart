import 'package:branch_links/core/extensions/cubit_extension.dart';
import 'package:branch_links/env.dart';
import 'package:branch_links/features/properties/data/models/property.dart';
import 'package:branch_links/features/properties/data/repositories/property_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'properties_cubit.freezed.dart';
part 'properties_state.dart';

class PropertiesCubit extends Cubit<PropertiesState> {
  final PropertyRepository propertiesRepository = Env.sl<PropertyRepository>();

  PropertiesCubit() : super(const PropertiesState.loading());

  Future<void> getProperties() async {
    safeEmit(const PropertiesState.loading());
    final propertiesEither = await propertiesRepository.getProperties();

    propertiesEither.fold(
      (_) => safeEmit(const PropertiesState.error()),
      (properties) {
        safeEmit(PropertiesState.loaded(properties));
      },
    );
  }
}
