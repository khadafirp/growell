import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

abstract class CurrencyFormatter {
  static String format(double money) {
    var formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 2,
    );

    return formatCurrency.format(money);
  }

  static String formatWithoutDecimal(double money) {
    var formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return formatCurrency.format(money);
  }

  static String formatAndRemoveDecimal(double money) {
    var formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return formatCurrency
        .format(money)
        .replaceAll('Rp', '')
        .replaceAll('.', '')
        .trim();
  }

  static String toFixAmount(String money) {
    return money.replaceAll('Rp ', '').replaceAll('.', '').trim();
  }
}

class InputTextCurrency extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);
    String newText = CurrencyFormatter.format(value);

    return newValue.copyWith(
      text: newText,
      // selection: TextSelection.collapsed(offset: newText.length)
    );
    // return newValue.copyWith(text: CurrencyFormatter.format(double.parse(newValue.text)));
  }
}
