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
// window.addEventListener('load', setMainHeight);
// window.addEventListener('resize', setMainHeight);
document.addEventListener('DOMContentLoaded', function () {
    // console.log("Todo List");
    // console.log("[ ] Make a newcomponent script to match the new page script");
    // console.log("[ ] Delete the old pages and recreate them after updating the page template");
    // console.log("[ ] Make a script that will automatically detect all pages and sub pages and create nav links in the header");
    // console.log("[ ] Make a hero component.");
    // console.log("[ ] Make the medium layout that they use for articles.");
    // console.log("[ ] Make a cheatsheet section of the site.");
    // console.log("[ ] Make the build script watch for changes to files and run automatically.");
    // console.log("[ ] Make a cheatsheet for Pug");
    // console.log("[ ] Make a cheatsheet for console log in js");
    // console.log("[ ] Make some layouts using CSS Grid");
    // console.log("[ ] Get the component scss out of the main file and let it be brought in the right way.");
});