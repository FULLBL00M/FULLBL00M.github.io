// Function to calculate and set the height of the main element
function setMainHeight() {
    const headerHeight = getHeaderHeight();
    const footerHeight = getFooterHeight();
    const availableHeight = window.innerHeight - headerHeight - footerHeight;
    const mainElement = document.querySelector('main');
    if (mainElement) {
        mainElement.style.height = `${availableHeight}px`;
    }
}

// Function to get the height of the header element
function getHeaderHeight() {
    const header = document.querySelector('header');
    return header ? header.getBoundingClientRect().height : 0;
}

// Function to get the height of the footer element
function getFooterHeight() {
    const footer = document.querySelector('footer');
    return footer ? footer.getBoundingClientRect().height : 0;
}

// Call the setMainHeight function when the page loads or when the window is resized
window.addEventListener('load', setMainHeight);
window.addEventListener('resize', setMainHeight);
document.addEventListener('DOMContentLoaded', function () {

    // Display user agent information
    console.log("User Agent:", navigator.userAgent);

    // Display User Timezone
    const userTimezone = Intl.DateTimeFormat().resolvedOptions().timeZone;
    console.log("User Timezone:", userTimezone);

    // Display User Ip Address
    // This example requires a server-side endpoint to retrieve the client IP
    fetch('https://api.ipify.org?format=json')
    .then(response => response.json())
    .then(data => {
        console.log("User IP Address:", data.ip);
    })
    .catch(error => {
        console.error("Error fetching IP address:", error);
    });

});