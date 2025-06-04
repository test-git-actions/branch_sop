part of 'link_details_cubit.dart';

@freezed
sealed class LinkDetailsState with _$LinkDetailsState {
  const factory LinkDetailsState.initial() = LinkDetailsInitial;

  const factory LinkDetailsState.loading() = LinkDetailsLoading;

  const factory LinkDetailsState.loaded(String link, LinkDetails linkDetails) =
      LinkDetailsLoaded;

  const factory LinkDetailsState.error() = LinkDetailsError;
}
