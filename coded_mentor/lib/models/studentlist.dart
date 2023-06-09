class Students {
  String name;
  String email;
  double grade;
  String snack;
  double rating;

  static var originalStudents;

  Students(
      {required this.name,
      required this.email,
      required this.grade,
      required this.snack,
      required this.rating});

  static List<Students> students = [
    Students(
        name: "Ahmad K",
        email: "ahmadK@unicode.com",
        grade: 90.5,
        snack: "Fruits",
        rating: 5),
    Students(
        name: "Abdullah F",
        email: "abdullahF@unicode.com",
        grade: 77.8,
        snack: "Candies",
        rating: 3),
    Students(
        name: "Zainab D",
        email: "zainabD@unicode.com",
        grade: 92.1,
        snack: "Juice",
        rating: 5),
    Students(
        name: "Abdullah A",
        email: "abdullahA@unicode.com",
        grade: 87.3,
        snack: "Peanuts",
        rating: 4),
    Students(
        name: "Dana N",
        email: "danaN@unicode.com",
        grade: 96.8,
        snack: "Fruits",
        rating: 5),
    Students(
        name: "Loulwah B",
        email: "loulwahB@unicode.com",
        grade: 84.6,
        snack: "Chips",
        rating: 4),
    Students(
        name: "Sara L",
        email: "saraL@unicode.com",
        grade: 93.7,
        snack: "Candies",
        rating: 5),
    Students(
        name: "Bader A",
        email: "baderA@unicode.com",
        grade: 68.4,
        snack: "Juice",
        rating: 1),
    Students(
        name: "Dana M",
        email: "danaM@unicode.com",
        grade: 81.6,
        snack: "Peanuts",
        rating: 3),
    Students(
        name: "Hamad B",
        email: "hamadB@unicode.com",
        grade: 89.3,
        snack: "Chips",
        rating: 4),
  ];

  static where(Null Function(dynamic Students) param0) {}
}
