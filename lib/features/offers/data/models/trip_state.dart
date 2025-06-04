enum TripState {
  inTrip,
  preTripOver72Hours,
  preTripUnder72Hours;

  String get title {
    return switch (this) {
      TripState.inTrip => 'In-Trip',
      TripState.preTripOver72Hours => 'pre-Trip Over72Hours',
      TripState.preTripUnder72Hours => 'Pre-Trip Under72Hours',
    };
  }
}

enum DataStateKey {
  inTrip,
  preTripOver72Hours,
  preTripUnder72Hours,
  anonymous,
  idVerified,
  rewards;

  String get title {
    return switch (this) {
      DataStateKey.inTrip => 'In-Trip',
      DataStateKey.preTripOver72Hours => 'pre-Trip Over72Hours',
      DataStateKey.preTripUnder72Hours => 'Pre-Trip Under72Hours',
      DataStateKey.anonymous => 'Anonymous',
      DataStateKey.idVerified => 'ID Verified',
      DataStateKey.rewards => 'Logged In',
    };
  }
}
