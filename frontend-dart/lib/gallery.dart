import 'dart:html';
import 'dart:async';

class Gallery {
  final List<String> images;
  int currentIndex = 0;

  final DivElement galleryContainer;
  final ButtonElement prevButton;
  final ButtonElement nextButton;

  Gallery({
    required this.galleryContainer,
    required this.prevButton,
    required this.nextButton,
    required this.images,
  }) {
    _initialize();
  }

  // Initialize gallery, create image elements and set up event listeners
  void _initialize() {
    _createImageElements();
    _setupNavigationButtons();
    _startAutoSlide();
  }
// Create image elements and append to the gallery container
void _createImageElements() {
  galleryContainer.innerHtml = ''; // Clear existing elements
  for (int i = 0; i < 2; i++) {
    final imageIndex = (currentIndex + i) % images.length;
    
    // Create a new image element
    final imageElement = DivElement()
      ..className = 'photo'
      ..id = 'photo-${imageIndex + 1}';
    
    final img = ImageElement(src: images[imageIndex])
      ..alt = 'Photo ${imageIndex + 1}' // Set the alt property separately
      ..style.width = '600px'
      ..style.height = '500px';
    
    // Add an event listener to enlarge image on click
    img.onClick.listen((event) {
      _enlargeImage(images[imageIndex]);
    });
    
    // Append the image element to the div
    imageElement.append(img);
    galleryContainer.append(imageElement);
  }
}

// Enlarge image in a dialog when clicked
void _enlargeImage(String imagePath) {
  final dialog = DivElement()
    ..className = 'dialog';
  
  // Create and add the image to the dialog
  final enlargedImage = ImageElement(src: imagePath);
  dialog.append(enlargedImage);
  
  // Append the dialog to the body
  document.body?.append(dialog);
  
  // Add an event listener to remove the dialog if clicked outside of the image
  dialog.onClick.listen((e) {
    if (e.target == dialog) {
      dialog.remove();
    }
  });
}


  // Show next image pair
  void showNext() {
    currentIndex = (currentIndex + 2) % images.length;
    _createImageElements();
  }

  // Show previous image pair
  void showPrev() {
    currentIndex = (currentIndex - 2) < 0 ? images.length - 2 : currentIndex - 2;
    _createImageElements();
  }

  // Set up event listeners for navigation buttons
  void _setupNavigationButtons() {
    prevButton.onClick.listen((event) => showPrev());
    nextButton.onClick.listen((event) => showNext());
  }

  // Auto slide images every 3 seconds
  void _startAutoSlide() {
    Timer.periodic(Duration(seconds: 10), (timer) {
      showNext();
    });
  }
}
