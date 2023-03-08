// Write your anonymous apex in this file and run the Execute Anonymous Apex command to run the code from your org.
//force:apex:execute -f aexec/anon.apex > aexec/log.txt

DataLord dl = new DataLord();

System.debug(dl.bigFive());