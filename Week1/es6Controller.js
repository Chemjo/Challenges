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
let currentPokemon = "Nidoking";
//Declaring and initializing our fetch button
let fetcher = document.querySelector("#poke-fetcher");
//Adding the new click event listener that calls instead for our new updatePokemon() function
fetcher.addEventListener("click",updatePokemon);

//Challenge 3 Additions: Querying and caching our header and paragraph
let nameDisplay = document.querySelector("#name-display");
let healthDisplay = document.querySelector("#health-display");

//Implementing our second draft fetchPokemon() function
async function fetchPokemon(pokemon){
    //Function call to ensure our Pokemon name can be read by the Pokemon API
    pokemon = nameFormatter(pokemon);
    //Declaring and initalizing our request to be fetched
    const request = new Request("https://pokeapi.co/api/v2/pokemon/" + pokemon);
    /*Declaring and initializing our response from the Pokemon API using the Fetch API
      Now that this is an asynchronous function, we can use the await keyword to simplify our syntax*/
    const reply = await fetch(request);
    //Passing our reply to the display function
    return reply.json();
}
/*Implementing our function to format names for the Pokemon API 
  We'll account for changing it to lowercase and replacing any spaces  */
function nameFormatter(name){
    name = name.toLowerCase();
    name = name.replace(" ","-");
    return name;
}
//Implementing our second draft function to display our Pokemon's info
function pokeDisplay(fetchedPokemon){
    //Declaring variable to store a Pokemon's name
    let pokeName = fetchedPokemon.name;
    //Capitalizing the first letter
    pokeName = pokeName[0].toUpperCase() + pokeName.substr(1);
    //Challenge 3 Additions: Getting HP and displaying to header and paragraph instead of pushing an alert
    let pokeHealth = fetchedPokemon.stats[0].base_stat;
    nameDisplay.innerHTML = pokeName;
    healthDisplay.innerHTML = "Base HP: " + pokeHealth;
}

function updatePokemon(){
    fetchPokemon(currentPokemon).then(response => pokeDisplay(response));
}