let closePtButton = document.createElement('button')

function reframeClosePtButton() {
    let ptHeight = screenHeight * 0.7
    let ptWidth = (ptHeight / 9) * 16
    let buttonWidth = ptWidth * 0.035
    let buttonHeight = buttonWidth
    let buttonX = ptWidth - (buttonWidth * 1.2)
    let buttonY = (buttonWidth * 0.2)
    closePtButton.style.borderRadius = buttonHeight * 0.5
    closePtButton.style.width = buttonWidth
    closePtButton.style.height = buttonHeight
    closePtButton.style.left = buttonX
    closePtButton.style.top = buttonY
    closePtButton.style.borderRadius = (buttonWidth * 0.5) + 'px'
    closePtButton.style.fontSize = (buttonHeight * 0.6)
}

function reStyleClosePtButton() {
    closePtButton.innerHTML = "X"
    closePtButton.style.backgroundColor = 'red'
    closePtButton.style.fontFamily = 'TimesNewRoman, serif'
}


function hidePeriodicTable() {
    ptOpactiy -= 0.02
    periodicTable.style.opacity = ptOpactiy
    if (periodicTable.style.opacity > 0) {
        setTimeout(() => {hidePeriodicTable()}, 1);
    } else {
        ptOpactiy = 0
        periodicTable.style.opacity = 0
        periodicTable.style.zIndex = -1
    }
}

reframeClosePtButton()
reStyleClosePtButton()
periodicTable.appendChild(closePtButton)

closePtButton.onmouseover = function() {closePtButton.style.backgroundColor = 'orange'}
closePtButton.onmouseout = function() {closePtButton.style.backgroundColor = 'red'}

closePtButton.onmousedown = function() {
    if (periodicTable.style.opacity == 1) {
        hidePeriodicTable()
    }
}
