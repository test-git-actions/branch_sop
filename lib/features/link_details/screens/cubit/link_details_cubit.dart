import 'package:branch_links/core/extensions/cubit_extension.dart';
import 'package:branch_links/core/links/data/models/link_details.dart';
import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:branch_links/env.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'link_details_cubit.freezed.dart';
part 'link_details_state.dart';

class LinkDetailsCubit extends Cubit<LinkDetailsState> {
  final linksRepository = Env.sl<LinksRepository>();

  LinkDetailsCubit() : super(const LinkDetailsState.initial());

  Future<void> getGeneratedLinkDetails(String link) async {
    safeEmit(const LinkDetailsState.loading());

    final linkDetailsEither =
        await linksRepository.getGeneratedLinkDetails(link);

    linkDetailsEither.fold(
      (_) => safeEmit(const LinkDetailsState.error()),
      (details) => safeEmit(LinkDetailsState.loaded(link, details)),
    );
  }
}
