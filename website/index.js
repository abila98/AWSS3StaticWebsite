const counter = document.querySelector(".counter-number");

async function updateCounter() {
    console.log("Updating counter...");
    let response = await fetch("https://k4inz4zl2zsn4xjrwougjmp45u0dsohd.lambda-url.us-west-1.on.aws/");
    let data = await response.json();
    counter.innerHTML = `<p>This page has ${data} Views!</p>`;
}

updateCounter();

