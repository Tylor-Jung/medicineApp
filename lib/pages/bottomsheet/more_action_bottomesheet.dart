import 'package:app_project/components/app_widgets.dart';
import 'package:flutter/material.dart';

class MoreActionBottomSheet extends StatelessWidget {
  const MoreActionBottomSheet(
      {Key? key,
      required this.onPressedModify,
      required this.onPressedOnlyMedicine,
      required this.onPressedDeleteAll})
      : super(key: key);

  final VoidCallback onPressedModify;
  final VoidCallback onPressedOnlyMedicine;
  final VoidCallback onPressedDeleteAll;

  @override
  Widget build(BuildContext context) {
    return BottomSheetBody(
      children: [
        TextButton(
          onPressed: onPressedModify,
          child: const Text('약 정보 수정'),
        ),
        TextButton(
          style: TextButton.styleFrom(primary: Colors.red),
          onPressed: onPressedOnlyMedicine,
          child: const Text('약 정보 삭제'),
        ),
        TextButton(
          style: TextButton.styleFrom(primary: Colors.red),
          onPressed: onPressedOnlyMedicine,
          child: const Text('약 기록과 함께 약 정보 삭제'),
        ),
      ],
    );
  }
}
