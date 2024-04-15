import 'package:bar_code_scanner/presentation/bloc/acoes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
TextEditingController nameController = TextEditingController();
TextEditingController barcodeController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
TextEditingController quantityController = TextEditingController();
List<String> imageUrls = [];

Widget addform() {
  return Form(
    key: formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Nome do Produto'),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Por favor, insira o nome do produto';
            }
            return null;
          },
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: TextFormField(
                controller: barcodeController,
                decoration: const InputDecoration(labelText: 'Código de Barras'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o código de barras';
                  }
                  return null;
                },
              ),
            ),
            IconButton(
              icon: Image.asset("assets/icons/barcode.png"),
              onPressed: scanCode,
            ),
          ],
        ),
        TextFormField(
          controller: descriptionController,
          decoration: const InputDecoration(labelText: 'Descrição'),
        ),
        TextFormField(
          controller: quantityController,
          decoration: const InputDecoration(labelText: 'Quantidade'),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
        const SizedBox(height: 20.0),
        const Text(
          'Imagens do Produto',
          style: TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 10.0),
        buildImageList(),
        const SizedBox(height: 20.0),
        const ElevatedButton(
          onPressed: submitForm,
          child: Text('Cadastrar'),
        ),
      ],
    ),
  );
}
