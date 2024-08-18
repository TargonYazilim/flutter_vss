part of '../../home_view.dart';

class HomeDrawerMenu extends StatelessWidget {
  const HomeDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.general.appTheme.colorScheme.primary,
            ),
            child: Align(
              child: Text(
                ProjectStrings.projectName,
                style: context.general.textTheme.titleLarge
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ),
          Column(
            children: DrawerMenuItems.getItems(context)
                .map(
                  (item) => ListTile(
                    leading: Icon(item.icon,color: item.color),
                    title: Text(
                      item.title,
                      style: context.general.textTheme.titleMedium?.copyWith(
                        color: item.color,
                      ),
                    ),
                    onTap: item.callback.call,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
