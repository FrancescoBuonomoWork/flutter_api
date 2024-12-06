import 'package:flutter/material.dart';
import 'package:flutter_api/api/event.dart';

class EventShow extends StatefulWidget {
  const EventShow({super.key});

  @override
  State<EventShow> createState() => _EventShow();
}

class _EventShow extends State<EventShow> {
  dynamic event = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      dynamic item = ModalRoute.of(context)!.settings.arguments;
      int id = item['id'];
      _fetchEventDetails(id);
    });
  }

  Future<void> _fetchEventDetails(int id) async {
    // Effettua la fetch dei dettagli dell'evento usando l'ID
    event = await EventApi().fetchEvent(id);
    if (!(event as Map).containsKey("id")) {
      event = null;
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event?['title'] ?? 'Dettagli Evento'),
      ),
      body: event == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.network(
                      "https://webservice.sballando.it/storage/${event['cover']}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    event['title'] ?? 'Nome non disponibile',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    event['datetime_start'] ?? 'datetime_start non disponibile',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    event['description_extended'] ??
                        'Descrizione non disponibile',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
    );
  }
}
