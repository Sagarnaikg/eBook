class AppMedia {
  static final String _image_1 = "assets/image_set1/";
  static final String _image_2 = "assets/image_set2/";
  static final String _image_3 = "assets/image_set3/";
  static final String _icons = "assets/icons/";

  static String getImageSet1(String image) {
    return _image_1 + image;
  }

  static String getIcon(String image) {
    return _icons + image;
  }

  static String getImageSet2(String image) {
    return _image_2 + image;
  }

  static String getImageSet3(String image) {
    return _image_3 + image;
  }
}
