import 'dart:html';

void main() {
  querySelector('#loadPortfolioButton')?.onClick.listen(loadPortfolio);
}

void loadPortfolio(Event e) {
  final gallery = querySelector('#gallery');

  // Aggiungi alcune immagini alla galleria
  final images = [
    'https://via.placeholder.com/200',
    'https://via.placeholder.com/200',
    'https://via.placeholder.com/200',
    'https://via.placeholder.com/200'
  ];

  // Aggiungi le immagini alla galleria
  for (var imageSrc in images) {
    final img = ImageElement(src: imageSrc);
    gallery?.append(img);
  }
}
