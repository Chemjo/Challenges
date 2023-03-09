/*---------------------------------------------------------------------------------------------------------------------
Author: Chase Johns
Last Modified: 3/9/2023
Description: Car Child Class for OOP Challenges
---------------------------------------------------------------------------------------------------------------------*/

//Challenge 3: Initial Car Variable, Properties, Constructor, and Implementation of Turn from Vehicle

public class Car extends Vehicle{

    //Constructor to set rotation values, assign LAND medium, and call Vehicle's constructor
    public Car() {
        super();
        this.steeringRotation = 0;
        this.tireRotation = 0;
        super.media.add(Medium.LAND);
    }

    //Only accessible in Car
    private Double steeringRotation;

    //Read-only outside car; must be between -90 and 90, inclusive
    public Double tireRotation{get;
        private set{
            if(value < -90){
                value = -90;
            }
            if(value > 90){
                value = 90;
            }
        }
    }

    //Read-only outside of class
    public Integer gear {get; private set;}

    //Turn Implementation
    public void turn(Double degrees){
        //Changing our steering rotation based on input
        steeringRotation += degrees;
        //Steering rotation must be between -1440 and 1440 inclusive
        if(steeringRotation < -1440){
            steeringRotation = -1440;
        }
        if(steeringRotation > 1440){
            steeringRotation = 1440;
        }
        /*Changing our tire rotation by 1/16 of our specified degrees
          The validity check for proper range is in the property delcaration*/
          tireRotation += (degrees/16);
    }
}