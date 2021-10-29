// Display Main Screen
const header = document.getElementById('headerText')
const frontImage = document.getElementById('frontImage')
const selectElementsButton = document.getElementById('selectElements')
const startLearningButton = document.getElementById('startLearning')

/**
 * Updates dimensions of the header label
 */
var opacity = 0
function reframeHeader() {
    header.style.width = screenWidth
    header.style.fontSize = (screenWidth * 0.04) + 'px'
    setXPosition(header, (screenWidth - header.style.width) * 0.5)
    setYPosition(header, screenHeight * 0.0) 
}

/**
 * Updates the dimensions of the front image
 */
function reframeFrontImage() {
    let frontImageLength = screenHeight * 0.7
    setSize(frontImage, frontImageLength, frontImageLength)
    setPosition(frontImage, (screenWidth - frontImageLength) * 0.5, (screenHeight - frontImageLength) * 0.5)
}

let buttonHeight = screenHeight * 0.2
let buttonWidth = buttonHeight
/**
 * Updates the dimensions of the button
 * @param {Element} button 
 */
function resizeButton(button) {
    setSize(button, buttonWidth, buttonHeight)
    button.style.fontSize = buttonHeight * 0.2
    setBorderStyle(button, buttonHeight * 0.05, buttonHeight * 0.2)
}

/**
 * Updates the position of the select elements button
 * or the start learning button
 * @param {Bool} isSelectElementsButton 
 */
function updateButtonPosition(isSelectElementsButton) {
    if (isSelectElementsButton) {
        setPosition(selectElementsButton, ((screenWidth * 0.33) - (buttonWidth * 0.75)) * 0.5, (screenHeight - buttonHeight) * 0.5)
    } else {
        setPosition(startLearningButton, screenWidth - ((screenWidth * 0.33) - (buttonWidth * 0.75)), (screenHeight - buttonHeight) * 0.5)
    }
}

/**
 * Makes all the main screen elements
 * opaque or not
 * @param {Bool} allElements 
 */
function showMainPage(allElements) {
    opacity += 0.02
    if (allElements) {
        header.style.opacity = opacity
        frontImage.style.opacity = opacity
    }
    selectElementsButton.style.opacity = opacity
    startLearningButton.style.opacity = opacity
    if (header.style.opacity < 1) {
        setTimeout(() => {showMainPage(true)}, 10);
    } else {
        header.style.opacity = 1
        frontImage.style.opacity = 1
        selectElementsButton.style.opacity = 1
        startLearningButton.style.opacity = 1
        opacity = 0
    }
}

/**
 * Highlights or unhighlights the button
 * @param {Bool} highlight 
 * @param {Element} button 
 */
function hoverOnOffSelectElements(highlight, button) {
    button.style.backgroundColor = (highlight) ? 'orange' : 'yellow'
}

var buttonOpacity = 0
/**
 * Makes the select elements button transparent
 */
function makeMainScreenButtonsTransparent() {
    buttonOpacity -= 0.02
    selectElementsButton.style.opacity = buttonOpacity
    if (selectElementsButton.style.opacity > 0) {
        setTimeout(() => {makeMainScreenButtonsTransparent()}, 10);
    }
}

/**
 * Enables the main screen buttons 
 * to be hightlights and unhighlighted
 */
selectElementsButton.onmouseover = function() {hoverOnOffSelectElements(true, selectElementsButton)}
selectElementsButton.onmouseout = function() {hoverOnOffSelectElements(false, selectElementsButton)}
startLearningButton.onmouseover = function() {hoverOnOffSelectElements(true, startLearningButton)}
startLearningButton.onmouseout = function() {hoverOnOffSelectElements(false, startLearningButton)}

reframeHeader()
reframeFrontImage()
resizeButton(selectElementsButton)
resizeButton(startLearningButton)
updateButtonPosition(true)
updateButtonPosition(false)
setTimeout(() => {showMainPage(true)}, 4500);
