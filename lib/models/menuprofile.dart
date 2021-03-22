part of 'models.dart';

enum MenuType { account, market }

class MenuProfile extends Equatable {
  final String title;
  final MenuType types;
  // final List<MenuType> types;
  MenuProfile({this.title, this.types});

  MenuProfile copyWith({String title, MenuType types}) {
    return MenuProfile(title: title ?? this.title, types: types ?? this.types);
  }

  @override
  List<Object> get props => [title, types];
}

List<MenuProfile> mockMenu = [
  MenuProfile(title: 'Edit Profile', types: MenuType.account),
  MenuProfile(title: 'Home Address', types: MenuType.account),
  MenuProfile(title: 'Security', types: MenuType.account),
  MenuProfile(title: 'Payment', types: MenuType.account),
  MenuProfile(title: 'Logout', types: MenuType.account),
  MenuProfile(title: 'Rate App', types: MenuType.market),
  MenuProfile(title: 'Help Center', types: MenuType.market),
  MenuProfile(title: 'Privacy & Policy', types: MenuType.market),
  MenuProfile(title: 'Term & Condition', types: MenuType.market)
];
