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

/*Declaring and initializing a variable to store a Pokemon's name
  For Challenges 2-4, this will be hard-coded to Nidoking      */
let pokemon = "Nidoking";
//Declaring and initializing our fetch button
let fetcher = document.querySelector("#poke-fetcher");
//Adding the click event listener
fetcher.addEventListener("click",fetchPokemon);
//Implementing our first draft fetchPokemon() function
function fetchPokemon(){
    //Function call to ensure our Pokemon name can be read by the Pokemon API
    pokemon = nameFormatter(pokemon);
    //Declaring and initalizing our request to be fetched
    const request = new Request("https://pokeapi.co/api/v2/pokemon/" + pokemon);
    /*Declaring and initializing our response from the Pokemon API using the Fetch API
      In order to do this without using async or await, we need to string together our
      fetching with a .then() call for returning our json object followed by another
      to pass our data to the pokeDisplay function*/
    const reply = fetch(request).then((response) => response.json()).then((data) => pokeDisplay(data));
}
/*Implementing our function to format names for the Pokemon API 
  We'll account for changing it to lowercase and replacing any spaces  */
function nameFormatter(name){
    name = name.toLowerCase();
    name = name.replace(" ","-");
    return name;
}
//Implementing our first draft function to display our Pokemon's info
function pokeDisplay(fetchedPokemon){
    //Declaring variable to store a Pokemon's name
    let pokeName = fetchedPokemon.name;
    //Capitalizing the first letter
    pokeName = pokeName[0].toUpperCase() + pokeName.substr(1);
    alert(pokeName);
}