const introText = document.getElementById('introText')
introText.style.opacity = 1

/**
 * Centers the intro-text relative to the screen
 */
function centerText() {
    setPosition(introText, 
                (screenWidth - introText.clientWidth) * 0.5,
                (screenHeight - introText.clientHeight) * 0.5)
}

/**
 * Plays the intro animation
 */
var currentText = ''
var assignedText = 'DESIGNED BY FRANCISCO IN FLORIDA'
var showCursor = true
function presentIntro() {
    currentText += assignedText[0] 
    introText.innerHTML = (showCursor) ? (currentText) : (currentText + '_')
    showCursor = !showCursor
    centerText()
    assignedText = assignedText.substring(1, assignedText.length)
    if (assignedText.length > 0) {
        setTimeout(() => {presentIntro()}, 90);
    } else {
        introText.innerHTML = currentText 
    }
}

var introTextOpacity = 1.0
function hideIntro() {
    introTextOpacity -= 0.02;
    introText.style.opacity = introTextOpacity
    if (introText.style.opacity > 0) {
        setTimeout(() => {hideIntro()}, 10);
    } else {
        introText.style.opacity = 0
        introText.style.display = 'none'
    }
}

introText.style.fontSize = (screenWidth * 0.04) + 'px'
centerText();
setTimeout(() => {presentIntro()}, 500);
setTimeout(() => {hideIntro()}, 3500);
