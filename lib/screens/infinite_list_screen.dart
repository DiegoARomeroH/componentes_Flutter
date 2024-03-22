import 'package:flutter/material.dart';
import 'package:parctica_3_flutter/screens/home_screen.dart';
import 'package:parctica_3_flutter/screens/images_screen.dart';
import 'package:parctica_3_flutter/screens/notifications_screen.dart';
import 'package:parctica_3_flutter/theme/app_theme.dart';

class InfiniteList extends StatefulWidget {
  const InfiniteList({Key? key}) : super(key: key);

  @override
  State<InfiniteList> createState() => _InfiniteListState();
}

class _InfiniteListState extends State<InfiniteList> {
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
      appBar: AppBar(title: const Text('Lista Infinita')),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Center(
              child: Text('Lista Infinita', 
              ),
            )
          ],
        ),
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
