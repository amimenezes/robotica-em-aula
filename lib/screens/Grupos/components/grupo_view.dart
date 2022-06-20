// ignore_for_file: deprecated_member_use
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';

class GrupoView extends StatelessWidget {
  const GrupoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View do Grupo',
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
  MyFormState createState() => MyFormState();
}

class MyFormState extends State<MyForm> {
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
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            //'Grupo',
            'Ventilador',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        actions:<Widget>[
          IconButton(
            onPressed: () {

          },
          icon: const Icon(Icons.screen_share, color: Colors.white,))
        ],
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
                    //decoration: const InputDecoration(hintText: 'Ventilador'),
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
                            : Image.asset('assets/imgs/robo_fan.png')),
                  ]),
                ),
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
                              : const Text('Vídeo')),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Amigos no Grupo',
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
                      children: const [
                        Text(
                            //'Total: $simpleIntInput',
                            'Total: 5',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
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
                      children: const [
                        Text(
                            //'Total: $simpleIntInput',
                            'Total: 1',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
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
                const Material(
                  elevation: 12,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  shadowColor: Colors.yellow,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio.' 
                    'Praesent libero. Sed cursus ante dapibus diam. Sed nisi.'
                    'Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.'
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio.' 
                    'Praesent libero. Sed cursus ante dapibus diam. Sed nisi.'
                    'Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum.'
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio.' 
                    'Praesent libero. Sed cursus ante dapibus diam. Sed nisi.'
                    ,
                    // style: TextStyle(height: 5),
                    //minLines: 1,
                    maxLines: null,
                    overflow: TextOverflow.clip,
                    //keyboardType: TextInputType.multiline,
                    // decoration: InputDecoration(
                    //   fillColor: Colors.white,
                    //   filled: true,
                    //   //labelText: 'Insira a Descrição',
                    //   border: OutlineInputBorder(),
                      //hintText: 'Para executar este Grupo vocês precisará dos componentes descritos acima e',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                      
                      // enabledBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.all(Radius.circular(5)),
                      //   borderSide: BorderSide(
                      //     width: 1,
                      //     color: Color.fromARGB(255, 255, 193, 7),
                      //   ),
                      // ),
                    
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      // itemBuilder: (context, _) => const Icon(
                      //   Icons.star,
                      //   color: Colors.amber,
                      // ),
                      onRatingUpdate: (rating) {
                        if (kDebugMode) {
                          print(rating);
                        }
                      },
                      ratingWidget: RatingWidget(
                        full: _image('assets/imgs/heart.png'),
                        half: _image('assets/imgs/heart_half.png'),
                        empty: _image('assets/imgs/heart_border.png'),
                      ), //ratingWidget: null,
                    ),
                  ],
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
                      icon: const Icon(Icons.favorite),
                      label: const Text('Curtir Grupo'),
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

  Widget _image(String asset) {
    return Image.asset(
      asset,
      height: 30.0,
      width: 30.0,
      color: Colors.amber,
    );
  }
}

class FriendTextFields extends StatefulWidget {
  final int index;
  const FriendTextFields(this.index, {Key? key}) : super(key: key);
  @override
  FriendTextFieldsState createState() => FriendTextFieldsState();
}

class FriendTextFieldsState extends State<FriendTextFields> {
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
      _nameController.text = MyFormState.friendsList[widget.index];
    });

    return TextFormField(
      controller: _nameController,
      onChanged: (v) => MyFormState.friendsList[widget.index] = v,
      decoration: const InputDecoration(hintText: 'Enter your friend\'s name'),
      validator: (v) {
        if (v!.trim().isEmpty) return 'Please enter something';
        return null;
      },
    );
  }
}
