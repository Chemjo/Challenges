//--------------------------------------Javascript file for Chase's Week 1 Challenges--------------------------------------

//--------------------------------------Challenge IV: Adding an item to a stored list--------------------------------------

//Array declaration with empty assignment
let myList = [];                                                                

//Function to add one item to the list via a push
function add(item){  
    myList.push(item);
}

//--------------------------------------Challenge V: Printing all Items in an Alert--------------------------------------

//Function to print the entire list
function printer(){                    
    //Checks for cases in which there is nothing to print                                         
    if(myList === undefined || myList.length == 0){                             
        alert("Hey, you're trying to make me print nothing? Sorry, no dice.")
    }
    //Iterates over the array and sends out an alert for each entry's value
    for(let item in myList){                                                    
        alert(myList[item]);
    }
}

//--------------------------------------Challenge VI: Making a Clickable Button to Print--------------------------------------

//Querying for our print button
let printButton = document.querySelector("#printer");     
//Allowing for the printer function to run on each button click                      
printButton.addEventListener("click", printer);                                 

//--------------------------------------Challenge VII: Adding an Input Box & Button that Utilizes the .add(item) Function--------------------------------------

//Querying for our add-to-list button
let addButton = document.querySelector("#add-button");           
//Querying for our text input               
let listTextbox = document.querySelector("#list-text-input");                   

//Adding event listener with our function to verify for valid additons
addButton.addEventListener("click", addChecker);              

function addChecker(){
    if(listTextbox.value != ``){
        add(listTextbox.value);
        listTextbox.value = ``;
    }
    else{
        alert("You can't add *nothing* to something and expect me to entertain that.");
    }
}
