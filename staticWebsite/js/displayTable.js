const periodicTable = document.getElementById('periodicTable')
const ptHeight = screenHeight * 0.7
const ptWidth = (ptHeight / 9) * 16
// Showing coordinates
const ptX = ((screenWidth - ptWidth) * 0.5)
const ptY = ((screenHeight - ptHeight) * 0.5)

var ptOpactiy = 0.0
/**
 * Makes the periodic table 
 * opaque over time
 */
function showPeriodicTable() {
    ptOpactiy += 0.02
    periodicTable.style.opacity = ptOpactiy
    if (periodicTable.style.opacity < 1) {
        setTimeout(() => {showPeriodicTable()}, 1);
    } else {
        ptOpactiy = 1
        periodicTable.style.opacity = 1
    }
}

/**
 * Adds a function for the select elements 
 * button to invoke when it is clicked
 */
selectElementsButton.onmousedown = function() {
    if (periodicTable.style.opacity == 0 && selectElementsButton.style.opacity == 1) {
        periodicTable.style.zIndex = 7
        showPeriodicTable()
    }
}

setSize(periodicTable, ptWidth, ptHeight)
setPosition(periodicTable, ptX, ptY)
setBorderStyle(periodicTable, (ptHeight * 0.01), (ptHeight * 0.06))
