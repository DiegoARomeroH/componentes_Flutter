import 'package:flutter/material.dart';
import 'package:parctica_3_flutter/screens/images_screen.dart';
import 'package:parctica_3_flutter/screens/infinite_list_screen.dart';
import 'package:parctica_3_flutter/screens/inputs_screens.dart';
import 'package:parctica_3_flutter/screens/notifications_screen.dart';
import 'package:parctica_3_flutter/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  int selectedRadioOption = 0; // Para los RadioButton

  void openScreen(int index) {
    setState(() {
      late MaterialPageRoute<dynamic> ruta;
      switch (index) {
        case 0:
          ruta = MaterialPageRoute(builder: (context) => const HomeScreen());
          break;
        case 1:
          ruta = MaterialPageRoute(builder: (context) => const InfiniteList());
          break;
        case 2:
          ruta = MaterialPageRoute(builder: (context) => const NotificationsScreen());
          break;
        case 3:
          ruta = MaterialPageRoute(builder: (context) => const ImagesScreen());
          break;
        default:
          return;
      }
      selectedIndex = index;
      Navigator.push(
        context,
        ruta,
      );
    });
  }
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
                  return const Inputsscreen();
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
              trailing: IconTheme(
                data: AppTheme.lightTheme.iconTheme,
                child: const Icon(Icons.arrow_circle_right),
              ),
              onTap:() {
                final ruta2 = MaterialPageRoute(builder: (context){
                  return const InfiniteList();
                });
                Navigator.push(context, ruta2);
              },
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
        ),
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: Colors.blue, // Cambia AppTheme.maincolor por el color que desees
        onTap: (index) => openScreen(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
            color: AppTheme.maincolor,
            ),
            label: "Inicio"),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_object,
            color: AppTheme.maincolor,
            ),
            label: "Datos"),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add,
            color: AppTheme.maincolor,
            ),
            label: "Notificaciones"),
            BottomNavigationBarItem(
            icon: Icon(Icons.image,
            color: AppTheme.maincolor,
            ),
            label: "Imagenes", 
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app,
            color: AppTheme.maincolor,
            ),
            label: "Salir"),
          ],
          ),
      );
  }
}