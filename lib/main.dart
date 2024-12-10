import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feed de Posts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FeedScreen(),
    );
  }
}

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  // List of sample posts
  final List<Post> posts = [
    Post(author: 'Helena', text: 'Estudando Arquitetura.'),
    Post(author: 'Jefferson', text: 'Hoje estudei Banco de Dados.'),
    Post(author: 'Raissa', text: 'Trabalhando no meu Projeto de Redes'),
  ];

  // Variables for filters
  String? selectedCourse;
  String? selectedSubject;
  String? selectedTopic;

  // Options for the filters
  final List<String> courses = ['Curso A', 'Curso B', 'Curso C'];
  final List<String> subjects = ['Calculo', 'Programação', 'Física'];
  final List<String> topics = ['Arquitetura', 'Banco de Dados', 'Projeto de Redes'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed de Posts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filtros
            Row(
              children: [
                DropdownButton<String>(
                  hint: const Text('Curso'),
                  value: selectedCourse,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCourse = newValue;
                    });
                  },
                  items: courses.map((course) {
                    return DropdownMenuItem<String>(
                      value: course,
                      child: Text(course),
                    );
                  }).toList(),
                ),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  hint: const Text('Disciplina'),
                  value: selectedSubject,
                  onChanged: (newValue) {
                    setState(() {
                      selectedSubject = newValue;
                    });
                  },
                  items: subjects.map((subject) {
                    return DropdownMenuItem<String>(
                      value: subject,
                      child: Text(subject),
                    );
                  }).toList(),
                ),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  hint: const Text('Assunto'),
                  value: selectedTopic,
                  onChanged: (newValue) {
                    setState(() {
                      selectedTopic = newValue;
                    });
                  },
                  items: topics.map((topic) {
                    return DropdownMenuItem<String>(
                      value: topic,
                      child: Text(topic),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Lista de Posts
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      title: Text(post.author),
                      subtitle: Text(post.text),
                    ),
                  );
                },
              ),
            ),
            
            // Botão para criar nova postagem
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de criação de post (por exemplo)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreatePostScreen()),
                );
              },
              child: const Text('Criar Nova Postagem'),
            ),
          ],
        ),
      ),
    );
  }
}

class Post {
  final String author;
  final String text;

  Post({required this.author, required this.text});
}

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Nova Postagem'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Autor'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Texto'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para salvar a nova postagem
                Navigator.pop(context);
              },
              child: const Text('Salvar Postagem'),
            ),
          ],
        ),
      ),
    );
  }
}
