import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EcoLog(),
    ),
  );
}

class EcoLog extends StatefulWidget {
  const EcoLog({super.key});

  @override
  State<EcoLog> createState() => _EcoLogState();
}

class _EcoLogState extends State<EcoLog> {
  final List<String> _data = [];
  final TextEditingController _input = TextEditingController();

  @override
  void dispose() {
    _input.dispose();
    super.dispose();
  }

  void _registrar() {
    final texto = _input.text.trim();
    if (texto.isEmpty) return;

    setState(() {
      _data.add(texto);
      _input.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DevOps PoC: Android & Windows"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _input,
              decoration: const InputDecoration(
                labelText: "Nombre del Punto",
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _registrar(),
            ),
          ),
          ElevatedButton(
            onPressed: _registrar,
            child: const Text("Registrar"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(_data[i]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
