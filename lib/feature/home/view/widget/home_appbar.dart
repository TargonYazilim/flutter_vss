part of '../home_view.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

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
      title: Text(ProjectStrings.vss,
          style: context.general.appTheme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.general.appTheme.colorScheme.onSurface)),
      actions: [
        Padding(
          padding: ProjectPadding.allSmall(),
          child: Text(
            'Safa Uludoğan',
            style: context.general.appTheme.textTheme.titleMedium?.copyWith(
                color: context.general.colorScheme.onSurface,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
      centerTitle: true,
      //backgroundColor: context.general.appTheme.colorScheme.primary,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
