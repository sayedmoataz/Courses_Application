// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';

class PostCardScreen extends StatelessWidget {
  PostCardScreen({
    Key? key,
    required this.UniversityName,
    required this.URLUniversityimage,
    required this.NoOfFaculties,
    required this.nostudent,
    required this.buttonaction,
  }) : super(key: key);

  int NoOfFaculties;
  String URLUniversityimage;
  String UniversityName;
  int nostudent;
  Function buttonaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          // University Image
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.network(
                URLUniversityimage,
                height: 100,
                fit: BoxFit.contain,
                width: 100.0,
              ),
            ),
          ),
          const Spacer(),
          // Info
          Container(
            color: Colors.purple,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // University Name
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    UniversityName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Faculaties And Students
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  // No. Faculties
                  child: Text(
                    '$NoOfFaculties Faculties',
                  ),
                ),
                // No. Student
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  // No. Faculties
                  child: Text(
                    '$nostudent Students',
                  ),
                ),
                MaterialButton(
                  onPressed: buttonaction(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "Details",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
