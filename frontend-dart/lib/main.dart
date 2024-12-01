import 'dart:html';
import 'dart:convert';
import 'dart:async';
import 'gallery.dart';

void main() {
  // API fetch buttons and response divs
  var fetchButton = querySelector('#fetch-data-btn') as ButtonElement;
  var fetchButton2 = querySelector('#fetch-data-btn2') as ButtonElement;
  var fetchButtonGo = querySelector('#fetch-data-btn-go') as ButtonElement;

  var responseJavaAPI2 = querySelector('#api-responseJavaAPI2') as DivElement;
  var responseJavaAPI1 = querySelector('#api-responseJavaAPI1') as DivElement;
  var responseGo = querySelector('#api-responseGo') as DivElement;

  // Handle API fetch for Java API 1
  fetchButton.onClick.listen((event) async {
    window.console.error('Failed to fetch data from API: ');
    try {
      var response = await HttpRequest.getString('http://localhost:8080/api/java/getTestString');
      var decodedResponse = jsonDecode(response); // Decode JSON response
      responseJavaAPI1.text = 'API Response: ${decodedResponse['message']}';
    } catch (e) {
      responseJavaAPI1.text = 'Failed to fetch data from API: $e';
      window.console.error('Error: $e');
    }
  });

  // Handle API fetch for Java API 2
  fetchButton2.onClick.listen((event) async {
    window.console.error('Failed to fetch data from API: ');
    try {
      var response = await HttpRequest.getString('http://localhost:8080/api/java/getRandomNumber');
      var decodedResponse = jsonDecode(response); // Decode JSON response
      responseJavaAPI2.text = 'API Response: ${decodedResponse['message']} : ${decodedResponse['number']}';
    } catch (e) {
      responseJavaAPI2.text = 'Failed to fetch data from API: $e';
      window.console.error('Error: $e');
    }
  });

  // Handle API fetch for Go API
  fetchButtonGo.onClick.listen((event) async {
    window.console.error('Failed to fetch data from API: ');
    try {
      var response = await HttpRequest.getString('http://localhost:8081/api/go/getHeadOrTails');
      var decodedResponse = jsonDecode(response); // Decode JSON response
      responseGo.text = 'API Response: ${decodedResponse['result']}';
    } catch (e) {
      responseGo.text = 'Failed to fetch data from API: $e';
      window.console.error('Error: $e');
    }
  });

  // List of images for gallery
  List<String> images = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
    'assets/images/7.jpg',
    'assets/images/8.jpg',
  ];

  // Get the gallery container and navigation buttons
  final galleryContainer = querySelector('#photography .gallery') as DivElement;
  final prevButton = querySelector('#prevButton') as ButtonElement;
  final nextButton = querySelector('#nextButton') as ButtonElement;

  // Initialize gallery
  Gallery(
    galleryContainer: galleryContainer,
    prevButton: prevButton,
    nextButton: nextButton,
    images: images,
  );
}
