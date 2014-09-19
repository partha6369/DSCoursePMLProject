The final predictions are as follows.
-1  : B 
-2  : A 
-3  : C (as per SVM, A as per RF)
-4  : A 
-5  : A 
-6  : E 
-7  : D 
-8  : B 
-9  : A 
-10 : A 
-11 : B 
-12 : C 
-13 : B 
-14 : A 
-15 : E 
-16 : E 
-17 : A 
-18 : B 
-19 : B 
-20 : B



answers = c("B", "A", "A", "A", "A", "E", "D", "B", "A", "A", "B", "C", "B", "A", "E", "E", "A", "B", "B", "B")

pml_write_files = function(x){
  n = length(x)
  for(i in 1:n){
    filename = paste0("problem_id_",i,".txt")
    write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
  }
}

pml_write_files(answers)