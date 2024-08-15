// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomModalBarrier extends StatelessWidget {
  const CustomModalBarrier({
    required this.child,
    this.isLoading = false,
  });

  final Widget child;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading ?? false)
          const Opacity(
            opacity: .8,
            child: ModalBarrier(
              dismissible: false,
              color: Colors.black,
            ),
          ),
        if (isLoading ?? false) const Center(child: CircularProgressIndicator())
      ],
    );
  }
}
