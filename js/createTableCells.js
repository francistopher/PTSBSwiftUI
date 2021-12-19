/**
 * Binds the atomic number label
 * onto the element cell
 * @param {Number} atomicNumber 
 * @param {Number} height 
 * @param {Element} elementCell 
 */
var temporaryAtomicNumberLabel
function displayAtomicNumber(atomicNumber, height, elementCell) {
    temporaryAtomicNumberLabel = document.createElement('label')
    temporaryAtomicNumberLabel.innerHTML = atomicNumber
    temporaryAtomicNumberLabel.style.backgroundColor = 'transparent'
    temporaryAtomicNumberLabel.style.position = 'absolute'
    setFontSizeAndStyle(temporaryAtomicNumberLabel, height * 0.5, 'TimesNewRoman, serif')
    setSize(temporaryAtomicNumberLabel, (height * 0.2), (height * 0.2))
    setPosition(temporaryAtomicNumberLabel, (height * 0.15), (height * 0.15))
    elementCell.appendChild(temporaryAtomicNumberLabel)
}

/**
 * Sets the element button color based on its 
 * period and group and then save it to the
 * element color dictionary
 * @param {Element} button 
 * @param {Number} group 
 * @param {Number} period 
 * @param {String} symbol 
 */
function setElementButtonColor(button, group, period, symbol) {
    var selectedColor = 'black'
    if (group == 1 && period > 1) {
        selectedColor = 'orange'
    } else if (group == 2 && period > 1) {
        selectedColor = 'lightcoral'
    } else if (group > 2 && group < 13 && period < 9) {
        selectedColor = (period == 7 && group > 8 && group < 12) ? 'lavenderblush' : 'lightgreen'
    } else if (group == 18) {
        if (period < 8) {
            selectedColor = (period == 7) ? 'lavenderblush' : 'lightsalmon'
        }
    } else if (group == 17) {
        if (period < 8) {
            selectedColor = (period == 7) ? 'lavenderblush' :'lightblue'
        }
    } else if (group > 13 && group < 17 && period > 1 && period < 5) {
        selectedColor = ((period == 2) || (period == 3 && group > 14) || (period == 4 && group > 15)) ? 'cornflowerblue' : 'plum'
    } else if (group == 13) {
        if (period == 2) {
            selectedColor = 'plum'
        } else if (period > 2 && period < 7) {
            selectedColor = 'orchid'
        } else if (period == 7) {
            selectedColor = 'lavenderblush'
        }
    } else if (group > 13 && group < 17 && period > 4 && period < 8) {
        if (period == 5) {
            selectedColor = (group > 14) ? 'plum' : 'orchid'
        }
        if (period == 6) {
            selectedColor = 'orchid'
        }
        if (period == 7) {
            selectedColor = 'lavenderblush'
        }
    } else if (period == 1 && group == 1) {
        selectedColor = 'cornflowerblue'
    }
    if (period > 8) {
        selectedColor = (period == 9) ? 'mediumpurple' : 'tomato'
    }
    button.style.backgroundColor = selectedColor
    elementColorDict[symbol] = selectedColor
}

/**
 * Display the information of
 * the currently selected element
 * @param {Number} atomicNumber 
 */
function displayElementInformation(atomicNumber) {
    let element = periodicTableData[atomicNumber - 1]
    updateExampleElement(element['symbol'], 
                        element['atomicNumber'],
                         element['atomicMass'],
                          element['name'],
                          element['electronicConfiguration'],
                          element['groupBlock']) 
}

var temporaryElement
var temporarySymbol
/**
 * Builds and returns an element button based
 * on the atomic number, group, and period,
 * and updates its size and position
 * @param {Number} width 
 * @param {Number} height 
 * @param {Number} top 
 * @param {Number} left 
 * @param {Number} atomicNumber 
 * @param {Number} group 
 * @param {Number} period 
 */
