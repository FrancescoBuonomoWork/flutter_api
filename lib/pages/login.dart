import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_api/api/user.dart';
import 'my_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SbLogin extends StatefulWidget {
  const SbLogin({super.key});

  @override
  State<SbLogin> createState() => SbLoginState();
}

class SbLoginState extends State<SbLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _emailError = false; // Variabile per gestire l'errore dell'email
  bool _passwordError = false; // Variabile per gestire l'errore della password
  @override
  void initState() {
    super.initState();
  }

  void _login() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

     // Reset degli errori
    setState(() {
      _emailError = false;
      _passwordError = false;
    });
      // Validazione dell'email
    if (email.isEmpty || email.length < 10 || !email.contains('@')) {
      setState(() {
        _emailError = true; // Imposta l'errore dell'email
      });
      return; // Esci dalla funzione se l'email non è valida
    }
     // Puoi aggiungere qui la logica per la password se necessario
    if (password.isEmpty) {
      setState(() {
        _passwordError = true; // Imposta l'errore della password
      });
      return; // Esci dalla funzione se la password non è valida
    }
    // Qui puoi aggiungere la logica per autenticare l'utente
    // Ad esempio, chiamare un'API per il login
    UserApi userApi = UserApi();
    if (email.length < 1) {}
    Map<String, dynamic>? response = await userApi.login(email, password);
    if (response != null && response['status'] == true) {
      // Login riuscito
      print('Login riuscito: ${response['user']}');
      // qui voglio salvarmi tutto l utente che è un oggetto
      // Salvare l'oggetto utente nel local storage
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', jsonEncode(response['user']));
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  MyHomePage(title: 'ti sei loggato',)),
      );
      // Qui puoi navigare a un'altra schermata o gestire l'utente
    } else {
      // Login fallito
      print('Login fallito');
     // Puoi mostrare un messaggio di errore all'utente
      SnackBar snack = SnackBar(
        showCloseIcon: true,
        duration: Duration(seconds: 3),
        padding: EdgeInsets.all(0),
        content: Container(
          height: 75,
          color: Colors.red,
          child: Center(child: Text('Login fallito')),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
    }

    if (kDebugMode) {
      print('Email: $email, Password: $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration:  InputDecoration(
                labelText: 'Email',
                errorText: _emailError ? 'Email non valida' : null, // Mostra il messaggio di errore
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: _emailError ? Colors.red : Colors.grey, // Bordo rosso se c'è un errore
                  ),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration:  InputDecoration(
                labelText: 'Password',
                errorText: _passwordError ? 'Password non valida' : null, // Mostra il messaggio di errore
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: _passwordError ? Colors.red : Colors.grey, // Bordo rosso se c'è un errore
                  ),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // if (_emailController.text.isEmpty ||
                //     _emailController.text.length < 10 ||
                //     !_emailController.text.contains('@')) {
                //   SnackBar snack = SnackBar(
                //       showCloseIcon: true,
                //       duration: Duration(seconds: 3),
                //       padding: EdgeInsets.all(0),
                //       content: Container(
                //           height: 75,
                //           color: Colors.red,
                //           child: Center(child: Text('errore email'))));
                //   ScaffoldMessenger.of(context).showSnackBar(snack);
                // }
                _login();
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
