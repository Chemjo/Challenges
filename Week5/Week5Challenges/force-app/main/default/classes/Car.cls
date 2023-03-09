/*---------------------------------------------------------------------------------------------------------------------
Author: Chase Johns
Last Modified: 3/9/2023
Description: Car Child Class for OOP Challenges
---------------------------------------------------------------------------------------------------------------------*/

//Challenge 3: Initial Car Variable, Properties, Constructor, and Implementation of Turn from Vehicle

public class Car extends Vehicle{

    //Constructor to set rotation values, assign LAND medium, and call Vehicle's constructor
    // public Car() {
    //     super();
    //     this.steeringRotation = 0;
    //     this.tireRotation = 0;
    //     super.media.add(Medium.LAND);
    // }

    //Challenge 4: Allowing for Constructor chaining for Vehicle in Car

        //Full Vehicle Args
        public Car(String name, Integer capacity, Integer occupants, Integer speed){
            super(name,capacity,occupants,speed);
            this.steeringRotation = 0;
            this.tireRotation = 0;
            super.media.add(Medium.LAND);
        }
    
        //3 Vehicle Args
        public Car(String name, Integer capacity, Integer occupants){
            this(name,capacity,occupants,0);
        }
    
        //2 Vehicle Args
        public Car(String name, Integer capacity){
            this(name,capacity,0);
        }
    
        //1 Vehicle Arg
        public Car(String name){
            this(name,1);
        }
    
        //No Args
        public Car(){
            this('');
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

    //Challenge 4: Overriding the Accelerate Method
    public override void accelerate(Integer speedChange){
        super.accelerate(speedChange);
        Gear = (Integer)Math.ceil(0.4444 * (Math.sqrt(Speed)));
    }
}