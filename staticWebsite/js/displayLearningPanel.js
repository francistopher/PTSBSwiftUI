const learningPanel = document.getElementById('learningPanel')
const questionLabel = document.createElement('label')
const scoreLabel = document.createElement('label')
const answerTextBox = document.createElement('input')
const submitContinueButton = document.createElement('button')
var lpUnitLength = 0

function hideQuestioningElements() {
    questionLabel.style.opacity = 0
    scoreLabel.style.opacity = 0
    answerTextBox.style.opacity = 0
    submitContinueButton.style.opacity = 0
}

function setupScoreLabel() {
    scoreLabel.style.textAlign = 'center'
    scoreLabel.style.position = 'absolute'
    setSize(scoreLabel, lpUnitLength * 5, lpUnitLength)
    setPosition(scoreLabel, lpUnitLength * 3.5, lpUnitLength * 8)
    scoreLabel.style.fontSize = (lpUnitLength * 0.5) + 'px'
    scoreLabel.style.backgroundColor = 'yellow'
    scoreLabel.style.borderColor = 'black'
    scoreLabel.innerHTML = ''
    setBorderStyle(scoreLabel, lpUnitLength * 0.05, lpUnitLength * 0.25)
    learningPanel.appendChild(scoreLabel)
    scoreLabel.style.opacity = 1
}

function setupSubmitContinueButton() {
    submitContinueButton.style.textAlign = 'center'
    submitContinueButton.style.position = 'absolute'
    setSize(submitContinueButton, lpUnitLength * 3, lpUnitLength)
    setPosition(submitContinueButton, lpUnitLength * 4.5, lpUnitLength * 10.25)
    submitContinueButton.style.fontSize = (lpUnitLength * 0.5) + 'px'
    submitContinueButton.style.backgroundColor = 'pink'
    submitContinueButton.style.borderColor = 'black'
    submitContinueButton.innerHTML = 'Submit'
    setBorderStyle(submitContinueButton, lpUnitLength * 0.05, lpUnitLength * 0.25)
    learningPanel.appendChild(submitContinueButton)
    submitContinueButton.style.opacity = 1
}

function setupQuestionLabel() {
    questionLabel.style.textAlign = 'center'
    questionLabel.style.position = 'absolute'
    setSize(questionLabel, lpUnitLength * 10, lpUnitLength * 4)
    setPosition(questionLabel, lpUnitLength, lpUnitLength)
    questionLabel.style.fontSize = (lpUnitLength * 0.75) + 'px'
    questionLabel.style.backgroundColor = 'yellow'
    learningPanel.appendChild(questionLabel)
    questionLabel.style.opacity = 1
}

function setupAnswerTextBox() {
    answerTextBox.setAttribute('type', 'text')
    answerTextBox.style.position = 'absolute'
    answerTextBox.style.textAlign = 'center'
    answerTextBox.style.padding = '0px'
    answerTextBox.id = 'answer'
    answerTextBox.name = 'answer'
    answerTextBox.contentEditable = true
    setSize(answerTextBox, lpUnitLength * 7, lpUnitLength)
    setPosition(answerTextBox, lpUnitLength * 2.5, lpUnitLength * 5.5)
    answerTextBox.style.fontSize = (lpUnitLength * 0.4) + 'px'
    answerTextBox.style.backgroundColor = 'pink'
    answerTextBox.style.opacity = 0
    answerTextBox.placeholder = 'Enter Answer Here'
    answerTextBox.contentEditable = true
    answerTextBox.readOnly = false
    answerTextBox.style.borderColor = 'black'
    setBorderStyle(answerTextBox, lpUnitLength * 0.06, lpUnitLength * 0.25)
    learningPanel.appendChild(answerTextBox)
}

function reframeLearningPanel() {
    let sideLength = screenHeight * 0.6
    setSize(learningPanel, sideLength, sideLength)
    setPosition(learningPanel, (screenWidth - sideLength) * 0.8, (screenHeight - sideLength)  * 0.5)
    setBorderStyle(learningPanel, sideLength * 0.01, sideLength * 0.1)
    lpUnitLength = learningPanel.clientWidth / 12
}

var learningPanelOpacity = 0.0
function showLearningPanel() {
    learningPanelOpacity += 0.02
    learningPanel.style.opacity = learningPanelOpacity
    if (learningPanel.style.opacity < 1) {
        setTimeout(() => {showLearningPanel()}, 10)
    } else {
        learningPanelOpacity = 1.0
        learningPanel.style.opacity = 1
    }
}

function hideLearningPanel() {
    learningPanelOpacity -= 0.02
    learningPanel.style.opacity = learningPanelOpacity
    if (learningPanel.style.opacity > 0) {
        setTimeout(() => {hideLearningPanel()}, 10)
    } else {
        learningPanelOpacity = 0
        learningPanel.style.opacity = 0
    }
}

function hoverOnOffSubmitContinueButton(hovering, button) {
    if (hovering) {
        button.style.backgroundColor = 'orange'
    } else {
        button.style.backgroundColor = 'pink'
    }
}

function exitFromTheLearningPanel() {
    hideLearningPanel()
    translateElementImage(false)
    showMainPage(false)
}

submitContinueButton.onmouseover = function() {hoverOnOffSubmitContinueButton(true, submitContinueButton)}
submitContinueButton.onmouseout = function() {hoverOnOffSubmitContinueButton(false, submitContinueButton)}

reframeLearningPanel()
setupQuestionLabel()
setupAnswerTextBox()
setupSubmitContinueButton()
setupScoreLabel()
