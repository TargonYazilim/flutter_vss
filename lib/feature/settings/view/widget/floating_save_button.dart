part of '../settings_view.dart';

class FloatingSaveButton extends StatelessWidget {
  const FloatingSaveButton({
    required this.callback,
    required this.valueListenable,
    super.key,
  });
  final AsyncCallback callback;
  final ValueListenable<bool> valueListenable;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: valueListenable,
      builder: (BuildContext context, bool value, Widget? child) {
        return FloatingActionButton.extended(
          backgroundColor: context.general.appTheme.colorScheme.primary,
          foregroundColor: Colors.white,
          onPressed: () async => callback.call(),
          label: Text(
            ProjectStrings.save,
            style: context.general.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          icon: const Icon(Icons.save),
        ).ext.toVisible(value: value);
      },
    );
  }
}
