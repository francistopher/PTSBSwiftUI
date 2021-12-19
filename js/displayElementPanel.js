const selectedElementPanel = document.createElement('panel')
const selectedElementLabel = document.createElement('label')
const sEAtomicNumberLabel = document.createElement('label')
const sEAtomicNumberTextLabel = document.createElement('label')
const sESymbolTextLabel = document.createElement('label')
const sEAtomicMassTextLabel = document.createElement('label')
const sENameTextLabel = document.createElement('label')
const selectedElementType = document.createElement('label')

/**
 * Creates the element type label
 * @param {Number} parentWidth 
 * @param {Number} parentHeight 
 */
function setSelectedElementType(parentWidth, parentHeight) {
    selectedElementType.innerHTML = 'Nonmetal'
    selectedElementType.style.backgroundColor = 'transparent'
    selectedElementType.style.position = 'absolute'
    setFontSizeAndStyle(selectedElementType, parentHeight * 0.15, 'TimesNewRoman, serif')
    setPosition(selectedElementType, parentWidth, parentHeight * 0.6)
    setSize(selectedElementType, parentWidth * 1.5, parentHeight * 0.2)
    selectedElementPanel.appendChild(selectedElementType)
}

/**
 * 
 * @param {*} parentWidth 
 * @param {*} parentHeight 
 */
function setSENameTextLabel(parentWidth, parentHeight) {
    sENameTextLabel.style.fontSize = parentHeight * 0.15
    sENameTextLabel.innerHTML = 'Name: Hydrogen'
    sENameTextLabel.style.backgroundColor = 'transparent'
    sENameTextLabel.style.position = 'absolute'
    sENameTextLabel.style.fontFamily = 'TimesNewRoman, serif'
    setPosition(sENameTextLabel, parentWidth, (parentHeight * 0.45))
    setSize(sENameTextLabel, parentWidth * 1.5, parentHeight * 0.2)
    selectedElementPanel.appendChild(sENameTextLabel)
}

function setSEAtomicMassTextLabel(parentWidth, parentHeight) {
    sEAtomicMassTextLabel.style.fontSize = parentHeight * 0.15
    sEAtomicMassTextLabel.innerHTML = 'Atomic Mass:<br>0.0079 (g/mol)'
    sEAtomicMassTextLabel.style.backgroundColor = 'transparent'
    sEAtomicMassTextLabel.style.position = 'absolute'
    sEAtomicMassTextLabel.style.fontFamily = 'TimesNewRoman, serif'
    setPosition(sEAtomicMassTextLabel, parentWidth * 2.5, (parentHeight * 0.1))
    setSize(sEAtomicMassTextLabel, parentWidth * 1.5, parentHeight * 0.2)
    selectedElementPanel.appendChild(sEAtomicMassTextLabel)
}

function setSESymbolTextLabel(parentWidth, parentHeight) {
    sESymbolTextLabel.style.fontSize = parentHeight * 0.15
    sESymbolTextLabel.innerHTML = 'Symbol: H'
    sESymbolTextLabel.style.backgroundColor = 'transparent'
    sESymbolTextLabel.style.position = 'absolute'
    sESymbolTextLabel.style.fontFamily = 'TimesNewRoman, serif'
    setPosition(sESymbolTextLabel, parentWidth, (parentHeight * 0.3))
    setSize(sESymbolTextLabel, parentWidth * 1.5, parentHeight * 0.2)
    selectedElementPanel.appendChild(sESymbolTextLabel)
}

function setSEAtomicNumberLabel(parentHeight) {
    sEAtomicNumberLabel.style.fontSize = parentHeight * 0.15
    sEAtomicNumberLabel.innerHTML = '1'
    sEAtomicNumberLabel.style.backgroundColor = 'transparent'
    sEAtomicNumberLabel.style.position = 'absolute'
    sEAtomicNumberLabel.style.fontFamily = 'TimesNewRoman, serif'
    setPosition(sEAtomicNumberLabel, (parentHeight * 0.15), (parentHeight * 0.15))
    setSize(sEAtomicNumberLabel, parentHeight * 0.2, parentHeight * 0.2)
    selectedElementPanel.appendChild(sEAtomicNumberLabel)
}

