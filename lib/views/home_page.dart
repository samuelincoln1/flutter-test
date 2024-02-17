import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teste/services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final firestoreService = FirestoreService();
  final textController = TextEditingController();


  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void openNoteBox(String? docID) {
    showDialog(
      context: context, 
      builder: (context) =>  AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              if (docID == null) {
                 await firestoreService.addNote(textController.text);
              } else {
                await firestoreService.updateNote(docID, textController.text);
              }
             
              textController.clear();
              if (!mounted) return;
              Navigator.pop(context);
            }, 
            child: const Text('adicionar'),
          ),
        ],
      ),
    );
  }

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => openNoteBox(null),
        backgroundColor: const Color.fromARGB(255, 255, 93, 81),
        child: const Icon(Icons.add),
       
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/fundo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text('Anotações',
                          style: GoogleFonts.lobster(fontSize: 38)),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: signOut,
                      icon: const Icon(Icons.logout),
                    ),
                  ],
                ),
                StreamBuilder(
                stream: firestoreService.getNotesStream(), 
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List notesList = snapshot.data!.docs;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: notesList.length,
                        itemBuilder: ((context, index) { 
                          DocumentSnapshot document = notesList[index];
                          String docID = document.id;
                      
                          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                          String noteText = data['note'];
                          
                          return ListTile(
                            title: Text(noteText),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () => openNoteBox(docID),
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () => firestoreService.deleteNote(docID),
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          );
                      
                        }
                        ),
                      ),
                    );
                  } else {
                    return const Text('Você ainda não possui nenhuma anotação');
                  }
                }
                ),

              ],
            ),
          ),
        ),
        
      ),
    );
  }
}



        