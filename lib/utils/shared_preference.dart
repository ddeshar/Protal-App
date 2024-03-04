import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenced {
  setUserEmail(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("email", value);
  }

  setUserName(String value) async {
    final prefs = await SharedPreferences.getInstance();
    print(value);
    prefs.setString("name", value);
  }

  Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();

    var email = prefs.getString(
      "email",
    );
    print(email);
    return email;
  }

  Future<String?> getName() async {
    final prefs = await SharedPreferences.getInstance();

    var name = prefs.getString(
      "name",
    );
    return name;
  }

  void saveFormData(String name, String email, String suggestion) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Fetch existing suggestions array from SharedPreferences
    List<String> existingSuggestions = prefs.getStringList('suggestions') ?? [];

    // Create a map for the new suggestion
    Map<String, String> newSuggestion = {
      'name': name,
      'email': email,
      'suggestion': suggestion,
    };

    // Convert the map to a JSON string before storing
    String jsonString = jsonEncode(newSuggestion);

    // Add the new suggestion to the array
    existingSuggestions.add(jsonString);

    // Save the updated array in SharedPreferences
    prefs.setStringList('suggestions', existingSuggestions);
  }

  Future<List<Map<String, String>>> getStoredData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? suggestionStrings = prefs.getStringList('suggestions');
    if (suggestionStrings != null && suggestionStrings.isNotEmpty) {
      List<Map<String, String>> suggestions =
          suggestionStrings.map((suggestion) {
        Map<String, String> map =
            Map<String, String>.from(jsonDecode(suggestion));
        return map;
      }).toList();

      return suggestions;
    } else {
      return [];
    }
  }

  removeEmail() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(
      "email",
    );
    prefs.remove(
      "name",
    );
  }
}
