import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vss/feature/settings/view_model/settings_view_model.dart';
import 'package:flutter_vss/product/utility/constants/product_padding.dart';
import 'package:flutter_vss/product/utility/constants/project_strings.dart';
import 'package:flutter_vss/product/utility/constants/project_values.dart';
import 'package:flutter_vss/product/utility/custom_keyboard_dismisser.dart';
import 'package:flutter_vss/product/utility/size/widget_size.dart';
import 'package:flutter_vss/product/utility/validators/validator_items.dart';
import 'package:flutter_vss/product/widget/product_textfield.dart';
import 'package:kartal/kartal.dart';

part 'widget/baseurl_companyno_text_column.dart';
part 'widget/floating_save_button.dart';
part 'widget/settings_appbar.dart';

@RoutePage()
class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends SettingsViewModel {
  @override
  Widget build(BuildContext context) {
    return CustomKeyboardDismisser(
      child: Scaffold(
        floatingActionButton: FloatingSaveButton(
          callback: () async => save(context),
          valueListenable: isSettingsEditable,
        ),
        appBar: SettingsAppbar(valueListenable: isLoading),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const ProjectPadding.horizontalMedium(),
          child: _formBody(),
        ),
      ),
    );
  }

  Widget _formBody() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: WidgetSizes.spacingXxl6),
          BaseUrlCompanyNoTextColumn(
            baseUrlController: baseUrlController,
            companyNoController: companyNoController,
            valueListenable: isSettingsEditable,
          ),
        ],
      ),
    );
  }
}
