part of 'static_links_cubit.dart';

@freezed
sealed class StaticLinksState with _$StaticLinksState {
  const factory StaticLinksState.loading() = StaticLinkLoading;

  const factory StaticLinksState.loaded(
    List<Link> filteredLinks,
  ) = StaticLinkDataLoaded;

  const factory StaticLinksState.error() = StaticLinkError;
}
