import 'package:flutter_vss/product/utility/constants/project_strings.dart';
import 'package:kartal/kartal.dart';

class ValidatorItems {
  const ValidatorItems(this.text);

  static const int phoneLength = 16;

  final String? text;

  String? get validateUsername {
    return text.ext.isNotNullOrNoEmpty
        ? null
        : ProjectStrings.usernameEmptyError;
  }

  String? get validatePassword {
    return text.ext.isNotNullOrNoEmpty
        ? null
        : ProjectStrings.passwordEmptyError;
  }

  String? get validateBaseUrl {
    return text.ext.isNotNullOrNoEmpty
        ? null
        : ProjectStrings.baseUrlEmptyError;
  }

  String? get validateCompanyNo {
    return text.ext.isNotNullOrNoEmpty
        ? null
        : ProjectStrings.companyNoEmptyError;
  }
}
