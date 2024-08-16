part of '../wayybill_view.dart';


class DelivaredRecipientRow extends StatelessWidget {
  const DelivaredRecipientRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          ProjectStrings.deliveredBy,
          style: context.general.appTheme.textTheme.titleMedium?.copyWith(
            color: context.general.appTheme.colorScheme.onSurface,
          ),
        ),
        Text(
          ProjectStrings.recipient,
          style: context.general.appTheme.textTheme.titleMedium?.copyWith(
            color: context.general.appTheme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
