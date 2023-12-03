class Task {
  String name;
  String description;
  DateTime dueDate;

  Task({required this.name, required this.description, required this.dueDate});
}


 List<Task> tasks = [
      Task(
        name: 'Task 1',
        description: 'Description for Task 1',
        dueDate: DateTime(2024, 10, 21),
      ),
      Task(
        name: 'Task 2',
        description: 'Description for Task 2',
        dueDate: DateTime(2024, 11, 25),
      ),
      Task(
        name: 'Task 3',
        description: 'Description for Task 3',
        dueDate: DateTime(2024, 3, 21),
      ),
      Task(
        name: 'Task 4',
        description: 'Description for Task 4',
        dueDate: DateTime(2024, 4, 3),
      ),
      // Add more tasks with due dates here
    ];



    