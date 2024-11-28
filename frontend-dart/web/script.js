document.getElementById('loadPortfolioButton').addEventListener('click', function() {
    const gallery = document.getElementById('gallery');

    // Aggiungi alcune immagini alla galleria (modifica i percorsi delle immagini secondo necessità)
    const images = [
        'https://via.placeholder.com/200', // Sostituisci con il percorso delle tue immagini
        'https://via.placeholder.com/200',
        'https://via.placeholder.com/200',
        'https://via.placeholder.com/200'
    ];

    // Aggiungi le immagini alla galleria
    images.forEach(imageSrc => {
        const img = document.createElement('img');
        img.src = imageSrc;
        gallery.appendChild(img);
    });
});

document.getElementById('contactForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const email = document.getElementById('email').value;
    const message = document.getElementById('message').value;

    // Simula l'invio del messaggio (per ora solo un log)
    console.log('Messaggio inviato da:', email);
    console.log('Messaggio:', message);

    alert('Grazie per averci contattato!');
    document.getElementById('contactForm').reset();
});
