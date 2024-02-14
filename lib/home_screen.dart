import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes de flutter', style: TextStyle(color: Colors.cyan),), 
      ),
        body: ListView(
          children: const [
            ListTile(
              leading: Icon(Icons.boy),
              title: Text('KC campeones de la SB',
                     style: TextStyle(
                     color: Colors.amber, 
                     fontWeight: FontWeight.bold),),
              subtitle: Text('11-02-2024 - Las vegas'),
              trailing: Icon(Icons.arrow_circle_right),
            ),
            Divider(),
            ListTile(
              leading:  Icon(Icons.bolt),
              title: Text('KC campeones de la SB'),
              subtitle: Text('10-02-2023 - Arizona'),
              trailing: Icon(Icons.arrow_circle_right),
            ),
            Divider(),
            ListTile(
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