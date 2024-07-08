import 'package:ticket_mobile/core/enums/enviroment_enum.dart';
import 'package:ticket_mobile/core/helpers/flavour_helper.dart';
import 'package:ticket_mobile/main_app.dart';

void main() {
  Flavour.enviroment = Enviroment.dev;
  mainApp();
}
