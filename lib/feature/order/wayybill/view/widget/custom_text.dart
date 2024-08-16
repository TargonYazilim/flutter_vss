part of '../wayybill_view.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.general.appTheme.textTheme.titleMedium?.copyWith(
        color: context.general.appTheme.colorScheme.onSurface,
      ),
    );
  }
}
