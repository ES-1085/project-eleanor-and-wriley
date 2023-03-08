Exploring Long-Term Datasets from Great Duck Island
================
by Eleanor and Wriley

## Summary

## Methods/Data Collection



## Navigating the Project Folder

This README should be the first thing you see upon opening the folder. There are several sub-folders containing RMD and MD files. Each sub-folder should have its own data folder for the data that those files rely upon.

We mainly focused on two long-term monitoring projects: Tower Count and Colony Mapping. 

The `Data Cleaning Scripts` folder contains code that we wrote to clean up long-term data sheets and bind them into clean, master dataframes. 

`Tower Count Data` contains:
-`tower_count_data_cleaning.rmd` : the RMD file used to clean 20 years worth of tower count data and combine those files into one master data sheet
-`tower_count_data_cleaning_use_guide.md` : A markdown file that explains the functions used in the RMD file, meant to ease the process of adding future years' data
-`data` : a folder that contains the raw datasheets from 2000 - 2022, a data dictionary for those files, and the clean csv file output by the data cleaning rmd file.

The `Cleaning Nest Counts and Mapping Data` folder contains code that we wrote to 


The `proposal` folder contains our original proposal for the project, including a data folder that the proposal.rmd file relies on, a dictionary for that data folder, and the exploratory visuals we created for our proposal.

The `presentation` folder contains code and files used to build our presentation in Google Slides, which can be accessed here:  , it contains:

-`data`: a data folder for the clean data files that the presentation.rmd file draws upon. A data dictionary is included.
-`presentation.rmd`:  the RMD file that we used to create our presentation graphics 
-`presentation.md` : a knit markdown version of our presentation figures


The `towercount_shinyapp` folder contains necessary files for the Tower Count shiny app, which can be found here:  . It contains a data folder for the data file that the app draws upon, a dictionary for that datafolder, and a README with instructions on how to use and update the app. 



## Summary of Findings

### Tower Count
### Colony Dynamics


## Looking to the Future



Write-up of your project and findings go here. Think of this as the text
of your presentation. The length should be roughly 5 minutes when read
out loud. Although pacing varies, a 5-minute speech is roughly 750
words. To use the word count addin, select the text you want to count
the words of (probably this is the Summary section of this document, go
to Addins, and select the `Word count` addin). This addin counts words
using two different algorithms, but the results should be similar and as
long as you’re in the ballpark of 750 words, you’re good! The addin will
ignore code chunks and only count the words in prose.

You can also load your data here and present any analysis results /
plots, but I strongly urge you to keep that to a minimum (maybe only the
most important graphic, if you have one you can choose). And make sure
to hide your code with `echo = FALSE` unless the point you are trying to
make is about the code itself. Your results with proper output and
graphics go in your presentation, this space is for a brief summary of
your project.

## Presentation

Our presentation can be found [here](presentation/presentation.html). You can update this link to a Google Slides link.

## Data

Include a citation for your data here. See
<http://libraryguides.vu.edu.au/c.php?g=386501&p=4347840> for guidance
on proper citation for datasets. If you got your data off the web, make
sure to note the retrieval date.

## References

List any references here. You should, at a minimum, list your data
source.
