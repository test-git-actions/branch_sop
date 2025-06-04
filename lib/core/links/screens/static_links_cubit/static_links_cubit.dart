import 'package:branch_links/core/clients/realtime_database_client/database_path.dart';
import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:branch_links/env.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'static_links_cubit.freezed.dart';
part 'static_links_state.dart';

class StaticLinksCubit extends Cubit<StaticLinksState> {
  final LinksRepository repository = Env.sl<LinksRepository>();
  final DatabasePath databasePath;

  StaticLinksCubit({required this.databasePath})
      : super(const StaticLinksState.loading());

  Future<void> getLinks() async {
    final linksEither = await repository.getLinks(databasePath: databasePath);

    emit(
      linksEither.fold(
        (_) => const StaticLinksState.error(),
        StaticLinksState.loaded,
      ),
    );
  }
}
