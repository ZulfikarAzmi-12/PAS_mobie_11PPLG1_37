import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas/helpers/db_helper.dart';
import 'package:pas/models/store_model.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var standings = <StoreModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchStore();
  }

  Future<void> fetchStore() async {
    const url = "https://fakestoreapi.com/products";

    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(url));

      print("Status code: ${response.statusCode}");
      print("JSON result: ${response.body}");

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);

        standings.assignAll(
          data.map((e) => StoreModel.fromJson(e)).toList(),
        );
      } else {
        Get.snackbar("Failed", "Loading data failed");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addFavorite(StoreModel item) async {
    await DBHelper().insertFavorite({
      "id": item.id,
      "title": item.title,
      "description": item.description,
      "image": item.image,
    });

    Get.snackbar("Bookmark", "Berhasil ditambahkan ke Favorite");
  }
}
