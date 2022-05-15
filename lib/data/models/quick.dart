class Quick {
  // Quick have 2 params that
  String text;
  bool confirm;
  Quick({required this.text, required this.confirm});
  factory Quick.fromJson(Map<String, dynamic> json) => Quick(
        text: json['text'],
        confirm: json['confirm'],
      );
  Map<String, dynamic> toJson() => {
        'text': this.text,
        'confirm': this.confirm,
      };
  static List<Quick> fromJsonArray(List<dynamic> JsonParts) {
    List<Quick> parts = [];
    JsonParts.forEach((JsonData) {
      parts.add(JsonData);
    });
    return parts;
  }
}

List<Quick> listQuick = [
  Quick(text: 'Buy a milk', confirm: false),
  Quick(text: 'Buy a shampoo', confirm: false),
  Quick(text: 'Buy a toothbrush', confirm: true)
];
