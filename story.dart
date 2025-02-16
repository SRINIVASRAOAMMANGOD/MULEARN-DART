import 'dart:io';

void main() {
  print("Enter your personal information:");
  print("Name:");
  String name = stdin.readLineSync()!;

  print("Phone number:");
  String phoneNumber = stdin.readLineSync()!;

  print("Age:");
  String age = stdin.readLineSync()!;

  print("Height:");
  String height = stdin.readLineSync()!;

  print("Weight:");
  String weight = stdin.readLineSync()!;

  print("Address:");
  String address = stdin.readLineSync()!;

  print("Hobbies (comma-separated list):");
  String hobbiesInput = stdin.readLineSync()!;
  List<String> hobbies =
      hobbiesInput.split(',').map((hobby) => hobby.trim()).toList();
  String biodata = '''
    \n
    ***** BIODATA *****
    Name: $name
    Phone Number: $phoneNumber
    Age: $age
    Height: $height
    Weight: $weight
    Address: $address
    Hobbies: ${hobbies.join(', ')}
    ********************
  ''';
  print(biodata);
}
