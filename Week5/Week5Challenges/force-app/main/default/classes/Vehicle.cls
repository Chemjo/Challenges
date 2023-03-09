/*---------------------------------------------------------------------------------------------------------------------
Author: Chase Johns
Last Modified: 3/9/2023
Description: Vehicle Parent Class for OOP Challenges
---------------------------------------------------------------------------------------------------------------------*/

public abstract class Vehicle {
    
    //Challenge 2: Default-Values No-Arg Constructor
    // public Vehicle(){
    //     this.speed = 42;
    //     this.name = 'The Bridge 4';
    //     this.occupants = 100;
    //     this.capacity = 250;
    // }

    //Challenge 4: New Constructor Chain

    //Full Args
    public Vehicle(String name, Integer capacity, Integer occupants, Integer speed){
        this.speed = speed;
        this.name = name;
        this.occupants = occupants;
        //Capacity must be at least 1
        if(capacity < 1){
            this.capacity = 1;
        }else{
            this.capacity = capacity;
        }
    }

    //3 Args
    public Vehicle(String name, Integer capacity, Integer occupants){
        this(name,capacity,occupants,0);
    }

    //2 Args
    public Vehicle(String name, Integer capacity){
        this(name,capacity,0);
    }

    //1 Arg
    public Vehicle(String name){
        this(name,1);
    }

    //No Args
    public Vehicle(){
        this('');
    }
    
    /*Challenge 1: Preparing our instance variables, constants , and properties
    Medium, Speed, Name, Occupants, Capacity, and Media*/

    public enum Medium {LAND,AIR,WATER}

    //Cannot be negative; read-only outside of class
    public Integer speed{
        get;
        private set{
            //If our Speed is negative, set to 0
            if(value < 0){
                value = 0;
            }
        }
    }

    //Read-only outside of class
    public String name {get; private set;}

    //Cannot be negative
    public Integer occupants{
        get;
        set{
            //If our Number of Occupants is negative, set to 0
            if(value < 0){
                value = 0;
            }
        }
    }

    //Must at least be one; validation built into constructor
    public final Integer capacity;

    //List of our Media only accesible to Vehicle and its children
    protected List<Medium> media;

    //Challenge 2 Methods
    public virtual void accelerate(Integer speedChange){
        /*Sets the new Speed to our current + or - the change, based on its sign
          Based on our property declaration, if the speed would become negative, it remains at 0*/ 
        speed = speed+speedChange;
    }

    //Will be implemented by Car later
    abstract void turn(Double degrees);

    //ToString method to return our Vehicle to a nicely formatted string
    public override String toString(){
        return 'Vehicle Name:\n\t' + name +
               '\nCurrent Speed:\n\t' + speed +
               '\nNumber of Occupants:\n\t' + occupants +
               '\nMedia\n\t' + media;
    }

    //Printer Version of ToString
    public void toStringPrint(){
        System.debug(toString());
    }
        
}
