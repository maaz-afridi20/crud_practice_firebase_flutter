import 'package:crudpractice_own/database_services.dart';
import 'package:crudpractice_own/navigationss.dart';
import 'package:crudpractice_own/showdata.dart';

import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController titleC = TextEditingController();
  TextEditingController detailC = TextEditingController();
  TextEditingController collectionC = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Page'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: titleC,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter title';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      maxLines: 7,
                      minLines: 1,
                      controller: detailC,
                      decoration: InputDecoration(
                        labelText: 'Detail',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter details';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: collectionC,
                      decoration: InputDecoration(
                        labelText: 'Collection Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Collection Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 60),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepOrange),
                      ),
                      onPressed: () {
                        // Fluttertoast.showToast(msg: 'You pressed button');
                        if (formkey.currentState!.validate()) {
                          DataBaseServices.addData(
                              titleC.text, detailC.text, collectionC.text);
                          titleC.clear();
                          detailC.clear();
                          collectionC.clear();
                        }
                      },
                      child: const Text(
                        'Add Data',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 60),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepOrange),
                      ),
                      onPressed: () {
                        Navigationss.navigator(
                          context,
                          ShowData(),
                        );
                      },
                      child: const Text(
                        'Show Data',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
