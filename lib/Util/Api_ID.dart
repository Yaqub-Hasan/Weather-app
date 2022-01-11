import 'package:intl/intl.dart';

class Api_ID{
  static String key="328a6c9ede634d90f917df9371ddb6dc";

  static String getDate(DateTime){
    return new DateFormat('EEEE, MMM d, y').format(DateTime);
  }
}