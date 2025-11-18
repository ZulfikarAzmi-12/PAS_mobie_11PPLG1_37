import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/controller/favorit_controller.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  final controller = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite List"),
        backgroundColor: Colors.redAccent,
      ),
      body: Obx(() {
        if (controller.favorites.isEmpty) {
          return const Center(
            child: Text("Belum ada favorite"),
          );
        }

        return ListView.builder(
          itemCount: controller.favorites.length,
          itemBuilder: (context, index) {
            final item = controller.favorites[index];
            return Card(
              child: ListTile(
                leading: Image.network(item.image, width: 50),
                title: Text(item.title),
                subtitle: Text(item.description),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    controller.removeFavorite(item.id);
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
