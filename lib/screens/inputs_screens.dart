import 'package:flutter/material.dart';
import 'package:parctica_3_flutter/theme/app_theme.dart';

class Inputscreen extends StatefulWidget {
  const Inputscreen({super.key});

  @override
  State<Inputscreen> createState() => _InputscreenState();
}

class _InputscreenState extends State<Inputscreen> {
  bool valueSwitch = false;
  double valueSlider = 0.0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Entradas')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
             Text('Entradas', 
             style: AppTheme.lightTheme.textTheme.headlineLarge,
             ),
            entradaTexto(),
            entradaSwitch(),
            entradaSlide(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: null, 
                  child: Text('Regresar',
                  )
                ),
                 ElevatedButton(
                  onPressed: null, 
                  child: Text('Ir a Data Screen',
                  )
                ),
              ],
            ),
        ],
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
      children: [
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

}