class Member {
  final String name;
  final int index;
  final String avatarPath;
  final String email;
  Member(
      {required this.avatarPath,
      required this.email,
      required this.name,
      required this.index});
  factory Member.fromJson(Map<String, dynamic> json) => Member(
        index: int.parse(json['index']),
        name: json['name'],
        avatarPath: json['avatarPath'],
        email: json['email'],
      );
  static List<Member> fromJsonArray(List<dynamic> JsonParts) {
    List<Member> listMembers = [];
    JsonParts.forEach((JsonData) {
      listMembers.add(Member.fromJson(JsonData));
    });
    return listMembers;
  }
}