function setSEAtomicNumberTextLabel(parentWidth, parentHeight) {
    sEAtomicNumberTextLabel.style.fontSize = parentHeight * 0.15
    sEAtomicNumberTextLabel.innerHTML = 'Atomic #: 1'
    sEAtomicNumberTextLabel.style.backgroundColor = 'transparent'
    sEAtomicNumberTextLabel.style.position = 'absolute'
    sEAtomicNumberTextLabel.style.fontFamily = 'TimesNewRoman, serif'
    setPosition(sEAtomicNumberTextLabel, parentWidth, (parentHeight * 0.15))
    setSize(sEAtomicNumberTextLabel, parentWidth * 1.5, parentHeight * 0.2)
    selectedElementPanel.appendChild(sEAtomicNumberTextLabel)
}

function reframeSelectedElementPanel() {
    let elementButtonHeight = (screenHeight * 0.7) / 12
    let elementButtonWidth = (((screenHeight * 0.7) / 9) * 16) / 20
    setSize(selectedElementPanel, elementButtonWidth * 8, elementButtonHeight * 2)
    setPosition(selectedElementPanel, elementButtonHeight * 4, elementButtonWidth)
    setBorderStyle(selectedElementPanel,  elementButtonHeight * 0.05, elementButtonHeight * 0.2)
    let periodicTable = document.getElementById('periodicTable')
    periodicTable.appendChild(selectedElementPanel)
}

function reframeExampleElement() {
    selectedElementLabel.style.verticalAlign = 'middle'
    selectedElementLabel.style.position = 'absolute'
    let elementButtonHeight = ((screenHeight * 0.7) / 12) * 2
    let elementButtonWidth = ((((screenHeight * 0.7) / 9) * 16) / 20) * 2
    setSize(selectedElementLabel, elementButtonWidth * 0.8, elementButtonHeight * 0.6)
    setPosition(selectedElementLabel, elementButtonWidth * 0.1, elementButtonHeight * 0.1)
    setBorderStyle(selectedElementLabel, (elementButtonHeight * 0.9) * 0.05, (elementButtonHeight * 0.9) * 0.2)
    selectedElementLabel.style.backgroundColor = 'cornflowerblue'
    selectedElementLabel.style.fontSize = ((elementButtonHeight * 0.8) * 0.5) + 'px'
    selectedElementLabel.style.padding = ((elementButtonHeight * 0.8) * 0.25) + 'px 0 0 0'
    selectedElementLabel.style.textAlign = 'center'
    selectedElementLabel.innerHTML = 'H'
    selectedElementPanel.appendChild(selectedElementLabel)
    setSEAtomicNumberLabel(elementButtonHeight * 1.1)
    setSEAtomicNumberTextLabel(elementButtonWidth, elementButtonHeight * 1.1)
    setSESymbolTextLabel(elementButtonWidth, elementButtonHeight * 1.1)
    setSEAtomicMassTextLabel(elementButtonWidth, elementButtonHeight * 1.1)
    setSENameTextLabel(elementButtonWidth, elementButtonHeight * 1.1)
    setSelectedElementType(elementButtonWidth, elementButtonHeight * 1.1)
}

function updateExampleElement(symbol, atomicNumber, atomicMass, name, ec, type) {
    selectedElementLabel.innerHTML = symbol
    selectedElementLabel.style.backgroundColor = elementColorDict[symbol]
    sEAtomicNumberLabel.innerHTML = atomicNumber
    sEAtomicNumberTextLabel.innerHTML = 'Atomic Number: ' + atomicNumber
    sESymbolTextLabel.innerHTML = 'Symbol: ' + symbol
    let parenthesisIndex =  atomicMass.indexOf('(')
    if (parenthesisIndex != -1) {
        atomicMass = atomicMass.substr(0, parenthesisIndex)
    }
    sEAtomicMassTextLabel.innerHTML = 'Atomic Mass:<br>' + atomicMass + ' (g/mol)'
    sENameTextLabel.innerHTML = 'Name: ' + name
    let splicedType = type.split(' ')
    var trueTypeString = ''
    for (i = 0; i < splicedType.length; i++) {
        let text = splicedType[i]
        let firstChar = text[0]
        trueTypeString += firstChar.toUpperCase()
        trueTypeString += text.substr(1, text.length)
        if (i == splicedType.length - 1) {
            trueTypeString += ')'
        } else {
            trueTypeString += ' '
        }
    }
    selectedElementType.innerHTML = '(' + trueTypeString
 }

reframeSelectedElementPanel()
reframeExampleElement()
