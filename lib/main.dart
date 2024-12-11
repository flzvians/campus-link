import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Central de Comunicação',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed de Posts'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                PostCard(author: 'Helena', text: 'Estudando Arquitetura.'),
                PostCard(author: 'Jefferson', text: 'Hoje estudei Banco de Dados.'),
                PostCard(author: 'Raissa', text: 'Trabalhando no meu Projeto de Redes.'),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreatePostScreen()),
              );
            },
            child: const Text('Criar Nova Postagem'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MateriaisCompartilhadosScreen(),
                ),
              );
            },
            child: const Text('Ir para Materiais Compartilhados'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AvaliacaoScreen(),
                ),
              );
            },
            child: const Text('Avaliação de Disciplinas e Professores'),
          ),
        ],
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String author;
  final String text;

  const PostCard({required this.author, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(author),
        subtitle: Text(text),
      ),
    );
  }
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
                Navigator.pop(context);  // Volta para a tela anterior
              },
              child: const Text('Salvar Postagem'),
            ),
          ],
        ),
      ),
    );
  }
}

class MateriaisCompartilhadosScreen extends StatelessWidget {
  const MateriaisCompartilhadosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materiais Compartilhados'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Ação para upload de arquivos
              },
              child: const Text('Upload de Arquivos'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Categorias',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            CategoriaItem(nome: 'Provas'),
            CategoriaItem(nome: 'Resumos'),
            CategoriaItem(nome: 'Livros'),
          ],
        ),
      ),
    );
  }
}

class CategoriaItem extends StatelessWidget {
  final String nome;

  const CategoriaItem({required this.nome, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          nome,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class AvaliacaoScreen extends StatefulWidget {
  const AvaliacaoScreen({super.key});

  @override
  _AvaliacaoScreenState createState() => _AvaliacaoScreenState();
}

class _AvaliacaoScreenState extends State<AvaliacaoScreen> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avaliação de Disciplinas e Professores'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Selecione a disciplina/professor',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedOption,
              items: const [
                DropdownMenuItem(value: 'Disciplina 1', child: Text('Disciplina 1')),
                DropdownMenuItem(value: 'Disciplina 2', child: Text('Disciplina 2')),
                DropdownMenuItem(value: 'Professor 1', child: Text('Professor 1')),
                DropdownMenuItem(value: 'Professor 2', child: Text('Professor 2')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
              },
              hint: const Text('Selecione uma opção'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Sistema de Avaliação',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const RatingBar(),
            const SizedBox(height: 20),
            const Text(
              'Avaliações existentes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  FeedbackCard(author: 'Aluno A', text: 'Ótima disciplina!'),
                  FeedbackCard(author: 'Aluno B', text: 'Professor muito bom.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeedbackCard extends StatelessWidget {
  final String author;
  final String text;

  const FeedbackCard({required this.author, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(author),
        subtitle: Text(text),
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  const RatingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          color: Colors.amber,
        );
      }),
    );
  }
}
