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
    _setupImageModal();
  }

  // Create image elements and update the gallery
  void _createImageElements() {
    List<DivElement> containers = [];
    for (int i = 0; i < 2; i++) {
      final imageIndex = (currentIndex + i) % images.length;
      final imageContainer = DivElement()
        ..className = 'image-container'
        ..id = 'photo-${imageIndex + 1}';

      final img = ImageElement(src: images[imageIndex])
        ..alt = 'Photo ${imageIndex + 1}'
        ..style.objectFit = 'cover'
        ..style.width = '100%' // Ensures the images fit inside their containers
        ..style.height = 'auto'; // Keeps aspect ratio

      img.onClick.listen((e) => _openImageModal(images[imageIndex]));

      // Add the image element to the container
      imageContainer.append(img);
      containers.add(imageContainer);
    }

    // Update the gallery without clearing its contents, only replace the images
    if (galleryContainer.children.isNotEmpty) {
      galleryContainer.children[0].replaceWith(containers[0]);
      galleryContainer.children[1].replaceWith(containers[1]);
    } else {
      galleryContainer.append(containers[0]);
      galleryContainer.append(containers[1]);
    }
  }

  // Show next image pair
  void showNext() {
    currentIndex = currentIndex;
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

  // Auto slide images every 10 seconds
  void _startAutoSlide() {
    Timer.periodic(Duration(seconds: 10), (timer) {
      showNext();
    });
  }

  // Modal functionality
  void _setupImageModal() {
    // Modal elements
    DivElement modal = DivElement()
      ..id = 'imageModal'
      ..style.display = 'none'
      ..style.position = 'fixed'
      ..style.top = '0'
      ..style.left = '0'
      ..style.width = '100%'
      ..style.height = '100%'
      ..style.backgroundColor = 'rgba(0, 0, 0, 0.7)'
      ..style.justifyContent = 'center'
      ..style.alignItems = 'center'
      ..style.display = 'none';
      
    ImageElement modalImage = ImageElement()
      ..id = 'modalImage'
      ..style.maxWidth = '90%'
      ..style.maxHeight = '90%'
      ..style.objectFit = 'contain';

    ButtonElement closeBtn = ButtonElement()
      ..text = 'Close'
      ..style.position = 'absolute'
      ..style.top = '10px'
      ..style.right = '20px'
      ..style.fontSize = '20px'
      ..style.color = 'white'
      ..style.backgroundColor = 'transparent'
      ..style.border = 'none';

    // Add the modal and the image
    modal.append(modalImage);
    modal.append(closeBtn);
    document.body?.append(modal);

    // Close modal when clicking the close button or outside the image
    closeBtn.onClick.listen((e) => _closeImageModal(modal));
    modal.onClick.listen((e) {
      if (e.target == modal) {
        _closeImageModal(modal);
      }
    });

    // Close modal when pressing the 'Esc' key
    window.onKeyUp.listen((e) {
      if (e.key == 'Escape') {
        _closeImageModal(modal);
      }
    });
  }

  // Open the image in the modal
  void _openImageModal(String imageUrl) {
    DivElement modal = querySelector('#imageModal') as DivElement;
    ImageElement modalImage = querySelector('#modalImage') as ImageElement;
    modalImage.src = imageUrl;
    modal.style.display = 'flex';
  }

void _closeImageModal(DivElement modal) {
  modal.style.opacity = '0';
  modal.style.visibility = 'hidden';
  // Delay hiding the modal to allow for the fade effect
  Future.delayed(Duration(milliseconds: 300), () {
    modal.style.display = 'none';
  });
}

}
