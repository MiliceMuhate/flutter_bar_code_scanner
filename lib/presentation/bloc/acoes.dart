import 'package:bar_code_scanner/presentation/widgets/add_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

String scannerResult = '';

//scan function
Future<void> scanCode() async {
  String barCodeResult;
  try {
    barCodeResult = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "cancelar", true, ScanMode.BARCODE);
  } on PlatformException {
    barCodeResult = 'Falha ao Scanear';
  }
  scannerResult = barCodeResult;
}

 Widget buildImageList() {
    return Column(
      children: imageUrls.map((url) {
        return Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Image.network(
            url,
            height: 100.0,
            width: 100.0,
          ),
        );
      }).toList(),
    );
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      // Aqui você pode enviar os dados do produto para o backend
      // por exemplo, através de uma requisição HTTP
      // e implementar o código para salvar o produto no banco de dados
      // Aqui vamos apenas imprimir os dados
      print('Nome: ${nameController.text}');
      print('Código de Barras: ${barcodeController.text}');
      print('Descrição: ${descriptionController.text}');
      print('Quantidade: ${quantityController.text}');
      print('Imagens: $imageUrls');
    }
  }

  