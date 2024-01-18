import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uas_nomor5/model/course_reminder.dart';
class AddForm extends StatefulWidget {
  const AddForm({Key? key}) : super(key: key);
  @override
  _AddFormState createState() =>
      _AddFormState();
}
class _AddFormState extends
State<AddForm> {
  final _nameController = TextEditingController();
  final _kodeController = TextEditingController();
  final _jadwalController = TextEditingController();
  final _FormKey = GlobalKey<FormState>();
  late final Box box;
  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

  _addInfo() async {
    Course_reminder jadwal = Course_reminder(
      namaMatkul: _nameController.text,
      kodeMatkul: _kodeController.text,
      jadwalMatkul: _jadwalController.text,
    );
    box.add(jadwal);
  }
  @override
  void initState() {
    super.initState();
    box = Hive.box('boxkuliah');
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _FormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nama Mata Kuliah'),
          TextFormField(
            controller: _nameController,
            validator: _fieldValidator,
          ),
          SizedBox(height: 24.0),
          Text('Kode Mata Kuliah'),
          TextFormField(
            controller: _kodeController,
            validator: _fieldValidator,
          ),
          SizedBox(height: 24.0),
          Text('Jadwal Mata Kuliah'),
          TextFormField(
            controller: _jadwalController,
            validator: _fieldValidator,
          ),

          Spacer(),
          Padding(
            padding: const
            EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
            child: Container(
              width: double.maxFinite,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  if
                  (_FormKey.currentState!.validate()) {
                    _addInfo();
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Add'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}