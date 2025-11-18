import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/controller/home_controller.dart';
import 'package:pas/widget/drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Barang"),
        backgroundColor: Colors.green,
      ),
      drawer: CustomDrawer(),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Obx((){
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: () {
              return controller.fetchStore();
            },
            child: ListView.builder(
          itemCount: controller.standings.length,  
          itemBuilder: (context, index) {
            final store = controller.standings[index];
            return Card(child: ListTile(
            title: Text(store.title.toString()),
            subtitle: Text(store.description),
            leading: Image(image: NetworkImage(store.image)),
            trailing: IconButton(
              onPressed: () {
                
              }, 
              icon: Icon(Icons.bookmark))
           ));
          }),
          );
        }),
      ),
    );
  }
}