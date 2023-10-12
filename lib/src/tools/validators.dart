validateReferencesPhone(
  String input,
  String personalNumber,
  String toCompared,
  String valueReference,
) {
  String reference =
      input != '' ? input.replaceAll('-', '').replaceAll(" ", "") : ' ';
  String refPersonalNumber =
      personalNumber != "" ? personalNumber.replaceAll(" ", "") : ' ';
  String refToCompared =
      toCompared != "" ? toCompared.replaceAll(" ", "") : ' ';

  if (reference != '' && reference[0] != '3') {
    return '¡Debes ingresar un número válido!';
  }
  if (reference.trim().length != 10) {
    return 'Ingresa un número válido.';
  }
  if (refPersonalNumber != ' ' && refPersonalNumber == reference) {
    return '¡El número no puede ser el mismo número del cliente!';
  }
  if (refToCompared != ' ' && refToCompared == reference) {
    return '¡El número no puede ser el mismo número de la $valueReference!';
  }
  return null;
}
