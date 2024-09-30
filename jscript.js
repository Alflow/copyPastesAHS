// Selecciona todos los elementos <a> dentro del contenedor <article> con la clase específica
const links = document.querySelectorAll('article.post.type-post.status-publish a');

// Inicializa un contador para las pestañas abiertas
let tabCount = 0;

// Función para abrir pestañas con retraso
function openTabWithDelay(i) {
    if (i < links.length) {
        window.open(links[i].href, '_blank');
        tabCount++; // Incrementa el contador por cada enlace
        setTimeout(() => openTabWithDelay(i + 1), 200); // Abre la siguiente pestaña después de 500 ms
    } else {
        // Muestra el número total de pestañas abiertas al finalizar
        alert(`Se han abierto ${tabCount} pestañas en total.`);
    }
}

// Iniciar la apertura de pestañas con retraso
openTabWithDelay(0);
