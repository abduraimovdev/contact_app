
import 'package:contact/database/contacts.dart';
import 'package:contact/models/contact_model.dart';
import 'package:contact/services/io_service.dart';

final Crud crud = Crud();

class Crud {
  //  -------------------
  void create() {
    // Enter Name -----------------------------
    io.console("Enter Name :");
    String name = io.text;
    
    //Email Select -----------------------------
    String? email;
    io.console("Do you want to enter Email (y/n) :");
    String enterEmail = io.text;
    if(enterEmail.toLowerCase() == "y" || enterEmail.toLowerCase() == "yes"){
      io.console("Enter Email :");
      email = io.text;
    }

    // Numbers Add -----------------------------
    Map<int, String> numbers= {};
    int count = 0;
    while(true){
      count++;
      io.console("Enter Number :");
      String number = io.text;
      numbers[count] = number;
      io.console("Do you want to add more? (y/n):");
      String yn = io.text;
      if(yn.toLowerCase() == "n" || yn.toLowerCase() == "no"){
        break;
      }
    }

    // Favorite True  and False-----------------------------
    bool favorite = false;
    io.console("Want to add to favorites? (y/n) :");
    String yn = io.text;
    if(yn.toLowerCase() == "y" || yn.toLowerCase() == "yes") {
      favorite = true;
    }

    contacts[contacts.length+1] = Contact(name: name, email: email, number: numbers, favorite: favorite);
  }

  // View Contacts -------------------------------------
  void read() {
    for(var contact in contacts.entries) {
      print("----------------------");
      print("${contact.key} : ${contact.value.name}");
      print("Numbers : ${contact.value.number.values}");
    }
  }
  void edit(int id) {}
  void delete(int id) {}
  void searchContact() {}





}