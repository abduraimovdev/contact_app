import 'package:contact/database/contacts.dart';
import 'package:contact/services/io_service.dart';

final Additional additional = Additional();

class Additional {
  // Seachr Contact ------------------------------
  void searchContact() {
    List<int> searchId = [];
    io.console("Text for Search :");
    String text = io.text;
    var regex = RegExp('${text.toLowerCase()}');
    for(var x in contacts.entries){
      if(regex.hasMatch(x.value.name.toLowerCase())){
        searchId.add(x.key);
      }
      for(var phone in x.value.number.entries){
        if(regex.hasMatch(phone.value)){
          searchId.add(x.key);
        }
      }
    }

    if(searchId.isNotEmpty){
      for(var contact in contacts.entries) {
        for(var id in searchId){
          if(contact.key == id){
            print("----------------------");
            print("${contact.key} : ${contact.value.name}");
            print("Numbers : ${contact.value.number.values}");
          }
        }
      }
    }else {
      print("\n\n\t\tBunday Contact Topilmadi !");
    }
  }
  // Add Favorite Contact --------------------------------
  void addFavorite(int id) {
    if(contacts.containsKey(id)) {
      contacts[id]?.favorite = true;
    }else {
      print("Error Not Fount 404");
    }
  }

  // View Favorite Contacts -------------------------------
  void viewFavorite() {
    int count = 0;
    for(var contact in contacts.entries) {
      if(contact.value.favorite == true){
        count++;
        print("----------------------");
        print("${contact.key} : ${contact.value.name}");
        print("Numbers : ${contact.value.number.values}");
      }
    }
    if(count == 0){
      print("Favorite Not Contacts !");
    }
  }
}