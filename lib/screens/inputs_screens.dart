import 'package:flutter/material.dart';
import 'package:parctica_3_flutter/theme/app_theme.dart';

class Inputscreen extends StatefulWidget {
  const Inputscreen({super.key});

  @override
  State<Inputscreen> createState() => _InputscreenState();
}

class _InputscreenState extends State<Inputscreen> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
           Text('Entradas', 
           style: AppTheme.lightTheme.textTheme.headlineLarge,
           ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: null, 
                child: Text('Regresar',
                style: AppTheme.lightTheme.textTheme.bodySmall,
                )
              ),
               ElevatedButton(
                onPressed: null, 
                child: Text('Ir a Data Screen',
                style: AppTheme.lightTheme.textTheme.bodySmall,
                )
              ),
            ],
          ),
      ],
    );
  }
}
