import 'package:ecommerce/models/product.dart';

class ProductRepository {
  List<Product> get products {
    List<Product> lst = new List<Product>();
    for (int i = 1; i <= 6; i++) {
      lst.add(
        new Product(
            id: i,
            name: "جاكيت $i",
            category: ProductCategory.Jackets,
            price: 100 + 10 * i,
            description: 'وصف منتج رقم $i',
            images: [
              'https://picsum.photos/id/1000/700/700',
              'https://picsum.photos/id/1001/700/700'
            ],
            brand: "ماركة $i",
            details: [
              Option(name: "مقاسات", choices: ["S", "M", "L", "XL"]),
              Option(name: "ألوان", choices: ["أحمر", "أخضر", "أزرق"])
            ]),
      );
    }
    for (int i = 1; i <= 6; i++) {
      lst.add(
        new Product(
            id: i,
            name: "جزمة $i",
            category: ProductCategory.Shoes,
            price: 100 + 10 * i,
            description: 'وصف منتج رقم $i',
            images: [
              'https://picsum.photos/id/1003/700/700',
              'https://picsum.photos/id/1004/700/700'
            ],
            brand: "ماركة $i",
            details: [
              Option(name: "مقاسات", choices: ["S", "M", "L", "XL"]),
              Option(name: "ألوان", choices: ["أحمر", "أخضر", "أزرق"])
            ]),
      );
    }
    for (int i = 1; i <= 6; i++) {
      lst.add(
        new Product(
            id: i,
            name: "قميص $i",
            category: ProductCategory.Shirts,
            price: 100 + 10 * i,
            description: 'وصف منتج رقم $i',
            images: [
              'https://picsum.photos/id/1005/700/700',
              'https://picsum.photos/id/1006/700/700'
            ],
            brand: "ماركة $i",
            details: [
              Option(name: "مقاسات", choices: ["S", "M", "L", "XL"]),
              Option(name: "ألوان", choices: ["أحمر", "أخضر", "أزرق"])
            ]),
      );
    }
    for (int i = 1; i <= 6; i++) {
      lst.add(
        new Product(
            id: i,
            name: "سويتشيرت $i",
            category: ProductCategory.Sweatshirts,
            price: 100 + 10 * i,
            description: 'وصف منتج رقم $i',
            images: [
              'https://picsum.photos/id/1007/700/700',
              'https://picsum.photos/id/1008/700/700'
            ],
            brand: "ماركة $i",
            details: [
              Option(name: "مقاسات", choices: ["S", "M", "L", "XL"]),
              Option(name: "ألوان", choices: ["أحمر", "أخضر", "أزرق"])
            ]),
      );
    }
    return lst;
  }
}
