import 'package:flutter/material.dart';
import 'package:parctica_3_flutter/screens/home_screen.dart';
import 'package:parctica_3_flutter/screens/infinite_list_screen.dart';
import 'package:parctica_3_flutter/screens/notifications_screen.dart';
import 'package:parctica_3_flutter/theme/app_theme.dart';
import 'package:transparent_image/transparent_image.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
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
        title: Text(
          'Imágenes',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
      ),
      body: ListView(
        children:  [
          imageCard(),
          imageWeb(),
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

  Card imageCard(){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      margin: const EdgeInsets.all(20),
      elevation: 10,
      child: SizedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Column(
          children: [
            const Image(
              image: AssetImage('assets/img/pou.jpg'),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
              'Pug Lozano', 
              style: AppTheme.lightTheme.textTheme.headlineMedium
              ),
            ),
          ],
        ),
      ),
    )
    );
  }

  Stack imageWeb() 
  {
    return Stack(
      children: <Widget>[
        const Center(
            child: CircularProgressIndicator(
              backgroundColor: Color.fromARGB(255, 0, 255, 217),
              color: Color.fromARGB(255, 0, 187, 178)
              ),
        ),
        Center(
        child: SizedBox(
          height: 450,
          width: 450,
          child: 
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage, 
            image: 'https://thehappening.com/wp-content/uploads/2022/05/pugs-3.jpg')
          // Imagen de website
          // Image.network(
          
          //   ),
        ),
      ),
      ],
    );
  }

}