class Task
{
  String text, time;
  bool confirm;

  Task({required this.text, required this.time ,
  required this.confirm});
}

List <Task> ListTasks = [
  Task(
    text: "Go fishing with Stephen",
    time: "9.00 am",
    confirm: false,
  ),
  Task(
    text: "Meet according with design team",
    time: "9.00 am",
    confirm: true,
  ),
  Task(
    text: "Go fishing with Stephen",
    time: "9.00 am",
    confirm: false,
  ),
  Task(
    text: "Read the book Zlatan",
    time: "9.00 am",
    confirm: false,
  ),
];
