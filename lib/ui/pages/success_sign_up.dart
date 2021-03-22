part of 'pages.dart';

class SuccessSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
        title: "Yeay! Completed",
        subtitle: "Now you are abble to order\nsome foods as a self reward",
        picturePath: "assets/success_sign_up.png",
        buttonTap1: () {},
        buttonTitle1: "Find Foods",
      ),
    );
  }
}
