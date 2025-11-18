import 'package:get/get.dart';
import 'package:pas/helpers/db_helper.dart';
import 'package:pas/models/store_model.dart';

class FavoriteController extends GetxController {
  var favorites = <StoreModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
  final data = await DBHelper().getFavorites();

  favorites.assignAll(
    data.map((item) {
      return StoreModel.fromJson({
        "id": item["id"],
        "title": item["title"],
        "description": item["description"],
        "image": item["image"],

        "price": 0.0,
        "category": "electronics",
        "rating": {
          "rate": 0.0,
          "count": 0,
        },
      });
    }).toList(),
  );
}


  Future<void> addFavorite(StoreModel item) async {
    await DBHelper().insertFavorite({
      "id": item.id,
      "title": item.title,
      "description": item.description,
      "image": item.image,
    });
    loadFavorites();
  }

  Future<void> removeFavorite(int id) async {
    await DBHelper().deleteFavorite(id);
    loadFavorites();
  }
}
