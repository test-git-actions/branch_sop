enum ContentType {
  roomSegment,
  restaurant,
  show,
  clubBar,
  custom;

  static ContentType fromString(String value) {
    try {
      return ContentType.values.firstWhere(
        (element) => element.name == value,
      );
    } catch (e) {
      return ContentType.custom;
    }
  }
}
