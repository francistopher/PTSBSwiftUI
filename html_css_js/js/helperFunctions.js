/**
 * Updates the x position of the element
 * 
 * @param {Element} element 
 * @param {Number} x 
 */
function setXPosition(element, x) {
    element.style.left = x + 'px'
}

/**
 * Updatesthe y position of the element
 * @param {Element} element 
 * @param {Number} y 
 */
function setYPosition(element, y) {
    element.style.top = y + 'px'
}

/**
 * Updates both x, y position of the element
 * @param {Element} element 
 * @param {Number} x 
 * @param {Number} y 
 */
function setPosition(element, x, y) {
    setXPosition(element, x)
    setYPosition(element, y)
}

/**
 * Updates the width, height of the element
 * @param {Element} element 
 * @param {Number} width 
 * @param {Number} height 
 */
function setSize(element, width, height) {
    element.style.width = width
    element.style.height = height
}

/**
 * Updates the border width, border radius of the element
 * @param {Element} element 
 * @param {Number} width 
 * @param {Number} radius 
 */
function setBorderStyle(element, width, radius) {
    element.style.borderWidth = width + 'px'
    element.style.borderRadius = radius + 'px'
}

/**
 * Updates the font size and style of an element
 * @param {Element} element 
 * @param {Number} size 
 * @param {String} style 
 */
function setFontSizeAndStyle(element, size, style) {
    element.style.fontSize = size
    element.style.fontFamily = style
}

const toolbarWidth = window.outerWidth - window.innerWidth
const screenWidth = screen.width - toolbarWidth
const toolbarHeight = window.outerHeight - window.innerHeight
const screenHeight = screen.height - toolbarHeight
