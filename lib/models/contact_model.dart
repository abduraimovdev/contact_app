class Contact implements Comparable<Contact> {
  String name;
  String? email;
  Map<int, String> number;
  bool favorite;
  String date;
  Contact({
    required this.name,
    this.email,
    required this.number,
    this.favorite = false,
  }): date = DateTime.now().toString();

  @override
  int compareTo(Contact other) {
    return name.compareTo(other.name);
  }
}
