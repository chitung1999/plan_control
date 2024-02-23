class Plan {
  String title;
  String time;
  String description;
  bool isCompleted;

  Plan({
    required this.title,
    required this.time,
    required this.description,
    required this.isCompleted
  });

  factory Plan.fromMap(Map<String, dynamic> json) => Plan(
      title: json["title"],
      time: json["time"],
      description: json["description"],
      isCompleted: json["isCompleted"] == 1
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "time": time,
    "description": description,
    "isCompleted": isCompleted
  };
}