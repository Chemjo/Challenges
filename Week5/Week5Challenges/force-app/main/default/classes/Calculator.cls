/*---------------------------------------------------------------------------------------------------------------------
Author: Chase Johns
Last Modified: 3/7/2023
Description: Calculator class comprised of mathematical methods for Coding Challenges
---------------------------------------------------------------------------------------------------------------------*/

public class Calculator {
    
    public Integer add(Integer x, Integer y){
        return x+y;
    }

    public Integer multiply(Integer base, Integer timesLooper){
        
        Integer product = 0;
        
        if(base < 0){
            base = 0 - base;
            timesLooper = 0 - timesLooper;
        }

        for(Integer i = 0; i < timesLooper; i++){
            product = add(base, product);
        }

        return product;
    }

    public Integer divide(Integer dividend, Integer divisor){
        /*---------------------------------------------------------------------------------------------------------------------
        Challenge 3:
        *We need to think with subtraction in mind.
        *Essentially, if we used a loop, the number of times we loop will be our quotient.
        *We need to decrement while checking if the dividend is less than or greater to the divisor.
        *Since it is an Integer, if the dividend is less, we know we're done.
        *We also need to account for sign changes.
        *We need our divisor to subtract from the dividend
            -We also need to accurately compare greater/lesser, so we can't actually change signs
            -Pass in 0-divisor to add()
        *Let's do this by:
        *1) Checking signs
            -If both are positive or negative, no need to change the quotient sign
            -If one is negative, set quotient to negative

        Challenge 4:
        *We simply need to check if the divisor is 0 and account for that
        *Let's do that before checking anything else
        ---------------------------------------------------------------------------------------------------------------------*/
        //Check if our divisor is 0
        if(divisor == 0){
            return 0;
        }

        //Declaring our returned quotient
        Integer quotient = 1;
        //Declaring our Boolean to track quotient sign
        Boolean isNegative = false;
        //Declaring a Boolean to check if we ever enter the below while-loop
        Boolean couldNotDivide = true;
        //Check if only one of the parameters is negative
        if((divisor < 0 && dividend > 0) || (divisor > 0 && dividend < 0)){
            //Sets to negative
            isNegative = true;
        }
        //Separately, let's ensure our values are both positive for simplicity
        if(divisor < 0){
            divisor = 0 - divisor;
        }
        if(dividend < 0){
            dividend = 0 - dividend;
        }
        //While loop to check if the dividend is greater than or equal to the divisor
        while(dividend > divisor){
            //Record that we could divide
            couldNotDivide = false;
            //Subtract our divisor from the dividend without changing the divisor's value
            dividend = add(dividend,0-divisor);
            //Increment our quotient only if our divident is STILL greater to account for remainders
            if(dividend > divisor){
                quotient++;
            }
        }
        //Simply return 0 if we could never divide
        if(couldNotDivide){
            return 0;
        }
        //Check if our quotient is negative, and if so change the sign
        if(isNegative){
            quotient = 0 - quotient;
        }
        //Return our final value
        return quotient;
    }

}