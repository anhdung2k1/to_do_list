class Quick {
  String text;
  bool confirm;
  Quick({required this.text, required this.confirm});
}

List<Quick> listQuick = [
  Quick(text: 'Buy a milk', confirm: false),
  Quick(text: 'Buy a shampoo', confirm: false),
  Quick(text: 'Buy a toothbrush', confirm: true)
];
