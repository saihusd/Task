import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:saihutask1/data/model/notes_model.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {

  var hiveBox = Hive.box<NotesModel>('notesbox');
  TextEditingController notesAdd = TextEditingController();
  List<NotesModel> fullNotes = [];

  addNotes({required String title}){
    print("title : $title");
    final notes = NotesModel(title: title);
    hiveBox.add(notes);

    fullNotes = hiveBox.values.toList();
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fullNotes = hiveBox.values.toList();
    super.initState();
  }

  editNotes({required int index,required String newtext}){

  }

  deleteNotes({required int index}){
    print("index : $index");
    hiveBox.deleteAt(index);
    fullNotes = hiveBox.values.toList();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: notesAdd,
            decoration: InputDecoration(
              hintText: 'add notes',
              suffixIcon:IconButton(
                onPressed: (){
                  addNotes(title: notesAdd.text);
                },icon: Icon(Icons.add),
              )
            ),
          ),
          Text("Saved notes"),
          fullNotes.isNotEmpty ?
          ListView.builder(
            shrinkWrap: true,
              itemCount: fullNotes.length,
              itemBuilder: (BuildContext context,int index){
            return Row(
              children: [
                Text(fullNotes[index].title),
                IconButton(onPressed: (){
                  deleteNotes(index: index);
                }, icon: Icon(Icons.delete)),
                IconButton(onPressed: (){
                  editNotes(index: index, newtext: 'new text $index');
                }, icon: Icon(Icons.edit)),
              ],
            );
          }) : Text("No notes")
        ],
      ),
    );
  }
}
