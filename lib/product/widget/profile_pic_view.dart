import 'package:flutter/material.dart';
import 'package:flutter_vss/product/utility/constants/project_radius.dart';

class ProfilePicView extends StatelessWidget {
  const ProfilePicView({required this.imageProvider, super.key});
  final ImageProvider imageProvider;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ProjectRadius.large.value * 9),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // gölgenin konumu
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(ProjectRadius.large.value * 9),
          child: Image(
            image: imageProvider,
            fit: BoxFit.cover,
            height: 54,
            width: 54,
          ),
        ),
      ),
    );
  }
}
