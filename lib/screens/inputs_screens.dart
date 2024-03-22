import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parctica_3_flutter/screens/data_screen.dart';
import 'package:parctica_3_flutter/screens/home_screen.dart';
import 'package:parctica_3_flutter/screens/images_screen.dart';
import 'package:parctica_3_flutter/screens/notifications_screen.dart';
import 'package:parctica_3_flutter/theme/app_theme.dart';

class Inputsscreen extends StatefulWidget {
  const Inputsscreen({super.key});

  @override
  State<Inputsscreen> createState() => _InputsscreenState();
}

//clase que contiene todos los datos que queremos pasar
class InputData {
  final String nombre;
  final bool gustaFlutter;
  final double sliderValue;
  final int radioOption;
  final bool checkBoxOption1;
  final bool checkBoxOption2;
  final bool checkBoxOption3;

  InputData({
    required this.nombre,
    required this.gustaFlutter,
    required this.sliderValue,
    required this.radioOption,
    required this.checkBoxOption1,
    required this.checkBoxOption2,
    required this.checkBoxOption3,
  });

  @override
String toString() {
  return '''
  Nombre: $nombre
  ¿Te gusta Flutter?: $gustaFlutter
  Valor del slider: $sliderValue
  Opción de radio: $radioOption
  Navegador: $checkBoxOption1
  Emulador: $checkBoxOption2
  Smatphone: $checkBoxOption3
''';
}
}

class _InputsscreenState extends State<Inputsscreen> {
  TextEditingController nombreController = TextEditingController();
  bool valueSwitch = false;
  double valueSlider = 0.0;
  int selectedIndex = 0;
  int selectedRadioOption = 0; //para los Radios Botton
  bool selectedCheckBoxOption1 = false;
  bool selectedCheckBoxOption2 = false;
  bool selectedCheckBoxOption3 = false;
  List screens =[
    const HomeScreen(),
    DataScreen(inputData: InputData( // Aquí se pasa un objeto InputData al crear DataScreen
    nombre: '',
    gustaFlutter: false,
    sliderValue: 0.0,
    radioOption: 0,
    checkBoxOption1: false,
    checkBoxOption2: false,
    checkBoxOption3: false,
    )),
    const NotificationsScreen(),
    const ImagesScreen(),
  ];

  openScreen(int index){
    setState(() {
      MaterialPageRoute ruta= MaterialPageRoute(builder: (context)=> const HomeScreen());
      switch(index){
        case 0:ruta = MaterialPageRoute(builder: (context)=> const HomeScreen());
          break;
        case 1:
          ruta = MaterialPageRoute(
            builder: (context) => DataScreen(inputData: InputData( // Aquí se proporciona el parámetro inputData
              nombre: '',
              gustaFlutter: false,
              sliderValue: 0.0,
              radioOption: 0,
              checkBoxOption1: false,
              checkBoxOption2: false,
              checkBoxOption3: false,
            )),
          );
          break;
        case 2:ruta = MaterialPageRoute(builder: (context)=> const NotificationsScreen());
          break;
        case 3:ruta =MaterialPageRoute(builder: (context)=> const ImagesScreen());
          break;
        case 4:
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
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
      appBar: AppBar(title: const Text('Entradas')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              entradaTexto(),
              entradaSwitch(),
              entradaSlideer(),
              entradasRadio(),
              Text(
                'Que usas para correr tus app de flutter?',style: AppTheme.lightTheme.textTheme.headlineLarge,
                ),
              entradascheck(),
              ElevatedButton(
                onPressed: () {
                  InputData inputData = InputData(
                    nombre: nombreController.text,
                    gustaFlutter: valueSwitch,
                    sliderValue: valueSlider,
                    radioOption: selectedRadioOption,
                    checkBoxOption1: selectedCheckBoxOption1,
                    checkBoxOption2: selectedCheckBoxOption2,
                    checkBoxOption3: selectedCheckBoxOption3,
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataScreen(inputData: inputData),
                    ),
                  );
                },
                child: const Text('Guardar'),
              )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex : selectedIndex,
        backgroundColor: AppTheme.maincolor,
        unselectedItemColor: AppTheme.maincolor,
        onTap: (index) => openScreen(index),
        items: const[
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
        unselectedLabelStyle: AppTheme.lightTheme.textTheme.headlineSmall,
      ),
    );
  }

 TextField entradaTexto() {
  return TextField(
    controller: nombreController, // Agregar el controlador aquí
    style: AppTheme.lightTheme.textTheme.headlineMedium,
    decoration: InputDecoration(
      border: const UnderlineInputBorder(),
      labelText: 'Escribe tu nombre',
      labelStyle: AppTheme.lightTheme.textTheme.headlineLarge,
    ),
  );
}

  Row entradaSwitch(){
    return Row(
      children: <Widget>[
        const FlutterLogo(
          
        ),
        Text('¿Te gusta flutter?', style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        const SizedBox( width: 25.0,),
        Switch(
          value: valueSwitch, 
          onChanged: (value){
            setState(() {
              valueSwitch = value;
            });
        }),
      ],
    );
  }

  Column entradaSlideer(){
    return Column(
      children: [
        Text('¿Que tanto te gusta flutter?', style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        Slider(
          min: 0.0,
          max: 10.0,
          divisions: 10,
          value: valueSlider, 
          activeColor: AppTheme.whiteColor,
          inactiveColor: AppTheme.backColor,
          thumbColor: AppTheme.iconColor,
          label: '${valueSlider.round() }',
          onChanged: (value){
            setState(() {
              valueSlider = value;
              
            });
          })
      ],
    ); 
  }

  Column entradasRadio(){
    return Column(
      children: <Widget>[
        Text('¿Que prefieres usar para desarrollo movil?', style: AppTheme.lightTheme.textTheme.headlineLarge,),
        ListTile(
          title: Text('Kotlin', style: AppTheme.lightTheme.textTheme.headlineMedium,),
          leading: Transform.scale(
            scale: 1.5,
            child: Radio(
              value: 1, 
              groupValue:selectedRadioOption ,
              onChanged: (value){
              setState(() {
                selectedRadioOption = value!;
              });
            },),
          ),
        ),
        ListTile(
          title: Text('flutter', style: AppTheme.lightTheme.textTheme.headlineMedium,),
          leading: Transform.scale(
            scale: 1.5,
            child: Radio(
              value: 2, 
              groupValue:selectedRadioOption ,
              onChanged: (value){
              setState(() {
                selectedRadioOption = value!;
              });
            },),
          ),
        ),

      ],
    );
  }

  Row entradascheck(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Navegador',
          style: AppTheme.lightTheme.textTheme.headlineSmall,
          ),
          Checkbox(
            value: selectedCheckBoxOption1, 
            onChanged: (value){
              setState(() {
                selectedCheckBoxOption1 = value!;
                
              }
            );
          }
        ),
        Text(
          'Emulador',
          style: AppTheme.lightTheme.textTheme.headlineSmall,
          ),
          Checkbox(
            value: selectedCheckBoxOption2, 
            onChanged: (value){
              setState(() {
                selectedCheckBoxOption2 = value!;
                
              }
            );
          }
        ),
        Text(
          'Smartphone',
          style: AppTheme.lightTheme.textTheme.headlineSmall,
          ),
          Checkbox(
            value: selectedCheckBoxOption3, 
            onChanged: (value){
              setState(() {
                selectedCheckBoxOption3 = value!;
                
              }
            );
          }
        ),
      ],
    );
  }
}