enum DatabasePath {
  discover('discover'),
  clubs('clubs'),
  restaurants('restaurants'),
  shows('shows'),
  rewards('rewards'),
  trips('trips'),
  me('me'),
  other('other'),
  home('home');

  const DatabasePath(this.path);

  final String path;
}
