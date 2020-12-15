const int font_size_small = 1;
const int font_size_std = 2;
const int font_size_middle = 3;
const int font_size_large = 4;

class MAPFontSize {
  final small;
  final normal;
  final middle;
  final large;
  final larger;
  final largest;

  MAPFontSize(
      {this.small,
      this.normal,
      this.middle,
      this.large,
      this.larger,
      this.largest});
}

MAPFontSize getFontSize(int fontSize) {
  if (fontSize == font_size_small) {
    return _buildSmallFontSize();
  }
  if (fontSize == font_size_std) {
    return _buildStdFontSize();
  }
  if (fontSize == font_size_middle) {
    return _buildMiddleFontSize();
  }
  if (fontSize == font_size_large) {
    return _buildLargeFontSize();
  }

  return _buildStdFontSize();
}

_buildStdFontSize() {
  return MAPFontSize(
    small: 10.0,
    normal: 12.0,
    middle: 14.0,
    large: 16.0,
    larger: 20.0,
    largest: 24.0,
  );
}

_buildMiddleFontSize() {
  return MAPFontSize(
    small: 12.0,
    normal: 14.0,
    middle: 16.0,
    large: 18.0,
    larger: 22.0,
    largest: 26.0,
  );
}

_buildLargeFontSize() {
  return MAPFontSize(
    small: 13.0,
    normal: 15.0,
    middle: 17.0,
    large: 19.0,
    larger: 23.0,
    largest: 27.0,
  );
}

_buildSmallFontSize() {
  return MAPFontSize(
    small: 8.0,
    normal: 10.0,
    middle: 12.0,
    large: 14.0,
    larger: 18.0,
    largest: 22.0,
  );
}
