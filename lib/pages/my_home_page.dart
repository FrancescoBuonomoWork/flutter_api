import 'package:flutter/material.dart';
import 'package:flutter_api/api/event.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> events = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      // Ha disegnato il primo frame!
      events = await EventApi().fetchEvents();
      if (mounted) {
        setState(() {});
      }
    });
  }

  String baseUrl = 'https://webservice.sballando.it/storage/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: events.isEmpty // Controlla se la lista è vuota
          ? Center(
              child:
                  CircularProgressIndicator(), // Mostra un indicatore di caricamento
            )
          : ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                var event = events[index];
                return InkWell(
                  key: Key('card_$index'),
                  onTap: () {
                    Navigator.pushNamed(context, '/event_show',
                        arguments: {"id": event['id']});
                  },
                  child: Container(
                    width: 400,
                    // height: 250,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4, // Ombra della card
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Aggiungi l'immagine qui
                              Image.network(
                                width: 140,
                                height: 100,
                                baseUrl + event['cover'] ??
                                    'https://picsum.photos/200/300', // URL dell'immagine
                                fit: BoxFit.cover, // Adatta l'immagine
                              ),
                              SizedBox(
                                  height: 8), // Spazio tra immagine e titolo
                              Text(
                                event['title'] ?? 'Nome non disponibile',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                  height: 8), // Spazio tra titolo e descrizione
                              Text(
                                event['description_extended'] ??
                                    'Descrizione non disponibile',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
