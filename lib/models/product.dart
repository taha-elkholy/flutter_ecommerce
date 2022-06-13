import 'package:flutter_ecommerce/utilities/app_assets.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final String imageUrl;
  final int? discountValue;
  final String category;
  final double? rate;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.imageUrl,
      this.discountValue,
      this.category = 'Others',
      this.rate});
}

List<Product> dummyProducts = [
  Product(
    id: '1',
    title: 'T-shirt',
    price: 156,
    imageUrl: AppAssets.tempProductImage1,
    category: 'Clothes',
    discountValue: 20,
  ),
  Product(
    id: '2',
    title: 'T-shirt-thg',
    price: 300,
    imageUrl: AppAssets.tempProductImage2,
    category: 'Clothes',
    discountValue: 10,
  ),
  Product(
    id: '3',
    title: 'T-shirt',
    price: 252,
    imageUrl: AppAssets.tempProductImage3,
    category: 'Clothes',
  ),
  Product(
    id: '4',
    title: 'T-shirt',
    price: 450,
    imageUrl: AppAssets.tempProductImage4,
    category: 'Clothes',
    discountValue: 15,
  ),
  Product(
    id: '5',
    title: 'T-shirt',
    price: 156,
    imageUrl: AppAssets.tempProductImage1,
    category: 'Clothes',
    discountValue: 20,
  ),
  Product(
    id: '6',
    title: 'T-shirt',
    price: 156,
    imageUrl: AppAssets.tempProductImage2,
    category: 'Clothes',
    discountValue: 20,
  ),
];
