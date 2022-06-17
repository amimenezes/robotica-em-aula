// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Componentes do Projeto',
        ),
        backgroundColor: Colors.black54,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // name textfield
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Insira o nome do Projeto'
                  ),
                  validator: (v){
                    if(v!.trim().isEmpty) return 'Por favor, insira algo.';
                    return null;
                  },                  
                ),
                
              ),
              const SizedBox(height: 20,),
              
              const Text(
                'Componentes do Projeto', style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16
                ),
              ),
              ..._getFriends(),
              const SizedBox(height: 40,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.circle_rounded,
                    color: Colors.black54,
                    size: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: const Text(
                      'LED',
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: const Text(
                      '3',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.circle_rounded,
                    color: Colors.black54,
                    size: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: const Text(
                      'Protoboard',
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: const Text(
                      '1',
                    ),
                  ),
                ],
              ),
              FlatButton(
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                  }
                },
                child: 
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.add,
                      color: Colors.black54,
                      size: 16,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: const Text(
                        'Adicionar',
                      ),
                    )
                  ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

  /// get firends text-fields
  List<Widget> _getFriends(){
    List<Widget> friendsTextFields = [];
    for(int i=0; i<friendsList.length; i++){
      friendsTextFields.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              Expanded(child: FriendTextFields(i)),
              const SizedBox(width: 16,),
              // we need add button at last friends row
              _addRemoveButton(i == friendsList.length-1, i),
            ],
          ),
        )
      );
    }
    return friendsTextFields;
  }

  /// add / remove button
  Widget _addRemoveButton(bool add, int index){
    return InkWell(
      onTap: (){
        if(add){
          // add new text-fields at the top of all friends textfields
          friendsList.insert(0, "null");
        }
        else {
          friendsList.removeAt(index);
        }
        setState((){});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon((add) ? Icons.add : Icons.remove, color: Colors.white,),
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
      decoration: const InputDecoration(
        hintText: 'Enter your friend\'s name'
      ),
      validator: (v){
        if(v!.trim().isEmpty) return 'Please enter something';
        return null;
      },
    );
  }
}