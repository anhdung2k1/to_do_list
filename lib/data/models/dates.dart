class Date {
  int day;
  bool isTask;
  bool isMonth;

  Date({required this.day, this.isTask = false, this.isMonth = false});
  factory Date.fromJson(Map<String, dynamic> json) => Date(
        day: json['day'],
        isTask: json['isTask'],
        isMonth: json['isMonth'],
      );
  Map<String, dynamic> toJson() => {
        'day': this.day,
        'isTask': false,
        'isMonth': false,
      };
  static List<Date> fromJsonArray(List<dynamic> JsonParts) {
    List<Date> dates = [];
    JsonParts.forEach((JsonData) {
      dates.add(Date.fromJson(JsonData));
    });
    return dates;
  }
}

List<Date> DataCustom = [
  Date(
    day: 28,
  ),
  Date(
    day: 29,
  ),
  Date(
    day: 30,
    isTask: true,
  ),
  Date(
    day: 31,
  ),
  Date(
    day: 1,
    isMonth: true,
    isTask: true,
  ),
  Date(
    day: 2,
    isMonth: true,
  ),
  Date(
    day: 3,
    isMonth: true,
  ),
  Date(
    day: 4,
    isMonth: true,
  ),
  Date(
    day: 5,
    isMonth: true,
  ),
  Date(
    day: 6,
    isTask: true,
    isMonth: true,
  ),
  Date(
    day: 7,
    isTask: true,
    isMonth: true,
  ),
  Date(
    day: 8,
    isMonth: true,
  ),
  Date(
    day: 9,
    isMonth: true,
  ),
  Date(
    day: 10,
    isMonth: true,
  ),
  Date(
    day: 11,
    isMonth: true,
  ),
  Date(
    day: 12,
    isMonth: true,
  ),
  Date(
    day: 13,
    isMonth: true,
  ),
  Date(
    day: 14,
    isTask: true,
    isMonth: true,
  ),
  Date(
    day: 15,
    isTask: true,
    isMonth: true,
  ),
  Date(
    day: 16,
    isMonth: true,
  ),
  Date(
    day: 17,
    isMonth: true,
  ),
  Date(
    day: 18,
    isMonth: true,
  ),
  Date(
    day: 19,
    isMonth: true,
  ),
  Date(
    day: 20,
    isMonth: true,
  ),
  Date(
    day: 21,
    isMonth: true,
  ),
  Date(
    day: 22,
    isMonth: true,
    isTask: true,
  ),
  Date(
    day: 23,
    isMonth: true,
  ),
  Date(
    day: 24,
    isMonth: true,
  ),
  Date(
    day: 25,
    isMonth: true,
  ),
  Date(
    day: 26,
    isMonth: true,
  ),
  Date(
    day: 27,
    isMonth: true,
  ),
  Date(
    day: 28,
    isMonth: true,
  ),
  Date(
    day: 29,
    isMonth: true,
  ),
  Date(
    day: 30,
    isMonth: true,
  ),
  Date(
    day: 31,
    isMonth: true,
    isTask: true,
  ),
  Date(
    day: 1,
  ),
  Date(
    day: 2,
  ),
];
