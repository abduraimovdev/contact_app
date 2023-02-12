import 'package:contact/database/contacts.dart';
import 'package:contact/pages/build_screen.dart';
import 'package:contact/pages/introPage.dart';
import 'package:contact/services/additional_service.dart';
import 'package:contact/services/crud_service.dart';

import '../services/io_service.dart';

class ViewContact extends BuildScreen{
  @override
  void build() {
    super.build();
    print("\t\tYour Contacts");
    crud.read(); // Contactlar chiqishi !
    print("\n00 - Back");
    io.console("Id :");
    int command = io.number; // Idni Kiritish !
    if(command == 00) IntroPage();
    if(contacts.containsKey(command)){
      selectContact(command);
    }else{
      print("Bunday Contact Mavjud emas !");//Agar Foyalanuvchi majuda bo'lmasa Qayta kirtish so'rash !
      build();
    }
  }

  void selectContact(int id) {
    print("\t\tSelected Contact \n\n");
    print('''
0 - Back
1 - Delete
2 - Add Favorit
3 - Update
4 - Main Page Back
    ''');
    int command = io.number;
    switch(command) {
      case 0:{
        //Ortga qaytish
        ViewContact();
      } break;
      case 1:{
        //Tanlangan contactni ochirish!
        crud.delete(id);
        ViewContact();
      } break;
      case 2:{
        //Sevimlilarga qo'shish
        additional.addFavorite(id);
        selectContact(id);
      } break;
      case 3:{
        //Contactni Yangilash !
        crud.edit(id);
        selectContact(id);
      } break;
      case 4:{
        // Asosiy Sahifaga qaytish
        IntroPage();
      } break;
      default : {
        // Boshqa qiymat kirtilganda Yana qayta chiqarish !
        selectContact(id);
      }break;
    }
  }
}