import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes de flutter'), 
      ),
        body: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.boy),
              title: Text('KC campeones de la SB',
              style: Theme.of(context).textTheme.headlineLarge,
              ),
              subtitle: const Text('11-02-2024 - Las vegas'),
              trailing: const Icon(Icons.arrow_circle_right),
            ),
            const Divider(),
            const ListTile(
              leading:  Icon(Icons.bolt),
              title: Text('KC campeones de la SB'),
              subtitle: Text('10-02-2023 - Arizona'),
              trailing: Icon(Icons.arrow_circle_right),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('KC campeones de la SB'),
              subtitle: Text('10-02-2023 - California'),
              trailing: Icon(Icons.arrow_circle_right),
            ),
          ],
        ) 
      );
  }
}