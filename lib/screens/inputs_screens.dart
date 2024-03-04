import 'package:flutter/material.dart';
import 'package:parctica_3_flutter/theme/app_theme.dart';

class Inputscreen extends StatefulWidget {
  const Inputscreen({super.key});

  @override
  State<Inputscreen> createState() => _InputscreenState();
}

class _InputscreenState extends State<Inputscreen> {
  bool valueSwitch = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  double valueSlider = 0.0;
  int selectedIndex = 0;
  int selectedRadioOption = 0; // para los RadioButtons
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Entradas')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              entradaTexto(),
              entradaSwitch(),
              entradaSlide(),
              entradaRadio(),
              Text(
                '¿Qué usas para correr tus apps de Flutter?',
                style: AppTheme.lightTheme.textTheme.headlineLarge,
              ),
              entradaCheck(),
              const ElevatedButton(
               onPressed: null, 
               child: Text(
                 'Guardar',
               )
                                ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: AppTheme.maincolor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
            color: AppTheme.whiteColor,
            ),
            label: "Inicio"),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_object,
            color: AppTheme.whiteColor,
            ),
            label: "Datos"),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app,
            color: AppTheme.whiteColor,
            ),
            label: "Salir"),
          ],
          unselectedLabelStyle: AppTheme.lightTheme.textTheme.bodyMedium,
        ),
    );
  }

  TextField entradaTexto() {
    return TextField(
            style: AppTheme.lightTheme.textTheme.headlineLarge,
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: 'Escribe tu nombre:',
              labelStyle: AppTheme.lightTheme.textTheme.headlineLarge,
            ),
           );
  }

  Row entradaSwitch(){
    return Row(
      children: <Widget>[
        const FlutterLogo(),
        Text(
          '¿Te gusta Flutter?',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        const SizedBox(
          width: 25.0,
          
        ),
        Switch(
        value: valueSwitch,
        onChanged: (value) {
          setState(() {
            valueSwitch = value;
            print('Estado del switch: $valueSwitch');
            });
          },
        )
      ],
    );
  }

  Column entradaSlide(){
    return Column(
     children: [
      Text('¿Qué tanto te gusta Flutter?',
      style: AppTheme.lightTheme.textTheme.headlineLarge,
      ),
      Slider(
       min: 0.0,
       max: 10.0, 
       value: valueSlider,
       activeColor: AppTheme.iconColor,
       inactiveColor: AppTheme.backColor,
       thumbColor: AppTheme.whiteColor,
       divisions: 10,
       label: '${valueSlider.round()}',
       onChanged: (value){
        setState(() {
          valueSlider = value;
          print('Valor del Slider: $valueSlider');
        });
       }
       ),
    ],
  );
  }
  
  Column entradaRadio(){
    return Column(
      children: [
        Text(
          '¿Que prefieres usar para desarrollo móvil?',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        ListTile(
          title: Text(
            'Kotlin',
            style: AppTheme.lightTheme.textTheme.headlineMedium,
          ),
          leading: Transform.scale(
            scale: 1.5,
            child: Radio(
              value: 1,
              groupValue: selectedRadioOption,
              onChanged: (value){
                setState(() {
                  selectedRadioOption = value!;
                  print('Opción Seleccionada: $selectedRadioOption');
                });
              },
            ),
          ),
        ),
        ListTile(
          title: Text(
            'Flutter',
            style: AppTheme.lightTheme.textTheme.headlineMedium,
          ),
          leading: Transform.scale(
            scale: 1.5,
            child: Radio(
              value: 2,
              groupValue: selectedRadioOption,
              onChanged: (value){
                setState(() {
                  selectedRadioOption = value!;
                  print('Opción Seleccionada: $selectedRadioOption');
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Row entradaCheck(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Navegador',
          style: AppTheme.lightTheme.textTheme.headlineMedium,
        ),
        Checkbox(value: isChecked1, 
        onChanged: (value){
          setState(() {
            isChecked1 = value!;
            print('Valor del Navegador: $isChecked1');
          });
        }),
         Text(
          'Emulador',
          style: AppTheme.lightTheme.textTheme.headlineMedium,
        ),
        Checkbox(value: isChecked2, 
        onChanged: (value){
          setState(() {
            isChecked2 = value!;
            print('Valor del Emulador: $isChecked2');
          });
        }),
         Text(
          'Smartphone',
          style: AppTheme.lightTheme.textTheme.headlineMedium,
        ),
        Checkbox(value: isChecked3, 
        onChanged: (value){
          setState(() {
            isChecked3 = value!;
            print('Valor de Smartphone: $isChecked3');
          });
        })
      ],
    );
  }
}