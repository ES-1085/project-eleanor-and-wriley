Exploring Great Duck Island Through Data
================
Eleanor and Wriley

``` r
library(tidyverse)
library(broom)
```

## 1. Introduction

In this project, we will use existing data about the seabirds breeding
on Great Duck Island to explore their ecologies and distributions. Much
of this data was collected for long-term monitoring or for student
projects that have been completed. We hope that by re-visiting some of
this data from a higher-level and data-focused perspective, we will be
able to tease out some new information about the island that has yet to
be discovered. We are particularly interested in exploring the spatial
distribution of the seabird colonies on GDI and how they have changed
over time. The first part of our project will focus on visualizing how
the gull colony on the south end of the island has changed since 1999,
allowing us to develop spatial visualization skills in R. Next, we hope
to bring in several years’ worth of chick-check data containing chick
growth metrics. This will doubtless require a great deal of data
tidying, but should yield some interesting visualizations and insights.
Doing this will also allow us to consider a best practice for the future
collection of this type of data. Later, we may want to tidy and analyze
other data including band return data, petrel habitat surveys, gull
GPS-tracker data, and more. An ideal outcome of this project would be a
tidier and more accessible data storage system for Great Duck Island
that would help further researchers collect and organize data in a more
productive way.

The data that will be used in this project have come from two decades of
student research on Great Duck Island. The vast majority of it will be
taken from the GDI data storage system created by Addison Gruber ’22.
This system consists of organized files on the island computer and
shapefiles in the Great Duck Island group on COA’s ArcGIS Online
organization. Most of the data that we will use have spatial
elements–observations are usually connected to a nest, burrow, or plot
on the island. Some examples of quantitative variables that may be
present include clutch sizes, bird weights, bird wing chord lengths,
numbers of burrows per survey plot. Some examples of categorical
variables may include habitat types (forest, meadow, etc), bird band
codes, bird species, or flag numbers (in this case categorical because
it represents a unique identifier rather than a value).

Great Duck Island is an important seabird colony in the Gulf of Maine–it
is the largest Leach’s Storm-Petrel colony in the lower 48 United
States, and one of the only colonies in the Gulf where gulls are
increasing instead of declining. Seabird populations worldwide are of
increasing population concern, and large, long-term data-sets on these
difficult-to-study birds are rare and hard to obtain. Great Duck Island
has a wonderful body of research collected by numerous students across
dozens of different projects, some short-term and some long-term.
Unfortunately, as students have come and gone and graduated, little
follow-up has occurred on data from past years. We hope that considering
Great Duck’s data holistically, rather than by working on a single
specific project, we will be able to discover some interesting trends
and patterns that are not yet clear to us, and improve our understanding
of this amazing piece of COA’s campus. We have a goldmine of data
collected on Great Duck. There are aspects of this data that have been
well analyzed, and others that are relatively untouched. Our hope for
this project is to create successful visualizations and comprehensive
analysis from this long term data. We also hope to continue the work of
Addison, and continue to organize data from Great Duck. We hope to add
meta data information and create a central location from which future
students can access this valuable data from the last 25 years.

## 2. Data

## 3. Data analysis plan
