Iterable<User> filterOutUnder21(Iterable<User> users) {
  // Define una función llamada filterOutUnder21 que toma una Iterable de usuarios y filtra aquellos cuya edad sea mayor o igual a 21.
  return users.where((user) => user.age >= 21);
}

Iterable<User> findShortNamed(Iterable<User> users) {
  // Define una función llamada findShortNamed que toma una Iterable de usuarios y filtra aquellos cuyo nombre tenga tres caracteres o menos.
  return users.where((user) => user.name.length <= 3);
}

class User {
  final String name;
  final int age;

  // Define una clase User que tiene dos campos: name (nombre) y age (edad).
  User(
    this.name,
    this.age,
  );
}

// El siguiente bloque de código se utiliza para proporcionar retroalimentación sobre la solución.
// No es necesario leerlo ni modificarlo.
void main() {
  // Se define una lista de usuarios con sus respectivos nombres y edades.
  final users = [
    User('Alice', 21),
    User('Bob', 17),
    User('Claire', 52),
    User('Dan', 12),
  ];

  try {
    // Se prueba la función filterOutUnder21 con la lista de usuarios y se verifica si filtra correctamente los usuarios menores de 21 años.
    final out = filterOutUnder21(users);
    if (out.any((user) => user.age < 21) || out.length != 2) {
      print(
        'Looks like `filterOutUnder21` is wrong, there are '
        'exactly two users with age under 21. Keep trying!',
      );
      return;
    }
  } on UnimplementedError {
    print(
      'Tried running `filterOutUnder21`, but received an error. '
      'Did you implement the function?',
    );
    return;
  } catch (e) {
    print(
      'Tried running `filterOutUnder21`, '
      'but received an exception: ${e.runtimeType}',
    );
    return;
  }

  try {
    // Se prueba la función findShortNamed con la lista de usuarios y se verifica si encuentra correctamente los usuarios con nombres cortos.
    final out = findShortNamed(users);
    if (out.any((user) => user.name.length > 3) || out.length != 2) {
      print(
        'Looks like `findShortNamed` is wrong, there are '
        'exactly two users with a three letter name. Keep trying!',
      );
      return;
    }
  } on UnimplementedError {
    print(
      'Tried running `findShortNamed`, but received an error. '
      'Did you implement the function?',
    );
    return;
  } catch (e) {
    print(
      'Tried running `findShortNamed`, '
      'but received an exception: ${e.runtimeType}',
    );
    return;
  }

  // Se imprime un mensaje indicando que todas las pruebas han pasado correctamente.
  print('Success. All tests passed!');
}