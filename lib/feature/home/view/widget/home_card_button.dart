part of '../home_view.dart';

class HomeCardButton extends StatelessWidget {
  const HomeCardButton({
    super.key,
    required this.text,
    required this.child,
  });
  final String text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.sized.dynamicHeight(.2),
        child: Card(
            child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: context.sized.dynamicHeight(.1), child: child),
            SizedBox(height: WidgetSizes.spacingS),
            Text(text),
          ],
        ))));
  }
}
