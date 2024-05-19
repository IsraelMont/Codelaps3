// Ejercicio Poniendolo todo junto

// Función que toma una Iterable de Strings y devuelve una Iterable de EmailAddress.
Iterable<EmailAddress> parseEmailAddresses(Iterable<String> strings) {
  // Utiliza el método map para convertir cada String en un EmailAddress utilizando su constructor.
  return strings.map((s) => EmailAddress(s));
}

// Función que verifica si hay alguna dirección de correo electrónico no válida en una Iterable de EmailAddress.
bool anyInvalidEmailAddress(Iterable<EmailAddress> emails) {
  // Utiliza el método any para verificar si al menos una dirección de correo electrónico no es válida.
  // La validación se realiza utilizando la función isValidEmailAddress.
  return emails.any((email) => !isValidEmailAddress(email));
}

// Función que filtra las direcciones de correo electrónico válidas de una Iterable de EmailAddress.
Iterable<EmailAddress> validEmailAddresses(Iterable<EmailAddress> emails) {
  // Utiliza el método where para filtrar solo las direcciones de correo electrónico válidas.
  // La validación se realiza utilizando la función isValidEmailAddress.
  return emails.where((email) => isValidEmailAddress(email));
}

// Clase que representa una dirección de correo electrónico.
class EmailAddress {
  // Atributo que almacena la dirección de correo electrónico.
  final String address;

  // Constructor que inicializa la dirección de correo electrónico.
  EmailAddress(this.address);

  // Sobrescritura del método de igualdad para comparar dos direcciones de correo electrónico.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmailAddress && address == other.address;

  // Sobrescritura del método hashCode para generar un hash único para la dirección de correo electrónico.
  @override
  int get hashCode => address.hashCode;

  // Sobrescritura del método toString para proporcionar una representación legible de la dirección de correo electrónico.
  @override
  String toString() => 'EmailAddress{address: $address}';
}

// Función principal que ejecuta pruebas y proporciona retroalimentación sobre la solución.
void main() {
  // Definición de entradas de ejemplo.
  const input = [
    'ali@gmail.com',
    'bobgmail.com',
    'cal@gmail.com',
  ];

  // Definición de entradas correctas para comparación.
  const correctInput = ['dash@gmail.com', 'sparky@gmail.com'];

  // Función de utilidad para comparar dos listas.
  bool listEquals<T>(List<T>? a, List<T>? b) {
    // Verifica si la primera lista es nula, en cuyo caso devuelve true si la segunda lista también es nula.
    if (a == null) return b == null;
    // Verifica si la segunda lista es nula o si las longitudes de las listas son diferentes, en cuyo caso devuelve false.
    if (b == null || a.length != b.length) return false;
    // Itera a través de los elementos de la primera lista.
    for (var index = 0; index < a.length; index += 1) {
      // Compara los elementos correspondientes de ambas listas.
    // Si encuentra algún par de elementos diferentes, devuelve false.
      if (a[index] != b[index]) return false;
    }
    // Si no se encuentra ninguna diferencia, devuelve true.
    return true;
  }

  // Declaración de variables para almacenar las direcciones de correo electrónico generadas.
  late final Iterable<EmailAddress> emails;
  late final Iterable<EmailAddress> correctEmails;
  try {
    // Intento de generar direcciones de correo electrónico a partir de las entradas de ejemplo.
    emails = parseEmailAddresses(input);
    correctEmails = parseEmailAddresses(correctInput);
    // Verificación de si se recibió una lista vacía como resultado.
    if (emails.isEmpty) {
      print(
        'Tried running `parseEmailAddresses`, but received an empty list.',
      );
      return;
    }
    // Verificación de si las direcciones de correo electrónico generadas coinciden con las esperadas.
    if (!listEquals(emails.toList(), [
      EmailAddress('ali@gmail.com'),
      EmailAddress('bobgmail.com'),
      EmailAddress('cal@gmail.com'),
    ])) {
      print('Looks like `parseEmailAddresses` is wrong. Keep trying!');
      return;
    }
  } on UnimplementedError {
    print(
      'Tried running `parseEmailAddresses`, but received an error. '
      'Did you implement the function?',
    );
    return;
  } catch (e) {
    print(
      'Tried running `parseEmailAddresses`, '
      'but received an exception: $e',
    );
    return;
  }

  try {
    // Verificación de si hay alguna dirección de correo electrónico no válida en la lista generada.
    final out = anyInvalidEmailAddress(emails);
    if (!out) {
      print(
        'Looks like `anyInvalidEmailAddress` is wrong. Keep trying! '
        'The result should be false with at least one invalid address.',
      );
      return;
    }
    // Verificación de si todas las direcciones de correo electrónico en la lista correcta son válidas.
    final falseOut = anyInvalidEmailAddress(correctEmails);
    if (falseOut) {
      print(
        'Looks like `anyInvalidEmailAddress` is wrong. Keep trying! '
        'The result should be false with all valid addresses.',
      );
      return;
    }
  } on UnimplementedError {
    print(
      'Tried running `anyInvalidEmailAddress`, but received an error. '
      'Did you implement the function?',
    );
    return;
  } catch (e) {
    print(
        'Tried running `anyInvalidEmailAddress`, but received an exception: $e');
    return;
  }

  try {
    // Filtrado de las direcciones de correo electrónico válidas de la lista generada.
    final valid = validEmailAddresses(emails);
    // Verificación de si se recibió una lista vacía como resultado.
    if (emails.isEmpty) {
      print('Tried running `validEmailAddresses`, but received an empty list.');
      return;
    }
    // Verificación de si las direcciones de correo electrónico válidas coinciden con las esperadas.
    if (!listEquals(valid.toList(), [
      EmailAddress('ali@gmail.com'),
      EmailAddress('cal@gmail.com'),
    ])) {
      print('Looks like `validEmailAddresses` is wrong. Keep trying!');
      return;
    }
  } on UnimplementedError {
    print(
      'Tried running `validEmailAddresses`, but received an error. '
      'Did you implement the function?',
    );
    return;
  } catch (e) {
    print(
      'Tried running the `validEmailAddresses`, '
      'but received an exception: $e',
    );
    return;
  }

  // Imprime un mensaje de éxito si todas las pruebas pasaron.
  print('Success. All tests passed!');
}

// Función que verifica si una dirección de correo electrónico es válida.
bool isValidEmailAddress(EmailAddress email) {
  // Verifica si la dirección de correo electrónico contiene el símbolo '@'.
  return email.address.contains('@');
}