let selectCategoryLabel = document.createElement('label')
let symbolCheckBox = document.createElement('input')
let nameCheckBox = document.createElement('input')
let atomicNumberCheckBox = document.createElement('input')
let atomicMassCheckBox = document.createElement('input')
let letsStartButton = document.createElement('button')
let checkBoxes = [symbolCheckBox, 
                nameCheckBox, 
                atomicNumberCheckBox, 
                atomicMassCheckBox               
		]
let checkBoxLabels = [document.createElement('label'), 
                        document.createElement('label'), 
                        document.createElement('label'), 
                        document.createElement('label'), 
                        document.createElement('label')
                    ]
let labelTitles = ['Symbol', 'Name', 'Atomic Number', 'Atomic Mass'] 
function setupCheckBoxes() {
    var yPosition = lpUnitLength * 2.5
    for (i = 0; i < checkBoxes.length; i++) {
        // Edit check boxes
        let checkBox = checkBoxes[i]
        checkBox.type = 'checkbox'
        checkBox.textAlign = 'center'
        checkBox.style.position = 'absolute'
        setSize(checkBox, lpUnitLength, lpUnitLength)
        setPosition(checkBox, lpUnitLength * 2, yPosition)
        learningPanel.append(checkBox)
        // Edit check box labels
        let label = checkBoxLabels[i]
        label.innerHTML = labelTitles[i]
        label.style.position = 'absolute'
        label.style.fontSize = (lpUnitLength * 0.6) + 'px'
        label.style.fontFamily = 'Bangers, serif'
        setSize(label, lpUnitLength * 6, lpUnitLength)
        setPosition(label, lpUnitLength * 3, yPosition + (lpUnitLength * 0.25))
        learningPanel.append(label)
        yPosition += (lpUnitLength * 1.5)
    }
}

function reframeSelectCategoryLabel() {
    selectCategoryLabel.style.position = 'absolute'
    setSize(selectCategoryLabel, lpUnitLength * 10, lpUnitLength)
    setPosition(selectCategoryLabel, lpUnitLength, lpUnitLength)
}

function updateCategoryLabelText() {
    selectCategoryLabel.innerHTML = 'Select at least one category'
    selectCategoryLabel.style.textAlign = 'center'
    selectCategoryLabel.style.fontSize = (lpUnitLength * 0.75) + 'px'
    selectCategoryLabel.style.fontFamily = 'Bangers, serif'
}

function reframeLetsStartButton() {
    letsStartButton.style.position = 'absolute'
    setSize(letsStartButton, lpUnitLength * 3, lpUnitLength)
    setPosition(letsStartButton, lpUnitLength * 4.5, lpUnitLength * 10.25)
}

function updateLetsStartButtonText() {
    letsStartButton.innerHTML = "Let's start!"
    letsStartButton.style.textAlign = 'center'
    letsStartButton.style.fontSize = (lpUnitLength * 0.5) + 'px'
    letsStartButton.style.borderWidth = (lpUnitLength * 0.05) + 'px'
    letsStartButton.style.borderRadius = (lpUnitLength * 0.3) + 'px'
    letsStartButton.style.backgroundColor = 'pink'
}

function isAtLeast1CheckBoxMarked() {
    var checkBoxesMarkedCount = 0
    for (i = 0; i < checkBoxes.length; i++) {
        let checkBox = checkBoxes[i]
        if (checkBox.checked) {
            checkBoxesMarkedCount += 1
        }
    }
    return checkBoxesMarkedCount > 0
}

let timesSCLFlashed = 0
var sclFlashed = false
function flashTitle() {
    if (sclFlashed) {
        selectCategoryLabel.style.color = 'black'
    } else {
        selectCategoryLabel.style.color = 'pink'
    }
    if (timesSCLFlashed < 5) {
        timesSCLFlashed += 1
        sclFlashed = !sclFlashed
        setTimeout(() => {flashTitle()}, 250)
    } else {
        timesSCLFlashed = 0
        sclFlashed = false
    }
}

function uncheckAllCheckBoxes() {
    for (i = 0; i < checkBoxes.length; i++) {
        let checkBox = checkBoxes[i]
        if (checkBox.checked) {
            checkBoxesSelected[i] = true
            checkBox.checked = false
        }
    }
}

function hideCategorySelectionMenu() {
    selectCategoryLabel.style.opacity = 0
    for (i = 0; i < checkBoxes.length; i++) {
        let checkBox = checkBoxes[i]
        let label = checkBoxLabels[i]
        checkBox.style.opacity = 0
        label.style.opacity = 0
    }
    letsStartButton.style.opacity = 0
}

function startQuestioningUser() {
    if (isAtLeast1CheckBoxMarked()) {
        hideCategorySelectionMenu()
        uncheckAllCheckBoxes()

        generateQuestionsAndAnswers()
        startTheQuestioning()
    } else {
        flashTitle()
    }
}

function showCategorySelection() {
    selectCategoryLabel.style.opacity = 1
    for (i = 0; i < checkBoxes.length; i++) {
        let checkBox = checkBoxes[i]
        let label = checkBoxLabels[i]
        checkBox.style.opacity = 1
        label.style.opacity = 1
    }
    letsStartButton.style.opacity = 1
}

letsStartButton.onclick = function() {startQuestioningUser()}

reframeLetsStartButton()
updateLetsStartButtonText()
setupCheckBoxes()
reframeSelectCategoryLabel()
updateCategoryLabelText()
learningPanel.append(selectCategoryLabel)
learningPanel.append(letsStartButton)
