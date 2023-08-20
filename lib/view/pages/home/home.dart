import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery_app/view/pages/home/home_components.dart';
import 'package:photo_gallery_app/view/pages/home_page/home_page.dart';

import '../../../blocs/photo_gallery_blocs/photo_gallery_bloc.dart';

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
      body: BlocProvider(
        create: (BuildContext context) => PhotoGalleryBloc()..add(FetchPhotoGalleryEvent()),
        child: PhotoGalleryHomePage(),
      ),
    );
  }
}
