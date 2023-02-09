//--------------------------------------Javascript file for Chase's Week 1 Challenges--------------------------------------

//--------------------------------------Challenge IV: Adding an item to a stored list--------------------------------------

let myList = [];    //Array declaration with empty assignment

function add(item,myList){  //Function to add one item to the list via a push
    myList.push(item);
}

//--------------------------------------Challenge V: Printing all Items in an Alert--------------------------------------

function printList(myList){ //Function to print the entire list
    let printList = "List of Items:\n";
    for(let item in myList){
        printList.concat(item+"\n");
    }
    alert(printList);
}