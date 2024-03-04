import 'package:flutter/material.dart';
import 'package:protal_app/utils/shared_preference.dart';

class Suggestion extends StatefulWidget {
  const Suggestion({Key? key}) : super(key: key);

  @override
  State<Suggestion> createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _suggestionCotroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  getUserDetails() async {
    _emailController.text = await SharedPreferenced().getEmail() ?? '';
    _nameController.text = await SharedPreferenced().getName() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggestion Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _emailController,
                  onChanged: (value) {},
                  validator: ((value) {}),
                  style: const TextStyle(
                    color: Colors.black,
                    letterSpacing: .25,
                    fontWeight: FontWeight.w500,
                  ),
                  obscureText: false,
                  enabled: false,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "User Email",
                    errorStyle: const TextStyle(
                      color: Colors.red,
                      wordSpacing: 5.0,
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.green,
                      letterSpacing: 1.3,
                    ),
                    hintStyle: const TextStyle(letterSpacing: 1.3),
                    contentPadding: const EdgeInsets.all(15.0),
                    border: OutlineInputBorder(
                      gapPadding: 0.0,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onTap: (() {}),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _nameController,
                  onChanged: (value) {},
                  validator: ((value) {}),
                  style: const TextStyle(
                    color: Colors.black,
                    letterSpacing: .25,
                    fontWeight: FontWeight.w500,
                  ),
                  obscureText: false,
                  enabled: false,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "User Name",
                    errorStyle: const TextStyle(
                      color: Colors.red,
                      wordSpacing: 5.0,
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.green,
                      letterSpacing: 1.3,
                    ),
                    hintStyle: const TextStyle(letterSpacing: 1.3),
                    contentPadding: const EdgeInsets.all(15.0),
                    border: OutlineInputBorder(
                      gapPadding: 0.0,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onTap: (() {}),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _suggestionCotroller,
                  onChanged: (value) {},
                  validator: ((value) {}),
                  style: const TextStyle(
                    color: Colors.black,
                    letterSpacing: .25,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 10,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Enter your suggestion",
                    errorStyle: const TextStyle(
                      color: Colors.red,
                      wordSpacing: 5.0,
                    ),
                    hintStyle: const TextStyle(
                      color: Colors.green,
                      letterSpacing: 1.3,
                    ),
                    contentPadding: const EdgeInsets.all(15.0),
                    border: OutlineInputBorder(
                      gapPadding: 0.0,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onTap: (() {}),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      SharedPreferenced().saveFormData(
                        _nameController.text,
                        _emailController.text,
                        _suggestionCotroller.text,
                      );
                      _suggestionCotroller.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Suggestion Submitted Successfully'),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 3),
                        ),
                      );

                      // Fetch data again after submission
                      setState(() {});
                    } else {
                      // Handle validation failure
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    child: Text('Submit'),
                  ),
                ),
                FutureBuilder<List<Map<String, String>>>(
                  future: SharedPreferenced().getStoredData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('No data saved yet.');
                    } else {
                      return SizedBox(
                        height: screenHeight * snapshot.data!.length * 0.3,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            var item = snapshot.data![index];
                            return Card(
                              elevation: 4.0,
                              margin: const EdgeInsets.all(16.0),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Suggestion Data #${index + 1}:',
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    ListTile(
                                      title: Text('Name: ${item['name']}'),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Email: ${item['email']}'),
                                          Text(
                                            'Suggestion: ${item['suggestion']}',
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            // Handle delete action
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
