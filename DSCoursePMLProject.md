---
title: "Practical Machine Learning Project"
author: "Partha Majumdar"
date: "18 September 2014"
output: html_document
---


```
## Type 'citation("pROC")' for a citation.
## 
## Attaching package: 'pROC'
## 
## The following objects are masked from 'package:stats':
## 
##     cov, smooth, var
```

#Executive Summary

##Introduction

This document (as a HTML file) is created as a part of the Practical Machine Learning Course in the Data Science Specialisation from John Hopkins University through Coursera. This document is created using RStudio.

The objective of this project is to use the data provided by Groupware@LES for their HAR Project (http://groupware.les.inf.puc-rio.br/har) and create a model for predicting the Class of the user using the different exercising equipment. The data provided by the group have been split into Training set and Testing set and are provided at https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv and https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv respectively.

The document first provides the outcome of the model before proceeding to detail the method of establishing the model.

##Summary of Outcome from the Model

Two methods were applied after determining the predictors - Random Forest (RF) method and Support Vector Machine (SVM) method. The predictions from the 2 models were different for only one test case.

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

#Method of model preparation

##Data Preparation

Instead of using the links to obtain the data, the data for both the training and testing set was downloaded from the provided links and used in the project. To reproduce the analysis, one would need either downloading the apriori and storing it in the working directory OR making appropriate change to the code to obtain the data.





























