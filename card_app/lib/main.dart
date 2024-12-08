import 'package:flutter/material.dart';

void main() {
  runApp(const CardApp());
}

class CardApp extends StatefulWidget {
  const CardApp({super.key});

  @override
  _CardAppState createState() => _CardAppState();
}

class _CardAppState extends State<CardApp> {
  // Controladores para los TextFields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController favoriteController = TextEditingController();
  final TextEditingController peopleController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  String name = 'Byron';
  String profession = 'Desarrollador backend';
  String favorite = 'El arte';
  String people = 'Me gusta cocinar';
  String age = 'Tengo 22 años';

  @override
  void dispose() {
    // Liberar los controladores
    nameController.dispose();
    professionController.dispose();
    favoriteController.dispose();
    peopleController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://scontent.fmec1-1.fna.fbcdn.net/v/t39.30808-6/462151584_122179524566090827_2257006351689942659_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=EVyPnHtAgesQ7kNvgFen82i&_nc_zt=23&_nc_ht=scontent.fmec1-1.fna&_nc_gid=AjJIsVhycbLnavR4Zyj-oQn&oh=00_AYAk61OnB6TvWD8K8STYOPnVkS5apw5uahzvD_mmte_e6g&oe=675BD9BF', 
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  name,
                  style: const TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  profession,
                  style: const TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: Colors.white70,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                    height: 20,
                    width: 150,
                    child: Divider(color: Colors.white70)),
                // Cuadros con TextFields para modificar valores
                buildEditableCard(
                  icon: Icons.favorite,
                  label: favorite,
                  controller: favoriteController,
                  onChanged: (value) {
                    setState(() {
                      favorite = value;
                    });
                  },
                ),
                buildEditableCard(
                  icon: Icons.people,
                  label: people,
                  controller: peopleController,
                  onChanged: (value) {
                    setState(() {
                      people = value;
                    });
                  },
                ),
                buildEditableCard(
                  icon: Icons.cake,
                  label: age,
                  controller: ageController,
                  onChanged: (value) {
                    setState(() {
                      age = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                // Campos para modificar el nombre y la profesión
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(
                    controller: nameController,
                 
                    
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget para crear tarjetas editables
  Widget buildEditableCard({
    required IconData icon,
    required String label,
    required TextEditingController controller,
    required Function(String) onChanged,
  }) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: ListTile(
        leading: Icon(icon, color: Colors.purple),
        title: TextField(
          controller: controller..text = label,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          style: const TextStyle(
            color: Colors.purple,
            fontFamily: 'Source Sans Pro',
            fontSize: 16,
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
