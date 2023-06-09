import 'package:coded_mentor/models/studentlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';

class StudentDetails extends StatefulWidget {
  final Students students;

  const StudentDetails({super.key, required this.students});

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final emailUrl = "mailto:${widget.students.email}";
    double initialRating = widget.students.rating;
    final _controller =
        TextEditingController(text: ("${widget.students.grade}").toString());
    _controller.selection =
        TextSelection.collapsed(offset: _controller.text.length);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.students.name),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 10,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50, left: 50),
                    child: TextField(
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: "Final Grade")),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: ElevatedButton(
                        onPressed: () {
                          widget.students.grade =
                              double.parse(_controller.text);
                          setState(() {});
                        },
                        child: const Text("Save Grade")),
                  ),
                ),
              ]),
              ElevatedButton(
                  onPressed: () => launchUrlString(emailUrl),
                  child: const Text("Send Email To Student")),
              Text("Favorite Snack: ${widget.students.snack}",
                  style: const TextStyle(fontSize: 20)),
              RatingBar.builder(
                initialRating: initialRating,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return const Icon(
                        Icons.sentiment_very_dissatisfied,
                        color: Colors.red,
                      );
                    case 1:
                      return const Icon(
                        Icons.sentiment_dissatisfied,
                        color: Colors.redAccent,
                      );
                    case 2:
                      return const Icon(
                        Icons.sentiment_neutral,
                        color: Colors.amber,
                      );
                    case 3:
                      return const Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.lightGreen,
                      );
                    case 4:
                      return const Icon(
                        Icons.sentiment_very_satisfied,
                        color: Colors.green,
                      );
                    default:
                      return Container();
                  }
                },
                onRatingUpdate: (rating) {
                  widget.students.rating = rating;
                  setState(() {});
                },
                updateOnDrag: true,
                tapOnlyMode: true,
              ),
            ]),
      ),
    );
  }
}
