import 'package:esc_pos_printer/esc_pos_printer.dart';

void main() {
  // To discover existing printers in your subnet, consider using
  // ping_discover_network package (https://pub.dev/packages/ping_discover_network).
  // Note that most of ESC/POS printers by default listen on port 9100.
  Printer.connect('192.168.0.123', port: 9100).then((printer) {
    printer.println('Regular symbols: aA bB cC dD eE fF gG hH iI jJ kK lL mM nN oO pP qQ rR sS tT uU vV wW xX yY zZ');
    printer.println('Special symbols 1: àÀ èÈ éÉ ûÛ üÜ çÇ ôÔ',
        styles: PosStyles(codeTable: PosCodeTable.westEur));
    printer.println('Special symbols 2: blåbærgrød',
        styles: PosStyles(codeTable: PosCodeTable.westEur));

    printer.println('Bold text', styles: PosStyles(bold: true));
    printer.println('Reverse text', styles: PosStyles(reverse: true));
    printer.println('Underlined text',
        styles: PosStyles(underline: true), linesAfter: 1);
    printer.println('Align left', styles: PosStyles(align: PosTextAlign.left));
    printer.println('Align center',
        styles: PosStyles(align: PosTextAlign.center));
    printer.println('Align right',
        styles: PosStyles(align: PosTextAlign.right), linesAfter: 1);
    printer.printRow([
      PosColumn(
        text: 'col3',
        width: 3,
        styles: PosStyles(align: PosTextAlign.center, underline: true),
      ),
      PosColumn(
        text: 'col6',
        width: 6,
        styles: PosStyles(align: PosTextAlign.center, underline: true),
      ),
      PosColumn(
        text: 'col3',
        width: 3,
        styles: PosStyles(align: PosTextAlign.center, underline: true),
      ),
    ]);
    printer.println('Text size 200%',
        styles: PosStyles(
          height: PosTextSize.size2,
          width: PosTextSize.size2,
        ));

    printer.cut();
    printer.disconnect();
  });
}
