
class MoneyUtil {

  static const String YUAN = '¥';

  static String withPrefix(num money) {
    if (money == null) return null;
    return YUAN + money.toString();
  }


}