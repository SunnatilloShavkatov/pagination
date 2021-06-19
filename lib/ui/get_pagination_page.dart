import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination/controller/home_controller.dart';
import 'package:pagination/widget/pagination_widget.dart';

class GetPaginationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('widget.title'),
          ),
          body: PaginationWidget(
            isLoading: controller.isLoading,
            onPagination: () async {
              await controller.setData(["", "", "", "", "", "", "", "", ""]);
              print('object');
            },
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("data"),
                  ),
                  subtitle: Text("likes: ${index + 1}"),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
