// this function is responsible for printing the text on the screen
// ignore_for_file: avoid_print, constant_identifier_names

void printer(
  Object? object, {
  bool isDebug = true,
  bool isError = false,
  bool isSuccess = false,
}) {
  // print the object
  if (isDebug) {
    Printer.normal(object);
  } else if (isError) {
    Printer.printError(object);
  } else {
    Printer.printSuccess(object);
  }
}

class Printer {
  // Color codes
  static const String ANSI_RESET = '\u001B[0m';
  static const String ANSI_YELLOW = '\u001B[33m';

  // prints the string with a color specified by the user
  static void printError(Object? text) {
    normal("\n$text\n");
  }

  // this is for printing without a new line
  static void normal(Object? text) {
    print("\n$ANSI_YELLOW$text$ANSI_RESET\n");
  }

  // this is for printing without a new line
  static void printSuccess(Object? text) {
    normal("\n$text\n");
  }
}
