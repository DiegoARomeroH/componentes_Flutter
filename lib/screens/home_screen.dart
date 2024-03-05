import 'package:flutter/material.dart';
import 'package:parctica_3_flutter/screens/images_screen.dart';
import 'package:parctica_3_flutter/screens/infinite_list_screen.dart';
import 'package:parctica_3_flutter/screens/inputs_screens.dart';
import 'package:parctica_3_flutter/screens/notifications_screen.dart';
import 'package:parctica_3_flutter/theme/app_theme.dart';

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
            leading: IconTheme(
            data: AppTheme.lightTheme.iconTheme,
            child: const Icon (Icons.input_rounded),
            ),
              title: Text('Entradas',
              style: Theme.of(context).textTheme.headlineLarge,
              ),
              subtitle: Text('Diferentes widgets para entradas de flutter', 
              style: AppTheme.lightTheme.textTheme.bodySmall,
              ),
              // trailing: const CircularProgressIndicator(
              //   // value: 0.8,
              //   strokeWidth: 8.0,
              //   color: AppTheme.iconColor,
              //   backgroundColor: Color.fromARGB(255, 0, 234, 255),
              // ),
              trailing: IconTheme(
                data: AppTheme.lightTheme.iconTheme,
                child: const Icon(Icons.arrow_circle_right),
              ),
              onTap:() {
                final ruta1 = MaterialPageRoute(builder: (context){
                  return const Inputscreen();
                });
                Navigator.push(context, ruta1);
              },
            ),
            
            const Divider(),

            ListTile(
            leading: IconTheme(
            data: AppTheme.lightTheme.iconTheme,
            child: const Icon (Icons.list_alt_rounded),
            ),
              title: Text('ListView.builder', 
              style: Theme.of(context).textTheme.headlineLarge
              ),
              subtitle: Text('Scroll infinito',
              style: AppTheme.lightTheme.textTheme.bodySmall,
              ),
              trailing: const Icon(Icons.arrow_circle_right),
              
              onTap:() {
                final ruta2 = MaterialPageRoute(builder: (context){
                  return const InfiniteList();
                });
                Navigator.push(context, ruta2);
              }
            ),
            const Divider(),

            ListTile(
              leading: IconTheme(
              data: AppTheme.lightTheme.iconTheme,
              child: const Icon (Icons.notification_add_outlined),
              ),
              title: Text('Notificaciones',
              style: Theme.of(context).textTheme.headlineLarge
              ),
              subtitle: Text('Creación de noticaciones', 
              style: AppTheme.lightTheme.textTheme.bodySmall,
              ),
              trailing: const Icon(Icons.arrow_circle_right),
              onTap:() {
                final ruta3 = MaterialPageRoute(builder: (context){
                  return const NotificationsScreen();
                });
                Navigator.push(context, ruta3);
              }
            ),
            const Divider(),
            
            ListTile(
              leading: IconTheme(
                data: AppTheme.lightTheme.iconTheme,
                child: const Icon(Icons.image),
              ),
              title: Text(
                'Imágenes',
                style: AppTheme.lightTheme.textTheme.headlineLarge,
                ),
                subtitle: Text('widgets de manejo de imágenes', 
                style: AppTheme.lightTheme.textTheme.bodySmall,
                ),
                
                trailing: const Icon(Icons.arrow_circle_right),
                
              onTap:() {
                final ruta4 = MaterialPageRoute(builder: (context){
                  return const ImagesScreen();
                });
                Navigator.push(context, ruta4);
              }
            ),
          ],
        ) 
      );
  }
}