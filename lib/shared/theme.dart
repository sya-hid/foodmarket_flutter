part of 'shared.dart';

const double defaultMargin = 24;

Color greyColor = "8D92A3".toColor();
Color yellowColor = "FFC700".toColor();

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: yellowColor,
);
TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);
TextStyle blackFontStyle22 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle16 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackFontStyle14 =
    GoogleFonts.poppins().copyWith(color: Colors.black);