function getElementButton(width, height, top, left, atomicNumber, group, period) {
    let temporaryElementButton = document.createElement('button')
    temporaryElement = periodicTableData[atomicNumber - 1]
    temporarySymbol = temporaryElement["symbol"]
    temporaryElementButton.innerHTML = temporarySymbol
    setSize(temporaryElementButton, width, height)
    setPosition(temporaryElementButton, left, top)
    setBorderStyle(temporaryElementButton, (width * 0.05), (height * 0.2))
    setElementButtonColor(temporaryElementButton, group, period, temporarySymbol)
    displayAtomicNumber(atomicNumber, (height * 0.4), temporaryElementButton)
    setFontSizeAndStyle(temporaryElementButton, height * 0.5, 'TimesNewRoman, serif')
    temporaryElementButton.style.borderColor = 'yellow'
    temporaryElementButton.onmouseover = function() {displayElementInformation(atomicNumber)}
    temporaryElementButton.onclick = function() {selectUnselectElement(temporaryElementButton, atomicNumber)}
    elementsSelectedByUser[atomicNumber] = false
    elementButtons.push(temporaryElementButton)
    return temporaryElementButton
}

var temporaryGroupButton
var temporaryRow = 0
/**
 * Builds a group number, sets the number
 * sets its size and position and returns it
 * @param {Number} width 
 * @param {Number} height 
 * @param {Number} left 
 * @param {Number} group 
 */
function getGroupButton(width, height, left, group) {
    let temporaryGroupButton = document.createElement('button')
    if ((group == 2) || (group > 12 && group < 18)) {
        temporaryRow = 1
    } else if ((group > 2 && group < 13)) {
        temporaryRow = 3
    } else if (group == 18) {
        temporaryRow = 0
    }
    temporaryGroupButton.innerHTML = 'G' + group
    setSize(temporaryGroupButton, width, height)
    setPosition(temporaryGroupButton, left, (temporaryRow * height) + (height * 0.25))
    setFontSizeAndStyle(temporaryGroupButton, height * 0.25, 'TimesNewRoman, serif')
    temporaryGroupButton.style.backgroundColor = 'transparent'
    temporaryGroupButton.style.borderWidth = '0px'
    temporaryGroupButton.style.verticalAlign = 'bottom'
    return temporaryGroupButton
}

var temporaryPeriodButton
var temporaryXPosition
/**
 * 
 * @param {Number} width 
 * @param {Number} height 
 * @param {Number} top 
 * @param {Number} period 
 */
function getPeriodButton(width, height, top, period) {
    temporaryPeriodButton = document.createElement('button')
    temporaryXPosition = (period > 0 && period < 8) ? (width * 0.25) : ((width * 0.25) + (width * 3))
    temporaryPeriodButton.innerHTML = 'P' + period
    setSize(temporaryPeriodButton, width, height)
    setPosition(temporaryPeriodButton, temporaryXPosition, top)
    setFontSizeAndStyle(temporaryPeriodButton, height * 0.25, 'TimesNewRoman, serif')
    temporaryPeriodButton.style.backgroundColor = 'transparent'
    temporaryPeriodButton.style.borderWidth = '0px'
    temporaryPeriodButton.style.verticalAlign = 'bottom'
    return temporaryPeriodButton
}

var temporaryFillInLabel
/**
 * Builds the fill in label, sets its size
 * position and period text and returns it
 * @param {*} width 
 * @param {*} height 
 * @param {*} top 
 * @param {*} left 
 * @param {*} period 
 */
function getFillInLabel(width, height, top, left, period) {
    temporaryFillInLabel = document.createElement('label')
    temporaryFillInLabel.style.textAlign = 'center'
    temporaryFillInLabel.style.position = 'absolute'
    setSize(temporaryFillInLabel, width, height)
    setPosition(temporaryFillInLabel, left, top)
    setFontSizeAndStyle(temporaryFillInLabel, height * 0.275, 'TimesNewRoman, serif')
    setBorderStyle(temporaryFillInLabel, width * 0.01, width * 0.2)
    temporaryFillInLabel.style.borderColor = 'yellow'
    temporaryFillInLabel.innerHTML = (period == 6) ? '<br>57-71' : '<br>89-103'
    temporaryFillInLabel.style.backgroundColor = (period == 6) ? 'mediumpurple' : 'tomato'
    return temporaryFillInLabel
}

