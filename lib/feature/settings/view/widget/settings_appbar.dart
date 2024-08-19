// ignore_for_file: public_member_api_docs

part of '../settings_view.dart';

class SettingsAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SettingsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      shadowColor: context.general.appTheme.colorScheme.shadow,
      /*leading: Padding(
        padding: ProjectPadding.allSmall(),
        child: ProfilePicView(
          imageProvider: ProjectImages.imgSafa.toImageProvider(),
        ),
      ),*/
      title: Text(
        ProjectStrings.settings,
        style: context.general.appTheme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: context.general.appTheme.colorScheme.onSurface,
        ),
      ),
      centerTitle: true,
      //backgroundColor: context.general.appTheme.colorScheme.primary,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
