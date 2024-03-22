import 'package:flutter/material.dart';
import 'package:parctica_3_flutter/screens/home_screen.dart';
import 'package:parctica_3_flutter/screens/images_screen.dart';
import 'package:parctica_3_flutter/screens/infinite_list_screen.dart';
import 'package:parctica_3_flutter/screens/inputs_screens.dart';
import 'package:parctica_3_flutter/screens/notifications_screen.dart';
import 'package:parctica_3_flutter/theme/app_theme.dart';

class DataScreen extends StatefulWidget {
  final InputData inputData;
  const DataScreen({super.key, required this.inputData});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  int selectedIndex = 0;
  List screens =const [
    HomeScreen(),
    InfiniteList(),
    NotificationsScreen(),
    ImagesScreen(),
  ];

openScreen(int index){
    setState(() {
      MaterialPageRoute ruta= MaterialPageRoute(builder: (context)=> const HomeScreen());
      switch(index){
        case 0:ruta = MaterialPageRoute(builder: (context)=> const HomeScreen());
          break;
        case 1:ruta =MaterialPageRoute(builder: (context)=> const InfiniteList());
          break;
        case 2:ruta = MaterialPageRoute(builder: (context)=> const NotificationsScreen());
          break;
        case 3:ruta =MaterialPageRoute(builder: (context)=> const ImagesScreen());
          break;
    }
      selectedIndex = index;
      Navigator.push(
        context, 
        ruta
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Formulario Recibido', style: AppTheme.lightTheme.textTheme.headlineLarge,),
            Text(widget.inputData.toString(),
            style: const TextStyle(
              fontSize: 30.0,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
           ), // Muestra los datos recibidos
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: const Color.fromARGB(255, 16, 255, 255),
        unselectedItemColor: Colors.black87,
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
            icon: Icon(Icons.image,
            color: AppTheme.maincolor,
            ),
            label: "Salir"),
        ],
        unselectedLabelStyle: const TextStyle(fontSize: 12.0),
      ),
    );
  }
}
