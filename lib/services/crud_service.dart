import 'package:contact/database/contacts.dart';
import 'package:contact/models/contact_model.dart';
import 'package:contact/services/io_service.dart';

final Crud crud = Crud();

class Crud {
  // Create Contact  -----------------------------------------------------
  void create() {
    // Enter Name -----------------------------
    io.console("Enter Name :");
    String name = io.text;

    //Email Select -----------------------------
    String? email;
    io.console("Do you want to enter Email (y/n) :");
    String enterEmail = io.text;
    if (enterEmail.toLowerCase() == "y" || enterEmail.toLowerCase() == "yes") {
      io.console("Enter Email :");
      email = io.text;
    }

    // Numbers Add --------------------------------------------------------
    Map<int, String> numbers = {};
    int count = 0;
    while (true) {
      count++;
      io.console("Enter Number :");
      String number = io.text;
      numbers[count] = number;
      io.console("Do you want to add more? (y/n):");
      String yn = io.text;
      if (yn.toLowerCase() == "n" || yn.toLowerCase() == "no") {
        break;
      }
    }

    // Favorite True  and False-----------------------------
    bool favorite = false;
    io.console("Want to add to favorites? (y/n) :");
    String yn = io.text;
    if (yn.toLowerCase() == "y" || yn.toLowerCase() == "yes") {
      favorite = true;
    }

    contacts[contacts.length + 1] =
        Contact(name: name, email: email, number: numbers, favorite: favorite);
    print("\t\tSuccesfully Created");
  }

  // View Contacts -------------------------------------------------------------
  void read() {
    for (var contact in contacts.entries) {
      print("----------------------");
      print("${contact.key} : ${contact.value.name}");
      print("Numbers : ${contact.value.number.values}");
    }
  }

  // Update Contact ------------------------------------------------------------
  void edit(int id) {
    String? name = contacts[id]?.name;
    io.console("Do you want to change your name? (y/n) :");
    String requestName = io.text;
    if (requestName.toLowerCase() == "y" ||
        requestName.toLowerCase() == "yes") {
      io.console("Enter Name for Update :");
      name = io.text;
    }

    String? email = contacts[id]?.email;
    io.console("Do you want to change your email? (y/n) :");
    String requestEmail = io.text;
    if (requestEmail.toLowerCase() == "y" ||
        requestEmail.toLowerCase() == "yes") {
      io.console("Enter Email for Update :");
      email = io.text;
    }

    // Shu idda kep turgan numerlarni Mapga ovolish !
    Map<int, String> numbers = {};
    for (var contact in contacts.entries) {
      if (contact.key == id) {
        numbers = contact.value.number;
      }
    }
    stop:
    while (true) {
      print("\t\tNumbers :");
      for (var number in numbers.entries) {
        print("${number.key} : ${number.value}");
      }

      io.console("Number for Change Id :");
      int numberId = io.number;

      if (numbers.containsKey(numberId)) {
        io.console("Enter Number For Update :");
        String number = io.text;
        numbers[numberId] = number;

        io.console("Do you want to change again? (y/n):");
        String changeAgain = io.text;
        if (changeAgain.toLowerCase() == "n" ||
            changeAgain.toLowerCase() == "no") {
          break stop;
        }
      } else {
        print("Id Not Found");
      }
    }
    contacts[id] = Contact(name: name.toString(), email: email, number: numbers, favorite: contacts[id]?.favorite ?? false);
  }

  // Delete Contact -------------------------------------
  void delete(int id) {
    if (contacts.containsKey(id)) {
      print("Bu ${contacts[id]?.name} Contact o'chirildi !");
      contacts.remove(id);
    } else {
      print("Bunday Contact Majuda emas Yoki qandaydir xatolik yuz berdi !");
    }
  }
}
