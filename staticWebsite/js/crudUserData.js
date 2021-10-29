var elementColorDict = {}
var elementsSelectedByUser = {}
var elementsSelectedForReview = []
var selectedElementsLength = 0
var elementButtons = []

/**
 * Returns the number passed in
 * @param {Number} num 
 */
function findNum(num) {
    return num
}

/**
 * Clears the elements reviewed
 * in the previous round
 */
function updateSelectedElements() {
    elementsSelectedForReview.length = 0
    for (var key in elementsSelectedByUser) {
        if (elementsSelectedByUser[key]) {
            elementsSelectedForReview.push(key)
        }
    }
}

/**
 * Updates element border color, tag name, 
 * selectedElementsLength based on whether 
 * it's selected or not
 * @param {Element} button
 * @param {Bool} isSelected
 */
function updateElementBorderColor(button, isSelected) {
    button.style.borderColor = (isSelected) ? 'yellow' : 'black'
    button.tagName = (isSelected) ? '' : 'SelectedElement'
    selectedElementsLength += (isSelected) ? -1 : 1
}

/**
 * Toggles an element as selected
 * or unselected
 */
var didUserSelectElement = false
function selectUnselectElement(button, atomicNumber) {
    didUserSelectElement = elementsSelectedByUser[atomicNumber]
    elementsSelectedByUser[atomicNumber] = !didUserSelectElement
    updateElementBorderColor(button, didUserSelectElement)
    clearSelectionButton.style.opacity = (selectedElementsLength > 0) ? 1 : 0
    updateSelectedElements()
}

/**
 * Toggles all the selected elements
 * as unselected
 */
function clearSelections() {
    for (index = 0; index < elementButtons.length; index++) {
        let button = elementButtons[index]
        elementsSelectedByUser[index + 1] = false
        if (button.style.borderColor == 'black') {
            button.style.borderColor = 'yellow'
        }
    }
    elementsSelectedForReview.length = 0
    selectedElementsLength = 0
    clearSelectionButton.style.opacity = 0
}
