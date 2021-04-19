const kRequiredField = 'Campo obrigatório';
const kFieldNegative = 'Precisa ser positivo';
const kNumberZero = 'Precisa ser diferente de zero';
double numero;

class ValidatorHelper {
  static String isNotEmptyNumber(String text) {
    if (text.isEmpty) {
      return kRequiredField;
    } else if (text == '0') {
      return kNumberZero;
    } else if (text.contains('-')) {
      return kFieldNegative;
    }
  }
}
