import 'dart:html';
import 'dart:convert';
import 'dart:async';

void main() {
  // Projects data
  List<Map<String, String>> projects = [
    {
      'image': 'assets/images/photo1.jpg',
      'title': 'Project 1',
      'description': 'Description of Project 1.'
    },
    {
      'image': 'assets/images/photo2.jpg',
      'title': 'Project 2',
      'description': 'Description of Project 2.'
    },
    // Add more projects here
  ];

  // Populate projects dynamically
  var projectSection = querySelector('.project-grid');
  if (projectSection != null) {
    projects.forEach((project) {
      var projectDiv = DivElement()
        ..classes.add('project')
        ..appendHtml('''
        <img src="${project['image']}" alt="${project['title']}">
        <p>${project['description']}</p>
      ''');
      projectSection.append(projectDiv);
    });
  } else {
    print('Error: projectSection not found!');
  }

  // Handle contact form submission
  var form = querySelector('#contact-form') as FormElement;
  var messageArea = querySelector('#message-area') as DivElement;

  form.onSubmit.listen((event) async {
    event.preventDefault();

    var name = (querySelector('#name') as InputElement).value ?? '';
    var email = (querySelector('#email') as InputElement).value ?? '';
    var message = (querySelector('#message') as TextAreaElement).value ?? '';

    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      messageArea.text = 'Please fill out all fields!';
      messageArea.style.color = 'red';
      return;
    }

    messageArea.text = 'Thank you for your message, $name!';
    messageArea.style.color = 'green';

    // Send the form data to the Java backend (for demonstration purposes)
    var response = await HttpRequest.request(
      'http://localhost:8080/api/java', // This is your Java backend
      method: 'POST',
      sendData: json.encode({
        'name': name,
        'email': email,
        'message': message,
      }),
      requestHeaders: {'Content-Type': 'application/json'},
    );

    if (response.status == 200) {
      print('Form data sent successfully');
    } else {
      print('Error sending form data');
    }
  });

  // Handle API call when button is clicked
  var fetchButton = querySelector('#fetch-data-btn') as ButtonElement;
  var apiResponseDiv = querySelector('#api-response') as DivElement;

  fetchButton.onClick.listen((event) async {
    print('Error sending form data');
    window.console.error('Failed to fetch data from API: ');

    try {
      var response = await HttpRequest.getString('http://localhost:8080/api/java');
      var decodedResponse = jsonDecode(response);  // Decode JSON response
      apiResponseDiv.text = 'API Response: ${decodedResponse['message']}';
    } catch (e) {
      apiResponseDiv.text = 'Failed to fetch data from API: $e';
      window.console.error('Error: $e');
    }
  });
}
