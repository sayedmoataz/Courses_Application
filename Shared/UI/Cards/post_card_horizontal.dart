// ignore_for_file: must_be_immutable, non_constant_identifier_names, unnecessary_brace_in_string_interps, unrelated_type_equality_checks, prefer_const_constructors, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';

class PostCardHorizontalScreen extends StatelessWidget {
  PostCardHorizontalScreen({
    Key? key,
    required this.UniversityName,
    required this.URLUniversityimage,
    required this.NoOfFaculties,
    required this.buttonaction,
    required this.type,
  }) : super(key: key);

  int NoOfFaculties;
  String type;
  String URLUniversityimage;
  String UniversityName;
  Function buttonaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          // University Image
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.network(
              URLUniversityimage,
              height: 200,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),
          Container(
              color: Colors.white10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // University Name
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Text(
                          UniversityName,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      // Faculaties And Students
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            // No. Faculties
                            child: Text(
                              '${NoOfFaculties} ${type}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          // No. Student
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  // button
                  MaterialButton(
                    onPressed: buttonaction(),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          )),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Details",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
