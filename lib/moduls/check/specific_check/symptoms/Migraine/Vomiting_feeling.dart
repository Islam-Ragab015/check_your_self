// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:diseases_checker/moduls/check/specific_check/symptoms/Migraine/Phonophobia.dart';
import 'package:diseases_checker/shared/components/constants.dart';
import 'package:flutter/material.dart';

class VomitingFeeling extends StatefulWidget {
  const VomitingFeeling({super.key});

  @override
  _VomitingFeelingState createState() => _VomitingFeelingState();
}

class _VomitingFeelingState extends State<VomitingFeeling> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController VomitingFeelingController = TextEditingController();

  String? _vomitValue;

  final List<String> _vomitOptions = [
    'Yes',
    'No',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: const [
              Center(
                  child: Text(
                "7/22   ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ))
            ],
            title: const Text(
              'Vomiting',
              style: TextStyle(fontSize: 22, color: Colors.green),
            ),
          ),
          body: Form(
            key: _formKey,
            child: Stack(
              children: [
                Positioned.fill(
                    child: Opacity(
                  opacity: 0.4,
                  child: Image.asset(
                    "images/VomitingFeeling.jpg",
                    fit: BoxFit.fill,
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 34),
                      Container(
                        width: double.infinity,
                        height: 60,
                        color: Colors.black12,
                        child: const Center(
                          child: Text(
                            'Vomiting Feeling',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Both vomiting and migraines can be symptoms of various underlying medical conditions, and they are not necessarily related to each other. However, it is possible for some conditions to cause both vomiting and migraines. If you are experiencing both vomiting and migraines, it is important to speak with a healthcare professional to determine the underlying cause of your symptoms and receive appropriate treatment.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1.53,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Do you have Vomit Feeling?',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          DropdownButtonFormField<String>(
                            value: _vomitValue,
                            items: _vomitOptions.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _vomitValue = newValue;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select an option';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Select an option'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40.0),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 65,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BspcList.add(SpcList(name: 'Vomiting', value: _vomitValue.toString() ));

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Phonophobia(),
                                ));
                          } else {
                            return;
                          }
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
