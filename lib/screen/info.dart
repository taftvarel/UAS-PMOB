import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uas_nomor5/screen/add.dart';
class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() =>
      _InfoScreenState();
}
class _InfoScreenState extends
State<InfoScreen> {
  late final Box contactBox;
  _deleteInfo(int index) {
    contactBox.deleteAt(index);
    print('Item deleted from box at index:$index');
  }
  @override
  void initState() {
    super.initState();
    contactBox = Hive.box('boxkuliah');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Remainder'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddScreen(),
              ),
            ),
        child: Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: contactBox.listenable(),
        builder: (context, Box box, widget) {
          if (box.isEmpty) {
            return Center(
              child: Text('Empty'),
            );
          } else {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                var currentBox = box;
                var jadwalData =
                currentBox.getAt(index)!;

                return InkWell(

                  child: ListTile(
                    title: Text(jadwalData.namaMatkul+"\n"+jadwalData.kodeMatkul
                      , style: TextStyle(
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    subtitle: Text(jadwalData.jadwalMatkul),
                    trailing: IconButton(
                      onPressed: () => _deleteInfo(index),
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}