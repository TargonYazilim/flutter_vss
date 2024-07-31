part of '../home_view.dart';

class HomeCardButton extends StatelessWidget {
  const HomeCardButton({
    super.key,
    required this.onTab,
    required this.text,
    required this.child,
  });
  final String text;
  final Widget child;
  final void Function()? onTab;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.sized.dynamicHeight(.2),
        child: InkWell(
          onTap: () {},
          child: Card(
              color: context.general.appTheme.colorScheme.secondary,
              child: InkWell(
                onTap: onTab,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: context.sized.dynamicHeight(.1), child: child),
                    const SizedBox(height: WidgetSizes.spacingS),
                    Text(
                      text,
                      style: context.general.appTheme.textTheme.bodyLarge
                          ?.copyWith(
                              color: context.general.appTheme.colorScheme
                                  .onSurfaceVariant,
                              fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
              )),
        ));
  }
}
