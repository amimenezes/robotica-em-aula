// ignore_for_file: deprecated_member_use
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quantity_input/quantity_input.dart';
import 'package:image_picker/image_picker.dart';

class ProjetoUpdate extends StatelessWidget {
  const ProjetoUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes do Projeto',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  static List<String> friendsList = [];
  File? imageURI;
  int simpleIntInput = 0;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  getImageFromCamera() async {
    PickedFile? pickedImage = (await ImagePicker()
        .pickImage(source: ImageSource.camera)) as PickedFile?;
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      imageURI = pickedImageFile;
    });
  }

  getImageFromGallery() async {
    PickedFile? pickedImage = (await ImagePicker()
        .pickImage(source: ImageSource.gallery)) as PickedFile?;
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      imageURI = pickedImageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Atualizar Projeto',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 193, 7),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: TextFormField(
                    controller: _nameController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        hintText: 'Insira o nome do Projeto'),
                    validator: (v) {
                      if (v!.trim().isEmpty) {
                        return 'Por favor, insira um nome.';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(children: [
                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 150,
                        color: Colors.grey[300],
                        child: imageURI != null
                            ? Image.file(
                                imageURI!,
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              )
                            : const Text('Selecione uma imagem.')),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          getImageFromGallery();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 255, 193, 7),
                          shadowColor: Colors.transparent,
                          shape: const CircleBorder(),
                        ),
                        //child: const Text('Imagem Galeria'),
                        child: const Icon(
                          Icons.add_a_photo,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    )
                  ]),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 32.0),
                //   child: TextFormField(
                //     controller: _nameController,
                //     textAlign: TextAlign.center,
                //     decoration: const InputDecoration(
                //       hintText: 'Insira uma imagem do Projeto',
                //       prefixIcon: Padding(
                //         padding: EdgeInsets.symmetric(),
                //         child: Icon(Icons.photo_camera),
                //       ),
                //     ),
                //     validator: (v) {
                //       if (v!.trim().isEmpty){
                //         return 'Por favor, insira uma imagem.';
                //       }
                //       return null;
                //     },
                //   ),
                // ),
                const SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 150,
                          color: Colors.grey[300],
                          child: imageURI != null
                              ? Image.file(
                                  imageURI!,
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                )
                              : const Text('Selecione um vídeo.')),
                      TextFormField(
                        controller: _nameController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: 'Insira uma URL do vídeo',
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(),
                            child: Icon(Icons.ondemand_video_rounded),
                          ),
                        ),
                        validator: (v) {
                          if (v!.trim().isEmpty) {
                            return 'Por favor, insira uma URL.';
                          }
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            getImageFromGallery();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 255, 193, 7),
                            shadowColor: Colors.transparent,
                            shape: const CircleBorder(),
                            //primary: Colors.transparent,
                            //shadowColor: Colors.transparent.withOpacity(0.5),
                            // shape: const CircleBorder(
                            //   side: BorderSide(
                            //     color: Colors.black,
                            //   )
                            // ),
                          ),
                          child: const Icon(
                            Icons.ondemand_video,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Componentes do Projeto',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                ..._getFriends(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'LED',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        QuantityInput(
                          buttonColor: Colors.black,
                          minValue: 0,
                          value: simpleIntInput,
                          onChanged: (value) => setState(
                            () => simpleIntInput =
                                int.parse(value.replaceAll(',', '')),
                          ),
                        ),
                        // Text(
                        //   'Total: $simpleIntInput',
                        //   style: const TextStyle(
                        //     color: Colors.black,
                        //     fontWeight: FontWeight.bold
                        //   )
                        // ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.black54,
                      size: 24,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Protoboard',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        QuantityInput(
                          buttonColor: Colors.black,
                          minValue: 0,
                          value: simpleIntInput,
                          onChanged: (value) => setState(
                            () => simpleIntInput =
                                int.parse(value.replaceAll(',', '')),
                          ),
                        ),
                        // Text(
                        //   'Total: $simpleIntInput',
                        //   style: const TextStyle(
                        //     color: Colors.black,
                        //     fontWeight: FontWeight.bold
                        //   )
                        // ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.black54,
                      size: 24,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),

                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Nome do Item',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        QuantityInput(
                          buttonColor: Colors.black,
                          minValue: 0,
                          value: simpleIntInput,
                          onChanged: (value) => setState(
                            () => simpleIntInput =
                                int.parse(value.replaceAll(',', '')),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.add_circle,
                      color: Colors.black,
                      size: 24,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Descrição',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  style: TextStyle(height: 5),
                  minLines: 1,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      //contentPadding: EdgeInsets.symmetric(vertical: 10),
                      labelText: 'Insira a Descrição',
                      border: OutlineInputBorder(),
                      hintText: 'Insira a Descrição...',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Color.fromARGB(255, 255, 193, 7),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.redAccent,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 255, 193, 7),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Atualizar Projeto'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// get firends text-fields
  List<Widget> _getFriends() {
    List<Widget> friendsTextFields = [];
    for (int i = 0; i < friendsList.length; i++) {
      friendsTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Expanded(child: FriendTextFields(i)),
            const SizedBox(
              width: 16,
            ),
            // we need add button at last friends row
            _addRemoveButton(i == friendsList.length - 1, i),
          ],
        ),
      ));
    }
    return friendsTextFields;
  }

  /// add / remove button
  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          // add new text-fields at the top of all friends textfields
          friendsList.insert(0, "null");
        } else {
          friendsList.removeAt(index);
        }
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}

class FriendTextFields extends StatefulWidget {
  final int index;
  const FriendTextFields(this.index, {Key? key}) : super(key: key);
  @override
  _FriendTextFieldsState createState() => _FriendTextFieldsState();
}

class _FriendTextFieldsState extends State<FriendTextFields> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text = _MyFormState.friendsList[widget.index];
    });

    return TextFormField(
      controller: _nameController,
      onChanged: (v) => _MyFormState.friendsList[widget.index] = v,
      decoration: const InputDecoration(hintText: 'Enter your friend\'s name'),
      validator: (v) {
        if (v!.trim().isEmpty) return 'Please enter something';
        return null;
      },
    );
  }
}
