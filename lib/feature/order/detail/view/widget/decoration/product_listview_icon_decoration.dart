part of '../../order_detail_view.dart';

class ProductListviewIconDecoration extends StatelessWidget {
  const ProductListviewIconDecoration({
    required this.child,
    super.key,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: const ProjectPadding.allSmall(),
        child: child,
      ),
    );
  }
}
