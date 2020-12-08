library(ggplot2)
### Covid Positive test Bayes Explore
##Parameters
##Base rate = 1/100, FP - 1% , FN - 10%

###1 test case
##Assume test comes back positive

base <- p_1_test

fp <- 0.01

fn <- 0.1

p_1_test <- ((base)*(1-fp))/(base*(1-fp) + ((1-base)*fp))


p_2_test <- (base*(1-fp)^2)/((base)*(1-fp)^2 + (1-base)*(fp)^2) 


#Function for positive test result


amIPos <- function(base, fp, fn, num_test, test_result){
  #Base --- base rate of covid in your Area -- Positivity rate is a good substitute (float)
  # fp  --- false positive rate (float)
  #fn   -- false negative rate (float)
  #test_result -- vector with 1 for positive 0 for negative
  if(length(test_result) != num_test ){
    print("Number of tests not equal to result array")
  }
  
  else{
  tp <- (1-fp)
  tn <- (1-fn)
  #Initialize prios
  prior <- base
  
  #Vector for posteriors
  pos <- rep(NA, num_test)
  for(i in 1:num_test){
    if(test_result[i] == 1){
      result <- (prior *tp)/(prior*tp + (1-prior)*fp) 
    }
    else{
      result <- ((prior)*fn)/((1-prior)*tn + (prior)*fn)
    }
    pos[i] <- result
    prior <- result
    
  }
  result_df <- data.frame(test_num = 1:num_test, pos, test_res = as.factor(test_result))
  plot <- ggplot2::ggplot(result_df) + geom_point(aes(test_num, pos*100, color = test_res )) + geom_line(aes(test_num, pos*100)) + scale_x_continuous(name = "Test Number", labels = seq(1,num_test,1), breaks = seq(1,num_test,1) ) + scale_y_continuous(name = "%  I am positive") + ggtitle("Am I positive?") + geom_text(aes(x = jitter(test_num), y = jitter(pos*100),label = round(pos*100,4)))
  return(plot)
  }
}



