/*---------------------------------------------------------------------------------------------------------------------
Author: Chase Johns
Last Modified: 3/9/2023
Description: Vehicle Parent Class for OOP Challenges
---------------------------------------------------------------------------------------------------------------------*/

public class Vehicle {
    /*Challenge 1: Preparing our instance variables, constants , and properties
    Medium, Speed, Name, Occupants, Capacity, and Media*/

    public enum Medium {LAND,AIR,WATER}

    //Cannot be negative; read-only outside of class
    public Integer speed{
        get;
        private set{
            //If our Speed is negative, switch signs
            if(value < 0){
                value *= -1;
            }
        }
    }

    //Read-only outside of class
    public String name {get; private set;}

    //Cannot be negative
    public Integer occupants{
        get;
        set{
            //If our Number of Occupants is negative, switch signs
            if(value < 0){
                value *= -1;
            }
        }
    }

    //Must at least be one; validation built into constructor
    public final Integer capacity;

    //List of our Media only accesible to Vehicle and its children
    protected List<Medium> media;
        
}
