import 'package:flutter/material.dart';
import 'package:photo_gallery_app/view/pages/home/home_components.dart';
import 'package:photo_gallery_app/view/pages/home_page/home_page.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(
        title: "Gallery",
      ),
      bottomNavigationBar: const CButtonNavigationBar(
        items: [
          CBottomNavigationBarItem(icon: Icons.photo_outlined),
        ],
      ),
      body: PhotoGalleryHomePage(),
    );
  }
}
