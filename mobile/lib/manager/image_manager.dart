class ImageManager {
  static ImageManager _singleton;

  ImageManager._internal();

  factory ImageManager() {
    if (_singleton == null) {
      _singleton = ImageManager._internal();
    }
    return _singleton;
  }
}
