import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:protal_app/components/dialog/app_dialog.dart';
import 'package:protal_app/core/state/api_state.dart';
import 'package:protal_app/modules/show_image/controllers/image_controller.dart';
import 'package:protal_app/modules/show_image/models/image_entity.dart';

class ListViewImage extends StatefulWidget {
  const ListViewImage({Key? key}) : super(key: key);

  @override
  ListViewImageState createState() => ListViewImageState();
}

class ListViewImageState extends State<ListViewImage> {
  ImageController imageController = Get.put(ImageController());

  List<ImageEntity> get imageEntity => imageController.imageEntity;

  final ScrollController _scrollListViewController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      imageEntity.clear();
      await imageController.getImage(offset: 1);
      _scrollListViewController.addListener(_scrollListener);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ย้อนกลับ'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(() {
              handleImageController();
              return Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    imageController.clearData();
                    await imageController.getImage(offset: 1);
                  },
                  child: ListView.builder(
                    controller: _scrollListViewController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: imageEntity.length,
                    itemBuilder: (context, index) {
                      return buildItem(imageEntity[index]);
                    },
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget buildItem(ImageEntity imageEntity) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // color: Colors.grey.withOpacity(0.3),
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.3),
          ),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageEntity.url ?? ''),
            radius: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  imageEntity.title ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  imageEntity.description ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _scrollListener() {
    if (_scrollListViewController.offset >= _scrollListViewController.position.maxScrollExtent &&
        !_scrollListViewController.position.outOfRange &&
        imageController.offset <= 10) {
      imageController.getImage(offset: imageController.offset + 1);
    }
  }

  void handleImageController() {
    if (imageController.apiState == ApiState.loading) {
      Future.delayed(Duration.zero, () {
        AppDialog().showLoading(context);
      });
    } else if (imageController.apiState == ApiState.success) {
      Future.delayed(Duration.zero, () {
        AppDialog().hideDialog(context);
        imageController.setApiState(newState: ApiState.empty);
      });
    }
  }
}