const clearSelectionButton = document.createElement('button')
/**
 * Builds the clear selection button by settings
 * its size and position, and returns it
 * @param {*} width 
 * @param {*} height 
 * @param {*} left 
 * @param {*} top 
 */
function getClearSelectionButton(width, height, left, top) {
    clearSelectionButton.style.textAlign = 'center'
    clearSelectionButton.style.position = 'absolute'
    setSize(clearSelectionButton, width * 2, height * 2)
    setPosition(clearSelectionButton, left, top)
    setFontSizeAndStyle(clearSelectionButton, height * 0.275, 'TimesNewRoman, serif')
    setBorderStyle(clearSelectionButton, width * 0.05, width * 0.2)
    clearSelectionButton.style.borderColor = 'black'
    clearSelectionButton.innerHTML = 'CLEAR<br>SELECTION'
    clearSelectionButton.style.backgroundColor = 'white'
    clearSelectionButton.style.opacity = 0
    clearSelectionButton.onclick = function() {clearSelections()}
    return clearSelectionButton
}

/**
 * All the periodic table cells are built
 */
var elementButtonHeight = (screenHeight * 0.7) / 12
var elementButtonWidth = (((screenHeight * 0.7) / 9) * 16) / 20
var elementButtonTop = elementButtonHeight
var elementButtonLeft = elementButtonWidth
var atomicNumber = 1
for (rows = 0; rows < 10; rows++) {
    for (columns = 0; columns < 18; columns++) {
        let isNotEmptyRow = !(rows == 7)
        let isNotSegmentDisplacement = !(columns < 3 && rows > 7)
        let isNotFirstRowGap = !((rows == 0) && (columns > 0 && columns < 17))
        let isNotSecondRowGap = !((rows == 1) && (columns > 1 && columns < 12))
        let isNotThirdRowGap = !((rows == 2) && (columns > 1 && columns < 12))
        let isNotAFillInArea = !(rows > 4 && rows < 7 && columns == 2)
        // Create elements
        if (isNotEmptyRow && isNotSegmentDisplacement && isNotFirstRowGap && isNotSecondRowGap && isNotThirdRowGap && isNotAFillInArea) {
            let elementButton = getElementButton(
                elementButtonWidth, 
                elementButtonHeight, 
                elementButtonTop, 
                elementButtonLeft,
                atomicNumber, 
                (columns + 1), 
                (rows + 1))
            if (atomicNumber == 118) {
                atomicNumber -= 62
            }
            if (rows + 1 == 9 && atomicNumber == 71) {
                atomicNumber += 17
            }
            atomicNumber += 1
            periodicTable.appendChild(elementButton)
        }
        // Add fill in labels
        if (!isNotAFillInArea) {
            let fillInLabel = getFillInLabel(
                elementButtonWidth,
                elementButtonHeight,
                elementButtonTop,
                elementButtonLeft,
                (rows + 1)
            )
            atomicNumber += 15
            periodicTable.appendChild(fillInLabel)
        }
        // Create group labels
        if (rows == 0) {
            let groupButton = getGroupButton(
                elementButtonWidth,
                elementButtonHeight,
                elementButtonLeft,
                (columns + 1)
            )
            periodicTable.appendChild(groupButton)
        }
        // Create period labels
        if (columns == 0 && rows != 7) {
            let periodButton = getPeriodButton(
                elementButtonWidth, 
                elementButtonHeight, 
                elementButtonTop, 
                (rows + 1)
            )
            periodicTable.appendChild(periodButton)
        }
        // Create clear selection button
        if (rows == 8 && columns == 0) {
            let clearSelectionButton = getClearSelectionButton(
                elementButtonWidth,
                elementButtonHeight,
                elementButtonLeft,
                elementButtonTop
            )
            periodicTable.appendChild(clearSelectionButton)
        }
        elementButtonLeft += elementButtonWidth
    }
    elementButtonLeft = elementButtonWidth
    elementButtonTop += elementButtonHeight
}
