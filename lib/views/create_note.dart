import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teste/components/dialogs/error_dialogs.dart';
import 'package:teste/services/firestore.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final titleController = TextEditingController();
  final textController = TextEditingController();
  final firestoreService = FirestoreService();
  final user = FirebaseAuth.instance.currentUser!;
  
  void addNote() async {
    try {
      if (textController.text.isNotEmpty && titleController.text.isNotEmpty) {
        await firestoreService.addNote(titleController.text, textController.text, user.uid);
        textController.clear();
        titleController.clear();
        if (!mounted) return; 
        Navigator.pop(context);
      } else {
        genericErrorDialog(context, "Não deixe nenhum campo em branco");
      }  
    } catch (e) {
      if (!mounted) return;
      genericErrorDialog(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/fundo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const Spacer(),
                     Padding(
                      padding: const EdgeInsets.only(right:35, bottom: 0, top: 0),
                      child: TextButton(
                       
                        onPressed: () => addNote(), 
                        child: const Text('Salvar', style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 0, 0, 138)),),
                      ),
                    ),
                  ],
                ),
                // Titulo
                const Text(
                  'Título',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 15, bottom: 10),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(178, 255, 255, 255),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.2,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0)),
                  ),
                ),
            
                // TEXTO
                const Text(
                  'Texto',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.64 ,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 15, bottom: 30),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(178, 255, 255, 255),
                      border: Border.all(
                        color: Colors.black,
                        width: 0.2,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                    controller: textController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10)),
                  ),
                ),
             
              ],
            ),
          ),
        ),
      ),
    );
  }
}
