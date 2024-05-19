bool anyUserUnder18(Iterable<User> users) {
  // Utiliza el método 'any' para verificar si al menos un usuario tiene menos de 18 años.
  return users.any((user) => user.age < 18);
}

bool everyUserOver13(Iterable<User> users) {
  // Utiliza el método 'every' para verificar si todos los usuarios tienen más de 13 años.
  return users.every((user) => user.age > 13);
}

class User {
  final String name;
  final int age;

  // Define una clase User que tiene un nombre y una edad.
  User(
    this.name,
    this.age,
  );
}

// El siguiente código se utiliza para proporcionar comentarios sobre su solución.
// No es necesario leerlo ni modificarlo.
void main() {
  // Crea una lista de usuarios con sus respectivos nombres y edades.
  final users = [
    User('Alice', 21),
    User('Bob', 17),
    User('Claire', 52),
    User('David', 14),
  ];

  try {
    // Verifica si hay al menos un usuario menor de 18 años.
    final out = anyUserUnder18(users);
    if (!out) {
      // Si no hay ningún usuario menor de 18 años, imprime un mensaje de error.
      print('Looks like `anyUserUnder18` is wrong. Keep trying!');
      return;
    }
  } on UnimplementedError {
    // Captura el error si la función anyUserUnder18 aún no está implementada.
    print(
      'Tried running `anyUserUnder18`, but received an error. '
      'Did you implement the function?',
    );
    return;
  } catch (e) {
    // Captura cualquier otra excepción que pueda ocurrir al ejecutar anyUserUnder18.
    print('Tried running `anyUserUnder18`, but received an exception: $e');
    return;
  }

  try {
    // Crea una lista con un solo usuario mayor de 18 años.
    // Debería devolver falso ya que no hay usuarios menores de 18 años.
    final out = anyUserUnder18([User('Alice', 21)]);
    if (out) {
      // Si devuelve verdadero cuando no debería, imprime un mensaje de error.
      print(
          'Looks like `anyUserUnder18` is wrong. What if all users are over 18?');
      return;
    }
  } on UnimplementedError {
    // Captura el error si la función anyUserUnder18 aún no está implementada.
    print(
      'Tried running `anyUserUnder18`, but received an error. '
      'Did you implement the function?',
    );
    return;
  } catch (e) {
    // Captura cualquier otra excepción que pueda ocurrir al ejecutar anyUserUnder18.
    print(
      'Tried running `anyUserUnder18([User("Alice", 21)])`, '
      'but received an exception: $e',
    );
    return;
  }

  try {
    // Verifica si todos los usuarios tienen más de 13 años.
    final out = everyUserOver13(users);
    if (!out) {
      // Si no todos los usuarios tienen más de 13 años, imprime un mensaje de error.
      print(
        'Looks like `everyUserOver13` is wrong. '
        'There are no users under 13!',
      );
      return;
    }
  } on UnimplementedError {
    // Captura el error si la función everyUserOver13 aún no está implementada.
    print(
      'Tried running `everyUserOver13`, but received an error. '
      'Did you implement the function?',
    );
    return;
  } catch (e) {
    // Captura cualquier otra excepción que pueda ocurrir al ejecutar everyUserOver13.
    print(
      'Tried running `everyUserOver13`, '
      'but received an exception: $e',
    );
    return;
  }

  try {
    // Verifica si todos los usuarios tienen más de 13 años en una lista con un solo usuario de 12 años.
    // Debería devolver falso ya que hay al menos un usuario menor de 13 años.
    final out = everyUserOver13([User('Dan', 12)]);
    if (out) {
      // Si devuelve verdadero cuando no debería, imprime un mensaje de error.
      print(
        'Looks like `everyUserOver13` is wrong. '
        'There is at least one user under 13!',
      );
      return;
    }
  } on UnimplementedError {
    // Captura el error si la función everyUserOver13 aún no está implementada.
    print(
      'Tried running `everyUserOver13`, but received an error. '
      'Did you implement the function?',
    );
    return;
  } catch (e) {
    // Captura cualquier otra excepción que pueda ocurrir al ejecutar everyUserOver13.
    print(
      'Tried running `everyUserOver13([User(\'Dan\', 12)])`, '
      'but received an exception: $e',
    );
    return;
  }

  // Si todas las pruebas pasan correctamente, imprime un mensaje de éxito.
  print('Success. All tests passed!');
}
