public with sharing class Calculator {
    
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



}