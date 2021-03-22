part of 'widgets.dart';

class MenuListProfile extends StatelessWidget {
  final MenuProfile menu;
  final double itemWidth;
  MenuListProfile({@required this.menu, @required this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              menu.title,
              style: blackFontStyle14,
            )
          ],
        ),
        Spacer(),
        SizedBox(
          height: 24,
          width: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                'assets/right_arrow.png',
                fit: BoxFit.contain,
              )
            ],
          ),
        )
      ],
    );
  }
}
