const counter = document.querySelector(".counter-number");

async function updateCounter() {
    try {
        const response = await fetch(
            "https://frv34djxlozcurzfcfby75j3cu0itdja.lambda-url.us-west-1.on.aws/"
        );

        const data = await response.json();

        counter.innerHTML =
            `<p>This page has ${data.views} Views!</p>`;
    } catch (error) {
        console.error("Counter error:", error);
        counter.innerHTML =
            "<p>Unable to load visitor count.</p>";
    }
}

updateCounter();