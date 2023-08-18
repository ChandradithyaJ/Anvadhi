import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SelectArtForm extends StatefulWidget {
  const SelectArtForm({super.key});

  @override
  State<SelectArtForm> createState() => _SelectArtFormState();
}

class _SelectArtFormState extends State<SelectArtForm> {
  String? selectedArtForm;
  List<Map<String, dynamic>> ArtForms = [];

  void getArtForms() async {
    final CollectionReference artFormsRef = FirebaseFirestore.instance.collection('artForms');
    List<Map<String, dynamic>> allArtForms = [];
    await artFormsRef.get().then((snapshot) {
      List<Map<String, dynamic>> documents = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      allArtForms = documents;
    });
    setState(() {
      ArtForms = [...allArtForms];
    });
  }

  @override
  void initState() {
    super.initState();
    getArtForms();
  }

  final TextEditingController artController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // initialize Dropdown Menu entries
    final List<DropdownMenuEntry<String>> artForms =
    <DropdownMenuEntry<String>>[];

    // sort all art forms lexicographically
    ArtForms.sort((a, b) => a['artName'].compareTo(b['artName']));

    // adding elements to the List of Dropdown Menu Entries
    for (Map<String, dynamic> artFormMap in ArtForms) {
      String artForm = artFormMap['artName'];
      if(artForm.length > 25) artForm = artForm.substring(1, 26) + "...";
      artForms.add(DropdownMenuEntry<String>(
          value: artFormMap['artFormId'].toString(),
          label: artForm
      ));
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 13.0, 0, 0),
      child: DropdownButton(
        hint: Text('Art Form'),
        value: selectedArtForm,
        onChanged: (newVal) {
          setState(() {
            selectedArtForm = newVal.toString();
          });
        },
        items: ArtForms.map((af){
          return DropdownMenuItem(
            child: Text('${af['artName']}'),
            value: af['artName'],
          );
        }).toList(),
      ),
    );
  }
}
