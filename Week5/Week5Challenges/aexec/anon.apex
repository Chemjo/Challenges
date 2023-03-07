// Write your anonymous apex in this file and run the Execute Anonymous Apex command to run the code from your org.
//force:apex:execute -f aexec/anon.apex > aexec/log.txt

Calculator myCalc = new Calculator();

//Both Positive w/ Remainder
System.debug(myCalc.mod(49,8)); //1
//Both Negative w/ Remainder
System.debug(myCalc.mod(-49,-8)); //1
//Negative Dividend with Remainder
System.debug(myCalc.mod(-49,8)); //-1
//Negative Divisor with Remainder
System.debug(myCalc.mod(49,-8)); //-1
//No Remainder 
System.debug(myCalc.mod(48,8)); //0
//Zero Tests
System.debug(myCalc.mod(55, 0)); //0
System.debug(myCalc.mod(0, 32)); //0

