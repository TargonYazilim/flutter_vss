import 'package:flutter/material.dart';
import 'package:flutter_vss/product/utility/constants/project_colors.dart';
import 'package:flutter_vss/product/utility/toast/toast_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

final class ToastManager extends ToastService {
  ToastManager();
  @override
  void showSuccessMessage({required String message}) {
    _showToast(message: message, color: ProjectColors.toastSuccessGreenColor);
  }

  @override
  void showErrorMessage({required String message}) {
    _showToast(message: message, color: ProjectColors.toastErrorRedColor);
  }

  @override
  void showInfoMessage({required String message}) {
    _showToast(message: message, color: ProjectColors.toastInfoBlueColor);
  }

  void _showToast({required String message, required Color color}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16);
  }
}
