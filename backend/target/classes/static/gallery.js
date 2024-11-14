document.addEventListener('DOMContentLoaded', function () {
    const photoItems = document.querySelectorAll('.photo-item');
    const lightbox = document.createElement('div');
    const lightboxImage = document.createElement('img');
    const lightboxDescription = document.createElement('p');
    const lightboxClose = document.createElement('span');
    const lightboxPrev = document.createElement('span');
    const lightboxNext = document.createElement('span');

    lightbox.classList.add('lightbox');
    lightboxImage.classList.add('lightbox-image');
    lightboxDescription.classList.add('lightbox-description');
    lightboxClose.classList.add('lightbox-close');
    lightboxPrev.classList.add('lightbox-prev');
    lightboxNext.classList.add('lightbox-next');

    // Append elements to the lightbox
    lightbox.appendChild(lightboxImage);
    lightbox.appendChild(lightboxDescription);
    lightbox.appendChild(lightboxClose);
    lightbox.appendChild(lightboxPrev);
    lightbox.appendChild(lightboxNext);
    document.body.appendChild(lightbox);

    let currentIndex = -1;

    // Open lightbox on image click
    photoItems.forEach((item, index) => {
        item.addEventListener('click', () => {
            currentIndex = index;
            openLightbox(item);
        });
    });

    // Open lightbox with the clicked image
    function openLightbox(item) {
        const img = item.querySelector('img');
        lightboxImage.src = img.src;
        lightboxDescription.textContent = item.getAttribute('data-description');
        lightbox.style.display = 'flex';
        document.body.style.overflow = 'hidden';

        // Enlarge image with animation
        setTimeout(() => {
            lightboxImage.classList.add('enlarged');
            lightboxDescription.classList.add('show');
        }, 50);  // slight delay for animation to trigger
    }

    // Close lightbox
    lightboxClose.addEventListener('click', () => {
        lightboxImage.classList.remove('enlarged');
        lightboxDescription.classList.remove('show');
        setTimeout(() => {
            lightbox.style.display = 'none';
            document.body.style.overflow = 'auto';
        }, 500); // Wait for the animation to complete before hiding the lightbox
    });

    // Navigate to next/previous image
    lightboxNext.addEventListener('click', () => {
        if (currentIndex < photoItems.length - 1) {
            currentIndex++;
            openLightbox(photoItems[currentIndex]);
        }
    });

    lightboxPrev.addEventListener('click', () => {
        if (currentIndex > 0) {
            currentIndex--;
            openLightbox(photoItems[currentIndex]);
        }
    });

    // Close lightbox when clicking outside the image
    lightbox.addEventListener('click', (e) => {
        if (e.target === lightbox) {
            lightboxImage.classList.remove('enlarged');
            lightboxDescription.classList.remove('show');
            setTimeout(() => {
                lightbox.style.display = 'none';
                document.body.style.overflow = 'auto';
            }, 500);
        }
    });
});
