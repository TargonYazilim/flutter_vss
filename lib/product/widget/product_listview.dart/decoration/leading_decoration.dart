part of '../product_listview_separated.dart';

class LeadingDecoration extends StatelessWidget {
  const LeadingDecoration({
    required this.child,
    super.key,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        height: 40,
        width: 40,
        color: context.general.appTheme.colorScheme.secondary,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
