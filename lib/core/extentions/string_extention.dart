import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';

extension StringEx on String {
  String getDate() {
    try {
      DateTime tempDate = DateFormat("yyyy-MM-dd").parse(this);
      String formattedDate = DateFormat('dd-MM-yyyy', 'pt_PT').format(tempDate);
      return formattedDate;
    } catch (ex) {
      return "";
    }
  }

  String digitValidFormat() {
    return MoneyFormatter(amount: double.tryParse(this) ?? 0).output.nonSymbol;
  }

  String getLongDateFormat() {
    try {
      DateTime tempDate = DateFormat("yyyy-MM-dd").parse(this);
      String formattedDate = DateFormat('MMM. yyyy', 'pt_PT').format(tempDate);
      String datetime = formattedDate.replaceFirst('.', '');
      return datetime[0].toUpperCase() + datetime.substring(1);
    } catch (ex) {
      return "";
    }
  }
}
