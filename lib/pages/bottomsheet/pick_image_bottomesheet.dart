import 'package:app_project/components/app_widgets.dart';
import 'package:flutter/material.dart';

class PickImageBottomSheet extends StatelessWidget {
  const PickImageBottomSheet(
      {Key? key, required this.onPressedCamera, required this.onPressedGallary})
      : super(key: key);

  final VoidCallback onPressedCamera;
  final VoidCallback onPressedGallary;

  @override
  Widget build(BuildContext context) {
    return BottomSheetBody(
      children: [
        TextButton(
          onPressed: onPressedCamera,
          child: const Text('카메라로 촬영'),
        ),
        TextButton(
          onPressed: onPressedGallary,
          child: const Text('앨범에서 가져오기'),
        ),
      ],
    );
  }
}