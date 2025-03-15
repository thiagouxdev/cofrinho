import 'package:flutter/material.dart';

class NewCofrinhoView extends StatefulWidget {
  const NewCofrinhoView({super.key});

  @override
  State<NewCofrinhoView> createState() => _NewCofrinhoViewState();
}

class _NewCofrinhoViewState extends State<NewCofrinhoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem vido ao cofrinho'),
      ),
      body: Container(),
    );
  }
}
