import 'package:flutter/material.dart';

/// Project general padding items
final class ProjectPadding extends EdgeInsets {
  const ProjectPadding._() : super.all(0);

  /// All Padding
  ///
  /// [ProjectPadding.allSmall] is 8
  const ProjectPadding.allSmall() : super.all(8);

  /// [ProjectPadding.allMedium] is 16
  const ProjectPadding.allMedium() : super.all(16);

  /// [ProjectPadding.allNormal] is 20
  const ProjectPadding.allNormal() : super.all(20);

  /// [ProjectPadding.allLarge] is 32
  const ProjectPadding.allLarge() : super.all(32);

  /// Top Padding
  ///
  /// [ProjectPadding.topSmall] is 8
  const ProjectPadding.topSmall() : super.only(top: 8);

  /// [ProjectPadding.topMedium] is 16
  const ProjectPadding.topMedium() : super.only(top: 16);

  /// [ProjectPadding.topNormal] is 20
  const ProjectPadding.topNormal() : super.only(top: 20);

  /// [ProjectPadding.topLarge] is 32
  const ProjectPadding.topLarge() : super.only(top: 32);

  /// Bottom Padding
  ///
  /// [ProjectPadding.bottomSmall] is 8
  const ProjectPadding.bottomSmall() : super.only(bottom: 8);

  /// [ProjectPadding.bottomMedium] is 16
  const ProjectPadding.bottomMedium() : super.only(bottom: 16);

  /// [ProjectPadding.bottomNormal] is 20
  const ProjectPadding.bottomNormal() : super.only(bottom: 20);

  /// [ProjectPadding.bottomLarge] is 32
  const ProjectPadding.bottomLarge() : super.only(bottom: 32);

  /// Horizontal Padding
  ///
  /// [ProjectPadding.horizontalSmall] is 8
  const ProjectPadding.horizontalSmall() : super.symmetric(horizontal: 8);

  /// [ProjectPadding.horizontalMedium] is 16
  const ProjectPadding.horizontalMedium() : super.symmetric(horizontal: 16);

  /// [ProjectPadding.horizontalNormal] is 20
  const ProjectPadding.horizontalNormal() : super.symmetric(horizontal: 20);

  /// [ProjectPadding.horizontalLarge] is 32
  const ProjectPadding.horizontalLarge() : super.symmetric(horizontal: 32);

  /// Vertical Padding
  ///
  /// [ProjectPadding.verticalSmall] is 8
  const ProjectPadding.verticalSmall() : super.symmetric(vertical: 8);

  /// [ProjectPadding.verticalMedium] is 16
  const ProjectPadding.verticalMedium() : super.symmetric(vertical: 16);

  /// [ProjectPadding.verticalNormal] is 20
  const ProjectPadding.verticalNormal() : super.symmetric(vertical: 20);

  /// [ProjectPadding.verticalLarge] is 32
  const ProjectPadding.verticalLarge() : super.symmetric(vertical: 32);

  /// Only Left Padding
  ///
  /// [ProjectPadding.leftSmall] is 8
  const ProjectPadding.leftSmall() : super.only(left: 8);

  /// [ProjectPadding.leftMedium] is 16
  const ProjectPadding.leftMedium() : super.only(left: 16);

  /// [ProjectPadding.leftNormal] is 20
  const ProjectPadding.leftNormal() : super.only(left: 20);

  /// [ProjectPadding.leftLarge] is 32
  const ProjectPadding.leftLarge() : super.only(left: 32);

    /// Only Right Padding
  ///
  /// [ProjectPadding.rightSmall] is 8
  const ProjectPadding.rightSmall() : super.only(right: 8);

  /// [ProjectPadding.rightMedium] is 16
  const ProjectPadding.rightMedium() : super.only(right: 16);

  /// [ProjectPadding.rightNormal] is 20
  const ProjectPadding.rightNormal() : super.only(right: 20);

  /// [ProjectPadding.rightLarge] is 32
  const ProjectPadding.rightLarge() : super.only(right: 32);
}
