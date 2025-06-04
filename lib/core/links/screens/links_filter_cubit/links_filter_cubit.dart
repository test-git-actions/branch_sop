import 'package:branch_links/core/extensions/cubit_extension.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'links_filter_cubit.freezed.dart';
part 'links_filter_state.dart';

class LinksFilterCubit extends Cubit<LinksFilterState> {
  final List<Link> _originalLinks;

  LinksFilterCubit(List<Link> links)
      : _originalLinks = List.from(links),
        super(LinksFilterState(links));

  void filter(String searchText) {
    safeEmit(
      LinksFilterState(
        _originalLinks
            .where(
              (element) =>
                  element.name.toLowerCase().contains(searchText.toLowerCase()),
            )
            .toList(),
      ),
    );
  }

  void clearFilters() {
    safeEmit(LinksFilterState(_originalLinks));
  }
}
