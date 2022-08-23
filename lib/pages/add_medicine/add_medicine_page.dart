import 'dart:io';

import 'package:app_project/components/app_constants.dart';
import 'package:app_project/components/app_page_route.dart';
import 'package:app_project/main.dart';
import 'package:app_project/models/medicine.dart';
import 'package:app_project/pages/add_medicine/add_alram_page.dart';
import 'package:app_project/components/app_widgets.dart';
import 'package:app_project/pages/bottomsheet/pick_image_bottomesheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../components/add_page_widget.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({
    Key? key,
    this.updateMedicineId = -1,
  }) : super(key: key);

  final int updateMedicineId;

  @override
  State<AddMedicinePage> createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  late TextEditingController _nameController;
  File? _medicineImage;

  bool get _isUpdate => widget.updateMedicineId != -1;
  Medicine get _isUpdateMedicine =>
      medicineRepository.medicineBox.values.singleWhere(
        (medicined) => medicined.id == widget.updateMedicineId,
      );

  @override
  void initState() {
    super.initState();

    if (_isUpdate) {
      _nameController = TextEditingController(text: _isUpdateMedicine.name);
      if (_isUpdateMedicine.imagePath != null) {
        _medicineImage = File(_isUpdateMedicine.imagePath!);
      }
    } else {
      _nameController = TextEditingController();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
      ),
      body: SingleChildScrollView(
        child: AddPageBody(
          children: [
            Text(
              '어떤 약이예요?',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: largeSpace,
            ),
            Center(
              child: _MedicineImageButton(
                updateImage: _medicineImage,
                changeImageFile: (File? value) {
                  _medicineImage = value;
                },
              ),
            ),
            const SizedBox(
              height: largeSpace + regularSpace,
            ),
            Text(
              '약 이름',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            TextFormField(
              controller: _nameController,
              maxLength: 20,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              style: Theme.of(context).textTheme.bodyText1,
              decoration: InputDecoration(
                hintText: '복용할 약 이름을 기입해주세요.',
                hintStyle: Theme.of(context).textTheme.bodyText2,
                contentPadding: textFieldContentPadding,
              ),
              // onChanged버튼이 변화를 감지하고 활성, 비활성 여부가 됨
              onChanged: (_) {
                setState(() {});
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomSubmitButton(
          onPressed: _nameController.text.isEmpty ? null : _onAddAlramPage,
          text: '다음'),
    );
  }

  void _onAddAlramPage() {
    Navigator.push(
      context,
      FadePageRoute(
        page: AddAlarmPage(
          updateMedicineId: widget.updateMedicineId,
          medicineImage: _medicineImage,
          medicineName: _nameController.text,
        ),
      ),
    );
  }
}

class _MedicineImageButton extends StatefulWidget {
  const _MedicineImageButton(
      {Key? key, required this.changeImageFile, this.updateImage})
      : super(key: key);

// ValueChanged : 자식이 가지고 있는 데이터를 바깥으로 전달하는 방법
  final ValueChanged<File?> changeImageFile;
  final File? updateImage;

  @override
  State<_MedicineImageButton> createState() => _MedicineImageButtonState();
}

class _MedicineImageButtonState extends State<_MedicineImageButton> {
  File? _pickedImage;

  @override
  void initState() {
    super.initState();
    _pickedImage = widget.updateImage;
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      child: CupertinoButton(
        padding: _pickedImage == null ? null : EdgeInsets.zero,
        onPressed: _showBottomSheet,
        child: _pickedImage == null
            ? const Icon(
                CupertinoIcons.photo_camera_solid,
                size: 30,
                color: Colors.white,
              )
            : CircleAvatar(
                foregroundImage: FileImage(_pickedImage!),
                radius: 40,
              ),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return PickImageBottomSheet(
              onPressedCamera: () => _onPressed(ImageSource.camera),
              onPressedGallary: () => _onPressed(ImageSource.gallery));
        });
  }

  void _onPressed(ImageSource source) {
    ImagePicker().pickImage(source: source).then((xfile) {
      if (xfile != null) {
        setState(() {
          _pickedImage = File(xfile.path);
          widget.changeImageFile(_pickedImage);
        });
      }
      Navigator.maybePop(context);
    }).onError((error, stackTrace) {
      // shwo setting
      Navigator.pop(context);
      showPermissionDenied(context, permission: '카메라 및 갤러리 접근');
    });
  }
}
