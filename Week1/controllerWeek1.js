//--------------------------------------Javascript file for Chase's Week 1 Challenges--------------------------------------

//--------------------------------------Challenge IV: Adding an item to a stored list--------------------------------------

let myList = [];    //Array declaration with empty assignment


function add(item){     //Function to add one item to the list via a push
    myList.push(item);
}

//--------------------------------------Challenge V: Printing all Items in an Alert--------------------------------------

function printer(){     //Function to print the entire list
    if(myList === undefined || myList.length == 0){      //Checks for cases in which there is nothing to print
        alert("Hey, you're trying to make me print nothing? Sorry, no dice.")
    }
    
    for(let item in myList){        //Iterates over the array and sends out an alert for each entry's value
        alert(myList[item]);
    }
}

//--------------------------------------Challenge VI: Making a Clickable Button to Print--------------------------------------

let printButton = document.querySelector("#printer"); //Querying for our button
printButton.addEventListener("click", printer); //Allowing for the printList function to run on each button click
