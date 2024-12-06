import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class EventApi {
  final String _endpoint = "https://webservice.sballando.it";

  Future<List<dynamic>> fetchEvents() async {
    List<dynamic> events = [];
    try {
      http.Response response =
          await http.post(Uri.parse("$_endpoint/api/event/index"));

      if (response.statusCode == 200) {
        dynamic jsonResponse = json.decode(response.body);
        bool status = jsonResponse['status'];

        if (status) {
          // Se ok.. recupera i film
          events = jsonResponse['events'];
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return events;
  }

  Future<Object> fetchEvent(int id_) async {
    Map event = {};
    try {
      // Crea il corpo della richiesta
      final Map<String, String> body = {
        'event_id': id_.toString(), // Passa l'ID dell'evento
      };

      http.Response response = await http.post(
          Uri.parse("$_endpoint/api/event/show"),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(body));

      if (response.statusCode == 200) {
        dynamic jsonResponse = json.decode(response.body);
        bool status = jsonResponse['status'];

        if (status) {
          // Se ok.. recupera i film
          event = jsonResponse['event'];
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return event;
  }
}
