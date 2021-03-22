part of 'pages.dart';

class PaymentMethodPage extends StatelessWidget {
  final String paymentURL;

  PaymentMethodPage(this.paymentURL);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
        title: "Finish Your Payment",
        subtitle: "Please choose your favourit\npayment method",
        picturePath: "assets/payment.png",
        buttonTap1: () async {
          await launch(paymentURL);
        },
        buttonTitle1: "Payment Method",
        buttonTap2: () {
          Get.to(SuccessOrderPage());
        },
        buttonTitle2: "Continue",
      ),
    );
  }
}
