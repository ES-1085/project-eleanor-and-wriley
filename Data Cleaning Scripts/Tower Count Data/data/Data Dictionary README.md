##Tower Count Data Dictionary

##Raw Data Files

The column headers and data organization varies based on year in these datafiles. Hence the need for a script to clean them. There are wide differences. Generally, there is a column for the date, columns for the day's count of several species, and a column for notes or other species counts.  

##Cleaned Data File

This file will write to whatever filepath is specified in the write_csv command. This should be a long, not wide, data frame with five columns:

`date` : date of the observation
`species` :species or grouped species that was observed
`count` : number of individuals of that species observed
`notes` : information recorded in the "other" or "notes" column on the day of the observation. The splitcomments function works upon this column, so much of this information will likely be redundant.
`year` : the year of the observation, for easier visualization. 

In order to add new years to the clean data file, those years' data MUST be in EXACTLY this format. If they are, then it's a simple matter to bind them into the clean dataset. If this datafile is updated, the data file in the shiny app folder must be replaced with a new file for the app to update with the new data. 