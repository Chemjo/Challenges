/*----------------------------------------
    ES6 Challenge Controller
----------------------------------------*/

/*----------------------------------------
    Challenge 1: The Wait Button
----------------------------------------*/

//First, let's query for our button and header and store them
let waitButton = document.querySelector("#wait-button");
let waitDisplay = document.querySelector("#wait-display");
//Next, we'll add our event listener for clicks
waitButton.addEventListener("click",workingTrigger);

//Finally, we need to implement our workingDelay and workingFinish Functions
//This function reassigns the header's value and sets the delay for 
function workingTrigger(){
    waitDisplay.innerHTML = "Working, Please Wait";
    setTimeout(workingFinish,5000);
}

//This function resets the header to its original state
function workingFinish(){
    waitDisplay.innerHTML = "Waiting";
}

/*------------------------------------------------------------
    Challenges 2-5: Fetching Nidoking through Sheer Force
------------------------------------------------------------*/