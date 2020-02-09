import 'package:qrscan/qrscan.dart' as scanner;

class ScanService{
  Future<String> scan() async {
    String barcode = await scanner.scan();
    return barcode;
  }
}