// Write your anonymous apex in this file and run the Execute Anonymous Apex command to run the code from your org.
//force:apex:execute -f aexec/anon.apex > aexec/log.txt

Calculator myCalc = new Calculator();

//Zero Tests
System.debug(myCalc.divide(55, 0)); //0

System.debug(myCalc.divide(0, 32)); //0

