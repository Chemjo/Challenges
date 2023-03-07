// Write your anonymous apex in this file and run the Execute Anonymous Apex command to run the code from your org.
//force:apex:execute -f aexec/anon.apex > aexec/log.txt

Calculator myCalc = new Calculator();

//Both Positive Uneven Test
System.debug(myCalc.divide(55, 8)); //6
//Both Negative Test
System.debug(myCalc.divide(-47, -12)); //3
//Negative Dividend Test
System.debug(myCalc.divide(-11, 2)); //-5
//Negative Divisor Test
System.debug(myCalc.divide(14, -5)); //-2

//Dividend is Smaller Test
System.debug(myCalc.divide(4,44)); //0
