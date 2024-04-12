// import 'dart:async';

import 'package:bar_code_scanner/presentation/widgets/add_form.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';


class ProductForm extends StatefulWidget {
  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Cadastro de Produtos'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: addform(),
      ),
    );
  }

 
}
