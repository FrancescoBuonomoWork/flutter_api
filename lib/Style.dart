import 'dart:ffi';

import 'package:flutter/material.dart';


Widget layout (BuildContext context, Container contenuto) {
  return Material(
    child: Scaffold(
      body: Container(
        color: const Color.fromARGB(222, 236, 233, 233),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 40),
              child: Row(
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          bool posso = Navigator.canPop(context);
                            
                          if( !posso ) return;
                          Navigator.pop(context);
                        }, 
                        icon: Icon(Icons.arrow_back)
                        ),
                    ],
                  ),
                  const Column(
                    children: [
                      Text('sballando',
                       style: TextStyle(
                        fontSize: 24, // Dimensione del font (puoi modificarla come preferisci)
                        fontWeight: FontWeight.bold, // Imposta il peso del font a grassetto
                      ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          
                        }, 
                        icon: Icon(Icons.search)
                        ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          
                        }, 
                        icon: Icon(Icons.notifications)
                        ),
                    ],
                  ),
                  Column(
                    
                    children: [
                      IconButton(
                        onPressed: () {
                          
                        }, 
                        icon: Icon(Icons.person)
                        ),
                    ],
                  )
                ],
                
              ),
            ),
            Expanded(
              child: contenuto
              ),
              Container(
                height: 80,
                color: Colors.white,
                child: Row(
                  children: [
                      Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.wallet),
                          onPressed: () {
                            // Azione per il pulsante Home
                          },
                        ),
                        Text('wallet'),
                        
                      ],
                      
                    ),
                  ),
                    Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.qr_code),
                          onPressed: () {
                            // Azione per il pulsante Home
                          },
                        ),
                        Text('scan'),
                        
                      ],
                      
                    ),
                  ),
                    Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.home),
                          onPressed: () {
                            // Azione per il pulsante Home
                          },
                        ),
                        Text('Home'),
                        
                      ],
                      
                    ),
                  ),
                   Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.create),
                          onPressed: () {
                            // Azione per il pulsante Home
                          },
                        ),
                        Text('crea'),
                        
                      ],
                      
                    ),
                  ),
                   Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.question_mark),
                          onPressed: () {
                            // Azione per il pulsante Home
                          },
                        ),
                        Text('info'),
                        
                      ],
                      
                    ),
                  ),
                  ],
                ),
              )
          ],
        ),
      ),
    ),
  );
}

