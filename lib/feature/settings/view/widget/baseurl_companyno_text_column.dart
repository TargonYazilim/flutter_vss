part of '../settings_view.dart';

class BaseUrlCompanyNoTextColumn extends StatelessWidget {
  const BaseUrlCompanyNoTextColumn({
    required this.baseUrlController,
    required this.companyNoController,
    required this.periodNoController,
    required this.valueListenable,
    super.key,
  });

  final TextEditingController baseUrlController;
  final TextEditingController companyNoController;
  final TextEditingController periodNoController;
  final ValueListenable<bool> valueListenable;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: valueListenable,
      builder: (BuildContext context, bool value, Widget? child) {
        return Column(
          children: [
            ProductTextfield(
              controller: baseUrlController,
              validator: (value) => ValidatorItems(value).validateBaseUrl,
              maxLength: ProjectValues.baseUrlMaxLength,
              labelText: ProjectStrings.baseUrlHint,
              enabled: value,
            ),
            const SizedBox(height: WidgetSizes.spacingS),
            ProductTextfield(
              controller: companyNoController,
              validator: (value) => ValidatorItems(value).validateCompanyNo,
              maxLength: ProjectValues.companyNoMaxLength,
              labelText: ProjectStrings.companyNoHint,
              enabled: value,
            ),
            const SizedBox(height: WidgetSizes.spacingS),
            ProductTextfield(
              controller: periodNoController,
              validator: (value) => ValidatorItems(value).validatePeriodNo,
              maxLength: ProjectValues.periodNoMaxLength,
              labelText: ProjectStrings.periodNoHint,
              enabled: value,
            ),
          ],
        );
      },
    );
  }
}
