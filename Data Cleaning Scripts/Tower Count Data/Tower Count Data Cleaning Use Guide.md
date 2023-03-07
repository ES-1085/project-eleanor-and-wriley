##Tower Count Data Cleaning Use Guide

This is a RMD file that defines functions to clean old tower count data and creates a new, clean, CSV file with every year of tower count data combined. This README file provides information on how the functions work and how they can and should be updated. 



Three functions are defined in the RMD file:

cleancolumns (column rename function):

This function takes files that have inconsistent names for data columns related to species and standardizes them. For example, across the years, columns containing counts of herring gulls have been named "herg","HeGu","HERGs", etc. 


splitcomments

selectcolumns