part of '../wayybill_view.dart';

class WayybillLoading extends StatelessWidget {
  const WayybillLoading({
    required this.parentChild,
    super.key,
  });
  final Widget parentChild;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WayybillViewModel, WayybillState>(
      builder: (BuildContext context, WayybillState state) {
        return CustomModalBarrier(
          isLoading: state.isLoading,
          child: parentChild,
        );
      },
    );
  }
}
