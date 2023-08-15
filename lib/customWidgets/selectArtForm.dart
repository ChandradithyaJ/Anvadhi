import 'package:flutter/material.dart';

class SelectArtForm extends StatefulWidget {
  const SelectArtForm({super.key});

  @override
  State<SelectArtForm> createState() => _SelectArtFormState();
}

class _SelectArtFormState extends State<SelectArtForm> {
  @override
  void initState(){
    super.initState();
  }

  String? selectedArtForm = "Arpit ka GPL";
  List<String> ArtForms = [
    "Kalamkari",
    "Arpit ka GPL",
    "Puppetry",
    "Manjusha Paintings",
  ];

  final TextEditingController artController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // initialize Dropdown Menu entries
    final List<DropdownMenuEntry<String>> artForms =
    <DropdownMenuEntry<String>>[];

    // sort all art forms lexicographically
    ArtForms.sort((a, b) => a.compareTo(b));

    // adding elements to the List of Dropdown Menu Entries
    for (String artForm in ArtForms) {
      if(artForm.length > 25) artForm = artForm.substring(1, 26) + "...";
      artForms.add(DropdownMenuEntry<String>(
          value: artForm,
          label: artForm
      ));
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 13.0, 0, 0),
      child: DropdownMenu<String>(
        initialSelection: "Arpit ka GPL",
        controller: artController,
        enableSearch: true,
        label: const Text('Art Form'),
        dropdownMenuEntries: artForms,
        onSelected: (String? givenArtForm) {
          setState(() {
            selectedArtForm = givenArtForm;
          });
        },
      ),
    );
  }
}
