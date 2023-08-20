import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/font_styles.dart';

class CButtonNavigationBar extends StatelessWidget {
  final List<CBottomNavigationBarItem> items;
  const CButtonNavigationBar({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: CSizes.triplePadding * 3,
      ),
      color: AppColors.mainBlue,
      padding: const EdgeInsets.all(CSizes.doublePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: items,
      ),
    );
  }
}

class CBottomNavigationBarItem extends StatelessWidget {
  final IconData icon;
  const CBottomNavigationBarItem({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white.withOpacity(.5),
      ),
      padding: const EdgeInsets.all(CSizes.doublePadding),
      child: Icon(
        icon,
        size: 35,
      ),
    );
  }
}

class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.black,
          fontSize: CSizes.larger,
          fontWeight: CWeights.normal,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
