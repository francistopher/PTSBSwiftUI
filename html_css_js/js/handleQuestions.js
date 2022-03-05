var checkBoxesSelected = [false, false, false, false, false]
var theQuestions = []
var theAnswers = []
var currentQuestionIndex = 0
var questionsCorrectCount = 0

function addSymbolQuestion(selectedElement) {
    if (checkBoxesSelected[0]) {
        let question = "What is the symbol for the element <i>" + periodicTableData[selectedElement]['name'] + "</i>?"
        let answer = periodicTableData[selectedElement]['symbol']
        theQuestions.push(question)
        theAnswers.push(answer)
    }
}

function addNameQuestion(selectedElement) {
    if (checkBoxesSelected[1]) {
        let question = "What is the element for the symbol <i>" + periodicTableData[selectedElement]['symbol'] + "</i>?"
        let answer = periodicTableData[selectedElement]['name']
        theQuestions.push(question)
        theAnswers.push(answer)
    }
}

function addAtomicNumberQuestion(selectedElement) {
    if (checkBoxesSelected[2]) {
        let question = "What is the atomic number for the element <i>" + periodicTableData[selectedElement]['name'] + "</i>?"
        let answer = periodicTableData[selectedElement]['atomicNumber']
        theQuestions.push(question)
        theAnswers.push(answer)
    }
}

function addAtomicMassQuestion(selectedElement) {
    if (checkBoxesSelected[3]) {
        var atomicMass = periodicTableData[selectedElement]['atomicMass']
        let parenthesisIndex = atomicMass.indexOf('(')
        if (parenthesisIndex != -1) {
            atomicMass = atomicMass.substr(0, parenthesisIndex)
        }
        let question = "What is the atomic mass (g/mol) for the element <i>" + periodicTableData[selectedElement]['name'] + "</i>?"
        let answer = atomicMass
        theQuestions.push(question)
        theAnswers.push(answer)
    }
}

function addElectronConfigurationQuestion(selectedElement) {
    if (checkBoxesSelected[4]) {
        let question = "What is the electron configuration for the element <i>" + periodicTableData[selectedElement]['name'] + "</i>?"
        let answer = periodicTableData[selectedElement]['electronicConfiguration']
        theQuestions.push(question)
        theAnswers.push(answer)
    }
}

function getRandomInt(max) {
    return Math.floor(Math.random() * Math.floor(max));
  }

function shuffleAnswersAndQuestions() {
    for (i = 0; i < theQuestions.length; i++) {
        let randomInt = getRandomInt(theQuestions.length)
        // Switch two random questions
        let tempQuestion = theQuestions[i]
        theQuestions[i] = theQuestions[randomInt]
        theQuestions[randomInt] = tempQuestion
        // Switch two random answers
        let tempAnswer = theAnswers[i]
        theAnswers[i] = theAnswers[randomInt]
        theAnswers[randomInt] = tempAnswer
    }
}

function generateQuestionsAndAnswers() {
    theQuestions = []
    theAnswers = []
    for (i = 0; i < elementsSelectedForReview.length; i++) {
        let selectedElement = elementsSelectedForReview[i] - 1
        addSymbolQuestion(selectedElement)
        addNameQuestion(selectedElement)
        addAtomicNumberQuestion(selectedElement)
        addAtomicMassQuestion(selectedElement)
        addElectronConfigurationQuestion(selectedElement)
    }
    shuffleAnswersAndQuestions()
}

function updateQuestionLabelText() {
    questionLabel.innerHTML = theQuestions[currentQuestionIndex]
}

function startTheQuestioning() {
    questionLabel.style.opacity = 1
    scoreLabel.style.opacity = 1
    answerTextBox.style.opacity = 1
    submitContinueButton.style.opacity = 1
    answerTextBox.style.zIndex = 10
    submitContinueButton.style.zIndex = 10
    updateQuestionLabelText()
}

function showPercentageScore() {
    var theFinalScore = ((questionsCorrectCount / theQuestions.length) * 100)
    theFinalScore = Math.round(theFinalScore * 100) / 100
    scoreLabel.innerHTML = 'Final Score: ' + theFinalScore + '%'
}

var readyToSubmitAnswer = true
var noMoreQuestions = false
function submitAnswerOrContinue() {
    if (learningPanel.style.opacity == 1) {
        if (!noMoreQuestions) {
            if (readyToSubmitAnswer) {
                if (theAnswers[currentQuestionIndex] == answerTextBox.value) {
                    answerTextBox.style.borderColor = 'lightgreen'
                    questionsCorrectCount += 1
                } else {
                    answerTextBox.style.borderColor = 'red'
                    answerTextBox.value = theAnswers[currentQuestionIndex]
                }
                if (theQuestions.length - 1 > currentQuestionIndex) {
                    answerTextBox.readOnly = true
                    readyToSubmitAnswer = false
                    submitContinueButton.innerHTML = 'Continue'
                } else {
                    showPercentageScore()
                    noMoreQuestions = true
                    answerTextBox.readOnly = true
                    submitContinueButton.innerHTML = 'Exit'
                }
            } else {
                answerTextBox.style.borderColor = 'black'
                answerTextBox.value = ''
                answerTextBox.readOnly = false
                currentQuestionIndex += 1
                updateQuestionLabelText()
                submitContinueButton.innerHTML = 'Submit'
                readyToSubmitAnswer = true
            }
        } else {
            showCategorySelection()
            hideQuestioningElements()
            answerTextBox.style.zIndex = 0
            submitContinueButton.style.zIndex = 0
            scoreLabel.innerHTML = ''
            questionLabel.innerHTML = ''
            questionsCorrectCount = 0
            answerTextBox.style.borderColor = 'black'
            answerTextBox.value = ''
            answerTextBox.readOnly = false
            currentQuestionIndex = 0
            submitContinueButton.innerHTML = 'Submit'
            readyToSubmitAnswer = true
            noMoreQuestions = false
            exitFromTheLearningPanel()
        }
    }
}

submitContinueButton.onclick = function() {submitAnswerOrContinue()}
