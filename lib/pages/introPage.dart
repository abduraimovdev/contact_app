import 'package:contact/pages/build_screen.dart';
import 'package:contact/pages/view_contact.dart';
import 'package:contact/services/additional_service.dart';
import 'package:contact/services/io_service.dart';
import 'package:contact/services/crud_service.dart';

class IntroPage extends BuildScreen {
  @override
  void build() {
    super.build();
    print("\t\tWelcome To My Contact");
    print('''
0 - Exit
1 - View Contacts
2 - Add Contact
3 - View Favorite
4 - Search Contact
    ''');
    io.console("Select :");
    int command = io.number;

    switch (command) {
      case 0:
        {
          return; // Exit()
        }
      case 1:
        {
          ViewContact();
        }break;
      case 2:
        {
          print("\t\tNew Contact");
          crud.create();
          IntroPage();
        }break;
      case 3:
        {
          additional.viewFavorite();
          IntroPage();
        }
        break;

      case 4:
        {
          additional.searchContact();
          print("Skip ->");
          io.text;
          IntroPage();
        }
        break;

      default:
        {
          IntroPage();
        }
        ;
    }
  }
}
