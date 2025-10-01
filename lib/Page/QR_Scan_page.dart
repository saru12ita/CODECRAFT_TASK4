import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:task4/Widgets/Button_widget.dart'; // your custom button
import '../main.dart';

class QRScanPage extends StatefulWidget {
  @override
  State<QRScanPage> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  String qrCode = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Scan Result',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white54,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              qrCode,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 72),
            ButtonWidget(
              text: 'Start QR scan',
              onClicked: scanQRCode,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> scanQRCode() async {
    String scannedCode;
    try {
      scannedCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // scanner line color
        'Cancel', // cancel button text
        true, // show flash icon
        ScanMode.QR,
      );
    } on PlatformException {
      scannedCode = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      qrCode = scannedCode;
    });
  }
}
