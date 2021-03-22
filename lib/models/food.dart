part of 'models.dart';

enum FoodType { new_food, popular, recommended }

class Food extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;
  final List<FoodType> types;

  Food(
      {this.id,
      this.picturePath,
      this.name,
      this.description,
      this.ingredients,
      this.price,
      this.rate,
      this.types = const []});

  factory Food.fromJson(Map<String, dynamic> data) => Food(
      id: data['id'],
      picturePath: data['picturePath'],
      name: data['name'],
      description: data['description'],
      ingredients: data['ingredients'],
      price: data['price'],
      rate: (data['rate'] as num).toDouble(),
      types: data['types'].toString().split(',').map((e) {
        switch (e) {
          case 'recommended':
            return FoodType.recommended;
            break;
          case 'popular':
            return FoodType.popular;
            break;
          default:
            return FoodType.new_food;
        }
      }).toList());

  @override
  List<Object> get props =>
      [id, picturePath, name, description, ingredients, price, rate];
}

List<Food> mockFoods = [
  Food(
      id: 1,
      picturePath:
          'https://i.pinimg.com/736x/06/7b/28/067b2879e5c9c42ec669bf639c3fbffc.jpg',
      name: 'Sate Sultan1',
      description: 'Sate sayur dengan daging asli dan masih fresh tentunya. Dengan bumbu-bumbu asli dan tanpa bahan pengawet. Cocok dinikmati bersama dengan keluarga tercinta',
      ingredients: 'Daging Kambing, Bumbu kacang, Tomat',
      price: 25000,
      rate: 3.2,
      types: [FoodType.new_food, FoodType.popular]),
  Food(
      id: 2,
      picturePath:
          'https://i.pinimg.com/736x/06/7b/28/067b2879e5c9c42ec669bf639c3fbffc.jpg',
      name: 'Sate Sultan2',
      description: 'Sate sayur dengan daging asli dan masih fresh tentunya. Dengan bumbu-bumbu asli dan tanpa bahan pengawet. Cocok dinikmati bersama dengan keluarga tercinta',
      ingredients: 'Daging Kambing, Bumbu kacang, Tomat',
      price: 25000,
      rate: 4.5,
      types: [FoodType.new_food, FoodType.recommended]),
  Food(
      id: 3,
      picturePath:
          'https://i.pinimg.com/736x/06/7b/28/067b2879e5c9c42ec669bf639c3fbffc.jpg',
      name: 'Sate Sultan3',
      description: 'Sate sayur dengan daging asli dan masih fresh tentunya. Dengan bumbu-bumbu asli dan tanpa bahan pengawet. Cocok dinikmati bersama dengan keluarga tercinta',
      ingredients: 'Daging Kambing, Bumbu kacang, Tomat',
      price: 25000,
      rate: 3.5,
      types: [FoodType.new_food, FoodType.popular, FoodType.recommended])
];
