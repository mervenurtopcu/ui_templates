//okul-not
//rolü sadece öğretmen(1) olan kişiler öğrencilerin notlarını görüntüleyip işlem yapabilir.

class StudentsManager<T extends Teacher> {
  final T teacher;

  StudentsManager(this.teacher);

  int calculateNotes(List<User> users) {
    int initialValue = teacher.role == 1 ? teacher.note:0;

    final _note= users.fold(initialValue, (previousValue, element) => previousValue+element.note);

    return _note;

  }
}

class User {
  final String name;
  final int note;

  User(this.name, this.note);
}

class Teacher extends User {
  Teacher( String name, int note, this.role):super(name,note);

  final int role; //1 teacher 2 students
}
