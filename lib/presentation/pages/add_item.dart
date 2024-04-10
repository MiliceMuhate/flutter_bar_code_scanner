import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Produtos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductForm(),
    );
  }
}

class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _barcodeController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  List<String> _imageUrls = [];

  // Função para capturar o código de barras
  Future<void> _captureBarcode() async {
    // Aqui você pode implementar a lógica para capturar o código de barras
    // Vou apenas imprimir um exemplo
    String barcode = "123456789"; // Exemplo de código de barras
    _barcodeController.text = barcode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Produtos'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nome do Produto'),
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
                      controller: _barcodeController,
                      decoration: InputDecoration(labelText: 'Código de Barras'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, insira o código de barras';
                        }
                        return null;
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: _captureBarcode,
                  ),
                ],
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Descrição'),
              ),
              TextFormField(
                controller: _quantityController,
                decoration: InputDecoration(labelText: 'Quantidade'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                'Imagens do Produto',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              _buildImageList(),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageList() {
    return Column(
      children: _imageUrls.map((url) {
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Aqui você pode enviar os dados do produto para o backend
      // por exemplo, através de uma requisição HTTP
      // e implementar o código para salvar o produto no banco de dados
      // Aqui vamos apenas imprimir os dados
      print('Nome: ${_nameController.text}');
      print('Código de Barras: ${_barcodeController.text}');
      print('Descrição: ${_descriptionController.text}');
      print('Quantidade: ${_quantityController.text}');
      print('Imagens: $_imageUrls');
    }
  }
}
