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

void _createImageElements() {
  galleryContainer.innerHtml = ''; // Clear existing elements
  
  for (int i = 0; i < 2; i++) {
    final imageIndex = (currentIndex + i) % images.length;
    
    // Create a new image container
    final imageContainer = DivElement()
      ..className = 'image-container'
      ..id = 'photo-${imageIndex + 1}'
      ..style.objectFit = 'contain'
      ..style.display = 'flex'
      ..style.alignItems = 'center'
      ..style.justifyContent = 'center'
      ..style.maxWidth = '800px' // Maximum width limit
      ..style.maxHeight = '600px' // Maximum height limit
      ..style.width = '100%' // Allow flexible scaling
      ..style.height = 'auto'; // Maintain aspect ratio;
    
    // Create an image element
    final img = ImageElement(src: images[imageIndex])
      ..alt = 'Photo ${imageIndex + 1}' // Alt property for accessibility
      ..style.objectFit = 'contain'; // Ensure the entire image is shown without cropping;

    
    // Add hover effects and smooth transitions
    imageContainer.onMouseOver.listen((event) {
      imageContainer.style.border = '2px solid rgba(255, 255, 255, 0.8)';
      imageContainer.style.transform = 'scale(1.05)';
    });

    imageContainer.onMouseOut.listen((event) {
      imageContainer.style.border = '';
      imageContainer.style.transform = 'scale(1)';
    });
    
    // Add an event listener to enlarge image on click
    img.onClick.listen((event) {
      _enlargeImage(images[imageIndex]);
    });

    // Append the image element to the container
    imageContainer.append(img);
    
    // Add the image container to the gallery
    galleryContainer.append(imageContainer);
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
