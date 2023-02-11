import 'package:contact/pages/build_screen.dart';
import 'package:contact/services/io_service.dart';
import 'package:contact/services/crud_service.dart';
class IntroPage extends BuildScreen{
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
    int command = io.number;
    switch(command) {
      case 0: {
        return;
      }break;
      case 1: {
        print("\t\tYour Contacts");
        crud.read();
        IntroPage();
      }break;
      case 2: {
        print("\t\tNew Contact");
        crud.create();
        IntroPage();
      }break;
      case 3: {}break;
      case 4: {}break;
      default : {
        IntroPage();
      };
    }
  }
}