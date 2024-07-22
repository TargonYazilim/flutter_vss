/// ProjectRadius enum
enum ProjectRadius {
  /// 8.0
  low(8),

  /// 12.0
  small(12),

  /// 16.0
  normal(16),

  /// 20.0
  medium(20),

  /// 32.0
  large(32);

  final double value;
  const ProjectRadius(this.value);
}
