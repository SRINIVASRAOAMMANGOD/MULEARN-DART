import 'dart:io';
import 'dart:math';

class PasswordManager {
  final Random _random = Random();

  // Private helper function to generate password
  String _generatePassword(int length, String characters) {
    return List.generate(length, (index) => characters[_random.nextInt(characters.length)]).join();
  }

  // Generate strong password
  String generateStrongPassword() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#\$%^&*()_+[]{}<>?';
    return _generatePassword(12, chars);
  }

  // Generate intermediate password
  String generateIntermediatePassword() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    return _generatePassword(8, chars);
  }

  // Generate low strength password
  String generateLowPassword() {
    const chars = 'abcdefghijklmnopqrstuvwxyz';
    return _generatePassword(6, chars);
  }

  // Validate password strength
  String validateStrength(String password) {
    final hasUpper = password.contains(RegExp(r'[A-Z]'));
    final hasLower = password.contains(RegExp(r'[a-z]'));
    final hasDigit = password.contains(RegExp(r'[0-9]'));
    final hasSpecial = password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));

    if (password.length >= 12 && hasUpper && hasLower && hasDigit && hasSpecial) {
      return 'Strong';
    } else if (password.length >= 8 && hasLower && hasDigit) {
      return 'Intermediate';
    } else {
      return 'Low';
    }
  }
}

void main() {
  final manager = PasswordManager();

  while (true) {
    print('\n--- Password Manager ---');
    print('1. Generate Strong Password');
    print('2. Generate Intermediate Password');
    print('3. Generate Low Strength Password');
    print('4. Validate a Password');
    print('5. Exit');

    stdout.write('Enter your choice: ');
    String? input = stdin.readLineSync();

    if (input == '1') {
      print('Strong Password: ${manager.generateStrongPassword()}');
    } else if (input == '2') {
      print('Intermediate Password: ${manager.generateIntermediatePassword()}');
    } else if (input == '3') {
      print('Low Password: ${manager.generateLowPassword()}');
    } else if (input == '4') {
      stdout.write('Enter password to validate: ');
      String? password = stdin.readLineSync();
      if (password != null) {
        String strength = manager.validateStrength(password);
        print('Password Strength: $strength');
      }
    } else if (input == '5') {
      print('Goodbye!');
      break;
    } else {
      print('Invalid choice. Try again.');
    }
  }
}

