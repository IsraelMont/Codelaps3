// Ejercicio 4 : Asignacion un tipo diferente

Iterable<String> getNameAndAges(Iterable<User> users) {
  // Define una función llamada `getNameAndAges` que toma una Iterable de objetos User.
  // Esta función utiliza el método `map` para transformar cada objeto User en una cadena
  // que contiene su nombre y edad en el formato "nombre es edad".
  return users.map((user) => '${user.name} is ${user.age}');
}

class User {
  final String name;
  final int age;

  // Define una clase llamada User con dos propiedades: `name` y `age`.
  // Estas propiedades son inicializadas por el constructor de la clase.
  User(
    this.name,
    this.age,
  );
}

// El siguiente código se utiliza para proporcionar retroalimentación sobre la solución.
// No es necesario leerlo ni modificarlo.
void main() {
  // Crea una lista de objetos User.
  final users = [
    User('Alice', 21),
    User('Bob', 17),
    User('Claire', 52),
  ];

  try {
    // Llama a la función `getNameAndAges` con la lista de usuarios y convierte
    // el resultado a una lista para su evaluación.
    final out = getNameAndAges(users).toList();
    // Comprueba si el resultado coincide con el esperado y si no, imprime un mensaje de error.
    if (!_listEquals(out, ['Alice is 21', 'Bob is 17', 'Claire is 52'])) {
      print(
        'Looks like `getNameAndAges` is wrong. Keep trying! '
        'The output was: $out',
      );
      return;
    }
  } on UnimplementedError {
    // Captura el error si la función `getNameAndAges` no está implementada.
    print(
      'Tried running `getNameAndAges`, but received an error. '
      'Did you implement the function?',
    );
    return;
  } catch (e) {
    // Captura cualquier otra excepción y muestra un mensaje de error.
    print('Tried running the function, but received an exception: $e');
    return;
  }

  // Imprime un mensaje de éxito si todas las pruebas pasaron.
  print('Success. All tests passed!');
}

// Función de utilidad para comparar dos listas.
bool _listEquals<T>(List<T>? a, List<T>? b) {
  // Verifica si la primera lista es nula; si es así, verifica si la segunda lista también es nula.
  // Si ambas listas son nulas, devuelve true.
  if (a == null) return b == null;
  // Verifica si la segunda lista es nula o si las longitudes de ambas listas son diferentes.
  // Si alguna de estas condiciones es verdadera, las listas no son iguales, por lo que devuelve false.
  if (b == null || a.length != b.length) return false;
  // Itera sobre los elementos de la primera lista.
  for (var index = 0; index < a.length; index += 1) {
    // Compara los elementos en la misma posición en ambas listas.
    // Si encuentra una diferencia, devuelve false.
    if (a[index] != b[index]) return false;
  }
  // Si no se encontraron diferencias entre las listas, devuelve true.
  return true;
}