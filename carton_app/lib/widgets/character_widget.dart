import 'package:flutter/material.dart';
import '../model/character.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;

  const CharacterWidget({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 0, 0),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Row(
        children: [
          // Imagen del personaje
          Image.asset(
            character.image,
            width: 100,
            height: 100,
          ),
          const SizedBox(width: 16.0), // Espacio entre la imagen y el texto
          // Información del personaje
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 255, 250, 250),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  character.jobTitle,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 255, 250, 250),
                  ),
                ),
              ],
            ),
          ),

          // Calificación del personaje (estrellas)
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 122, 0, 170),
              shape: BoxShape.circle,
            ),
            child: Text(
              character.stars.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
