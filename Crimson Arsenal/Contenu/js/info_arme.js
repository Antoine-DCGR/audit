const background = document.getElementById('animated-background');

// Fonction pour générer une particule
function generateParticle() {
    const particle = document.createElement('div');
    particle.className = 'particle';

    const isWhite = Math.random() > 0.5;
    particle.style.backgroundColor = isWhite ? 'rgba(255, 194, 109, 0.9)' : 'rgba(255, 123, 0, 0.8)';

    particle.style.boxShadow = isWhite
        ? '0 0 10px rgba(255, 194, 141, 0.8), 0 0 20px rgba(255, 199, 103, 0.91)'
        : '0 0 10px rgba(255, 69, 0, 0.8), 0 0 20px rgba(255, 69, 0, 0.6)';

    const size = Math.random() * 3; 
    particle.style.width = `${size}px`;
    particle.style.height = `${size}px`;

    particle.style.top = Math.random() * 100 + 'vh';
    particle.style.left = Math.random() * 100 + 'vw';

    const duration = Math.random() * 5 + 10;
    const delay = Math.random() * 5;
    particle.style.animation = `float ${duration}s infinite ease-in-out, 
                                move ${duration}s infinite linear ${-delay}s`;

    setTimeout(() => {
        particle.remove();
    }, 9000);

    background.appendChild(particle);
}

for (let i = 0; i < 150; i++) {
    generateParticle();
}

setInterval(() => {
    generateParticle();
}, 20);
