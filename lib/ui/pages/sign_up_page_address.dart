part of 'pages.dart';

class SignUpPageAddress extends StatefulWidget {
  final User user;
  final String password;
  final File pictureFile;

  SignUpPageAddress(this.user, this.password, this.pictureFile);
  @override
  _SignUpPageAddressState createState() => _SignUpPageAddressState();
}

class _SignUpPageAddressState extends State<SignUpPageAddress> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController addrssController = TextEditingController();
  bool isLoading = false;
  List<String> cities;
  String selectedCity;

  @override
  void initState() {
    super.initState();
    cities = ['Bandung', 'Jakarta', 'Pekanbaru', 'Medan', 'Surabaya'];
    selectedCity = cities[0];
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Address',
      subtitle: "Make sure it's valid",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'Phone Number',
              style: blackFontStyle16,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your phone number'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'Address',
              style: blackFontStyle16,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: addrssController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your address'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'House Number',
              style: blackFontStyle16,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: houseNumberController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Type your house number'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'City',
              style: blackFontStyle16,
            ),
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),
              child: DropdownButton(
                  value: selectedCity,
                  isExpanded: true,
                  underline: SizedBox(),
                  items: cities
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: blackFontStyle14,
                          )))
                      .toList(),
                  onChanged: (item) {
                    setState(() {
                      selectedCity = item;
                    });
                  })),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: (isLoading == true)
                ? Center(
                    child: loadingIndicator,
                  )
                : RaisedButton(
                    onPressed: () async {
                      User user = widget.user.copyWith(
                          phoneNumber: phoneNumberController.text,
                          address: addrssController.text,
                          houseNumber: houseNumberController.text,
                          city: selectedCity);
                      setState(() {
                        isLoading = true;
                      });
                      // ignore: deprecated_member_use
                      // await context.bloc<UserCubit>().signUp(
                      //     user, widget.password,
                      //     pictureFile: widget.pictureFile);
                      await BlocProvider.of<UserCubit>(context).signUp(
                          user, widget.password,
                          pictureFile: widget.pictureFile);
                      // ignore: deprecated_member_use
                      // UserState state = context.bloc<UserCubit>().state;
                      UserState state =
                          BlocProvider.of<UserCubit>(context).state;
                      if (state is UserLoaded) {
                        BlocProvider.of<FoodCubit>(context).getFoods();
                        // context.bloc<FoodCubit>().getFoods();
                        // ignore: deprecated_mUserCubitember_use
                        // context.bloc<TransactionCubit>().getTransactions();
                        BlocProvider.of<TransactionCubit>(context)
                            .getTransactions();

                        Get.to(MainPage());
                      } else {
                        Get.snackbar("", "",
                            backgroundColor: "D9435E".toColor(),
                            icon: Icon(
                              MdiIcons.closeCircleOutline,
                              color: Colors.white,
                            ),
                            titleText: Text(
                              "Sign In Failed !!!!!",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            messageText: Text(
                                (state as UserLoadingFailed).message,
                                style:
                                    GoogleFonts.poppins(color: Colors.white)));
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: yellowColor,
                    child: Text(
                      'Sign Up Now',
                      style: blackFontStyle14,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
