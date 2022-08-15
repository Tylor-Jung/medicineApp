import 'package:app_project/components/app_constants.dart';
import 'package:flutter/material.dart';

class AddPageBody extends StatelessWidget {
  const AddPageBody({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}

class BottomSubmitButton extends StatelessWidget {
  const BottomSubmitButton({Key? key, this.onPressed, required this.text}) : super(key: key);

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: submitButtonBoxPadding,
        child: SizedBox(
          height: submitButtonHeight,
          child: ElevatedButton(
            // 입력창이 null 값일 때 버튼 비활성화 onPressed: _nameController.text.isEmpty ? null : () {},
            
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                textStyle: Theme.of(context).textTheme.subtitle1),
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
