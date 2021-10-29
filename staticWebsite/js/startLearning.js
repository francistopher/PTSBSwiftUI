var flashingElementsButton = false
var flashingElementsButtonCount = 0
function flashSelectElementsButton() {
    if (flashingElementsButton) {
        selectElementsButton.style.backgroundColor = 'lightgreen'
    } else {
        selectElementsButton.style.backgroundColor = 'yellow'
    }
    if (flashingElementsButtonCount < 6) {
        flashingElementsButton = !flashingElementsButton
        flashingElementsButtonCount += 1
        setTimeout(() => {flashSelectElementsButton()}, 400)
    } else {
        flashingElementsButtonCount = 0
        selectElementsButton.style.backgroundColor = 'yellow'
    }
}

var sebOpacity = 1.0
function fadeOutMainPageButtons() {
    sebOpacity -= 0.02
    selectElementsButton.style.opacity = sebOpacity
    startLearningButton.style.opacity = sebOpacity
    if (selectElementsButton.style.opacity > 0) {
        setTimeout(() => {fadeOutMainPageButtons()}, 10)
    } else {
        selectElementsButton.style.opacity = 0
        startLearningButton.style.opacity = 0
    }
}

let originalFrontImageX = frontImage.style.left.substr(0, frontImage.style.left.length - 2)
var currentFrontImageX = originalFrontImageX
let frontImageWidth = frontImage.style.width.substr(0, frontImage.style.width.length - 2) * 0.55
function translateElementImage(left) {
    if (left) {
        currentFrontImageX -= screenWidth * 0.005
    } else {
        currentFrontImageX += screenWidth * 0.005
    }
    frontImage.style.left = currentFrontImageX + 'px'
    if (left) {
        if (currentFrontImageX > (originalFrontImageX - frontImageWidth)) {
            setTimeout(() => {translateElementImage(true)}, 1)
        } else {
            frontImage.style.left = (originalFrontImageX - frontImageWidth)
        }
    } else {
        if (currentFrontImageX < originalFrontImageX) {
            setTimeout(() => {translateElementImage(false)}, 1)
        } else {
            frontImage.style.left = originalFrontImageX
        }
    }
}

function startLearningTheElements() {
    if (selectedElementsLength > 0) {
        showLearningPanel()
        fadeOutMainPageButtons()
        translateElementImage(true)
    } else {
        flashSelectElementsButton()
    }
}

startLearningButton.onclick = function (){startLearningTheElements()}
