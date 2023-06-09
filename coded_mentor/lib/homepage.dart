import 'package:coded_mentor/models/studentlist.dart';
import 'package:coded_mentor/studentdetails.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController controller = TextEditingController();
  List<Students> filteredStudents = Students.students;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: const Text("Student List"),
              centerTitle: true,
              elevation: 10,
            ),
            body: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      const SizedBox(height: 20),
                      TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                              labelText: "Search",
                              suffixIcon: Icon(Icons.search)),
                          onChanged: searchStudent),
                      const SizedBox(height: 20),
                      Expanded(
                          child: ListView.builder(
                              itemCount: filteredStudents.length,
                              itemBuilder: (context, index) {
                                final student = filteredStudents[index];
                                return SizedBox(
                                    height: 120,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: ((context) {
                                          return StudentDetails(
                                            students: filteredStudents[index],
                                          );
                                        })));
                                      },
                                      child: Card(
                                          elevation: 0,
                                          margin: const EdgeInsets.only(
                                              right: 10, left: 10, top: 5),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(student.name,
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ))
                                              ])),
                                    ));
                              }))
                    ])))));
  }

  void searchStudent(String query) {
    setState(() {
      filteredStudents = Students.students.where((student) {
        final studentName = student.name.toLowerCase();
        final input = query.toLowerCase();
        return studentName.contains(input);
      }).toList();
    });
  }
}
