// Implementa el predicado de singleWhere con las sig condiciones
// * El elemento contiene el carácter `'a'`
// * El elemento comienza con el carácter `'M'`

String singleWhere(Iterable<String> items) {
  // Utiliza el método singleWhere para encontrar el primer elemento que cumpla con las condiciones especificadas en el predicado.
  // El predicado es una función anónima que toma un elemento como argumento y devuelve true si cumple con las condiciones, false de lo contrario.
  return items.singleWhere(
  (element) => element.contains('a') && element.startsWith('M'));
}

// El siguiente código se utiliza para proporcionar retroalimentación sobre tu solución.
// No es necesario leerlo ni modificarlo.
void main() {
  // Define una lista de elementos.
  const items = [
    'Salad',
    'Popcorn',
    'Milk',
    'Toast',
    'Sugar',
    'Mozzarella',
    'Tomato',
    'Egg',
    'Water',
  ];

  try {
    // Llama a la función singleWhere con la lista de elementos definida anteriormente.
    final str = singleWhere(items);
    // Verifica si el resultado es el esperado ('Mozzarella').
    if (str == 'Mozzarella') {
      print('Success. All tests passed!');  // Si es el esperado, imprime un mensaje de éxito.
    } else {
      // Si no es el esperado, imprime un mensaje indicando que se recibió un valor diferente al esperado.
      print(
        'Tried calling singleWhere, but received $str instead of '
        'the expected value \'Mozzarella\'',
      );
    }
  } on StateError catch (stateError) {
    // Maneja una excepción de tipo StateError si se produce al llamar a singleWhere.
    // Imprime un mensaje indicando que singleWhere fallará si no se encuentra un único elemento que cumpla con el predicado.
    print(
      'Tried calling singleWhere, but received a StateError: ${stateError.message}. '
      'singleWhere will fail if 0 or many elements match the predicate.',
    );
  } on UnimplementedError {
    // Maneja una excepción de tipo UnimplementedError si singleWhere no está implementado.
    // Imprime un mensaje indicando que la función debe implementarse.
    print(
      'Tried running `singleWhere`, but received an error. '
      'Did you implement the function?',
    );
  } catch (e) {
    // Maneja cualquier otra excepción que pueda ocurrir al llamar a singleWhere.
    // Imprime un mensaje indicando que se recibió una excepción.
    print('Tried calling singleWhere, but received an exception: $e');
  }
}
