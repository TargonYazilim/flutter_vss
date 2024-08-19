import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';
import 'package:kartal/kartal.dart';

part 'widget/settings_appbar.dart';

@RoutePage()
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SettingsAppbar(),
      resizeToAvoidBottomInset: false,
    );
  }
}
