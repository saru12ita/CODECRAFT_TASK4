import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart'; // Add this
import 'package:task4/main.dart';
import 'package:task4/Widgets/Button_widget.dart'; // Your custom button

class QRCreatePage extends StatefulWidget {
  @override
  _QRCreatePageState createState() => _QRCreatePageState();
}

class _QRCreatePageState extends State<QRCreatePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BarcodeWidget(
                barcode: Barcode.qrCode(),
                data: controller.text.isEmpty ? 'Hello world' : controller.text,
                width: 200,
                height: 200,
                color: Colors.black, // use black for visibility
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(child: buildTextField(context)),
                  SizedBox(width: 12),
                  ButtonWidget(
                    text: 'Generate',
                    onClicked: () => setState(() {}), // rebuild QR
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
        color: Colors.black, // change to black for visibility
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        hintText: 'Enter the data',
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
