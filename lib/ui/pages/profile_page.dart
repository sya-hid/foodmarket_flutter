part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0;
  List<MenuProfile> account =
      mockMenu.where((element) => element.types == MenuType.account).toList();
  List<MenuProfile> market =
      mockMenu.where((element) => element.types == MenuType.market).toList();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;

    return ListView(
      children: [
        Column(
          children: [
            //// Header
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              height: 220,
              margin: EdgeInsets.only(bottom: defaultMargin),
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    margin: EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/photo_border.png'))),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  (BlocProvider.of<UserCubit>(context).state
                                          as UserLoaded)
                                      .user
                                      .picturePath),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Text(
                    (BlocProvider.of<UserCubit>(context).state as UserLoaded)
                        .user
                        .name,
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    (BlocProvider.of<UserCubit>(context).state as UserLoaded)
                        .user
                        .email,
                    style: greyFontStyle.copyWith(fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
            //// Body
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabBar(
                    titles: ["Account", "FoodMarket"],
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: (selectedIndex == 0 ? account : market)
                        .map((e) => Padding(
                              padding: EdgeInsets.only(
                                  right: defaultMargin,
                                  left: defaultMargin,
                                  bottom: 16),
                              child: isLoading
                                  ? loadingIndicator
                                  : GestureDetector(
                                      onTap: () async {
                                        if (e.title == 'Logout') {
                                          setState(() {
                                            isLoading = true;
                                          });
                                          await BlocProvider.of<UserCubit>(
                                                  context)
                                              .logout();
                                          UserState state =
                                              BlocProvider.of<UserCubit>(
                                                      context)
                                                  .state;
                                          if (state is UserLoaded) {
                                            Get.to(SignInPage());
                                          }
                                          // else {
                                          //   Get.snackbar("", "",
                                          //       backgroundColor:
                                          //           "D9435E".toColor(),
                                          //       icon: Icon(
                                          //         MdiIcons.closeCircleOutline,
                                          //         color: Colors.white,
                                          //       ),
                                          //       titleText: Text(
                                          //         "Sign In Failed!!!!!!!!",
                                          //         style: GoogleFonts.poppins(
                                          //             color: Colors.white,
                                          //             fontWeight:
                                          //                 FontWeight.w600),
                                          //       ),
                                          //       messageText: Text(
                                          //           (state as UserLoadingFailed)
                                          //               .message,
                                          //           style: GoogleFonts.poppins(
                                          //               color: Colors.white)));
                                          //   setState(() {
                                          //     isLoading = false;
                                          //   });
                                          // }
                                        }
                                      },
                                      child: MenuListProfile(
                                          menu: e, itemWidth: listItemWidth),
                                    ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        )
      ],
    );
  }
}
