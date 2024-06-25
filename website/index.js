const counter = document.querySelector(".counter-number");

async function updateCounter() {
    console.log("Updating counter...");
    let response = await fetch("https://jul7qeeflj4ecbjptkrxfefon40qfiob.lambda-url.us-west-1.on.aws/");
    let data = await response.json();
    counter.innerHTML = `<p>This page has ${data} Views!</p>`;
}

updateCounter();

