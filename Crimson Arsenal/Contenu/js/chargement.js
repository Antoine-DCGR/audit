const loader = document.querySelector(".loader");

window.addEventListener('load', () => {

    loader.classList.add("fondu-out");

    setTimeout(() => {
        loader.remove(); 
    }, 2000);
});
