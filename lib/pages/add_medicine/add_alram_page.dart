import 'dart:io';

import 'package:app_project/components/app_constants.dart';
import 'package:app_project/pages/add_medicine/add_medicine_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/add_page_widget.dart';

class AddAlarmPage extends StatelessWidget {
  const AddAlarmPage(
      {Key? key, required this.MedicineImage, required this.medicineName})
      : super(key: key);

  final File? MedicineImage;
  final String medicineName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AddPageBody(
        children: [
          Text(
            '매일 복약 잊지 말아요!',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: largeSpace),
          // Expanded는 칼럼(Coulrm에서 내가 갖고있는 영역 모두에서 그릴 수 있도록 하는 명령어)
          Expanded(
            child: ListView(
              children: const [
                AlramBox(),
                AlramBox(),
                AlramBox(),
                AlramBox(),
                AddAlramButton(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomSubmitButton(
        onPressed: () {},
        text: '완료',
      ),
    );
  }
}

class AlramBox extends StatelessWidget {
  const AlramBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.minus_circle),
          ),
        ),
        Expanded(
          flex: 5,
          child: TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.subtitle2,
            ),
            onPressed: () {},
            child: const Text('20:00'),
          ),
        ),
      ],
    );
  }
}

class AddAlramButton extends StatelessWidget {
  const AddAlramButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
        textStyle: Theme.of(context).textTheme.subtitle1,
      ),
      onPressed: () {},
      child: Row(
        children: const [
          Expanded(
            flex: 1,
            child: Icon(CupertinoIcons.plus_circle_fill),
          ),
          Expanded(
            flex: 5,
            child: Center(child: Text('복용시간 추가')),
          ),
        ],
      ),
    );
  }
}
