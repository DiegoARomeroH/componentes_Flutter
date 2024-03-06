import 'package:flutter/material.dart';
import 'package:parctica_3_flutter/theme/app_theme.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
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
      )
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
              'Pug', 
              style: AppTheme.lightTheme.textTheme.headlineMedium
              ),
            ),
          ],
        ),
      ),
    )
    );
  }

  Widget imageWeb() {
    return Center(
      child: Image.network(
        'https://thehappening.com/wp-content/uploads/2022/05/pugs-3.jpg'),
    );
  }

}