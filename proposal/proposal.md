Exploring Great Duck Island Through Data
================
Eleanor and Wriley

``` r
library(tidyverse)
library(broom)
library(sf)
library(forcats)
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
Addison, and continue to organize data from Great Duck. Finally, we plan
to create additional metadata where possible, and create a central
location from which future students can access this valuable data from
the last 25 years.

## 2. Data

A bare-bones example of a shapefile of gull nests mapped on the south
end:

    ## Simple feature collection with 6 features and 3 fields
    ## Geometry type: POINT
    ## Dimension:     XY
    ## Bounding box:  xmin: 560289.7 ymin: 4887905 xmax: 560326.2 ymax: 4887980
    ## Projected CRS: NAD_1983_CORS96_UTM_Zone_19N
    ## # A tibble: 6 × 4
    ##   Comment Feat_Name     Point_ID           geometry
    ##   <chr>   <chr>            <dbl>        <POINT [m]>
    ## 1 748     Point_generic        1 (560289.7 4887980)
    ## 2 432     Point_generic        2 (560296.4 4887943)
    ## 3 490     Point_generic        3 (560299.2 4887939)
    ## 4 804     Point_generic        4 (560298.7 4887933)
    ## 5 596     Point_generic        5 (560326.2 4887906)
    ## 6 584     Point_generic        6   (560325 4887905)

![](proposal_files/figure-gfm/gull%20shape%20file-1.png)<!-- -->

An example of raw data from the 2022 petrel survey:

    ## New names:
    ## Rows: 632 Columns: 13
    ## ── Column specification
    ## ──────────────────────────────────────────────────────── Delimiter: "," chr
    ## (4): Plot, Date, Surveyors, Notes dbl (5): Subplot, Active, Inactive, Maybe,
    ## Total lgl (4): ...10, ...11, ...12, ...13
    ## ℹ Use `spec()` to retrieve the full column specification for this data. ℹ
    ## Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## • `` -> `...10`
    ## • `` -> `...11`
    ## • `` -> `...12`
    ## • `` -> `...13`

    ## # A tibble: 6 × 13
    ##   Plot  Subplot Date  Surve…¹ Active Inact…² Maybe Total Notes ...10 ...11 ...12
    ##   <chr>   <dbl> <chr> <chr>    <dbl>   <dbl> <dbl> <dbl> <chr> <lgl> <lgl> <lgl>
    ## 1 M30        NA 6/10… EG, LS      83      32    30   145 Whol… NA    NA    NA   
    ## 2 M29        22 6/11… EG, LS       2       1     0     3 <NA>  NA    NA    NA   
    ## 3 M29         5 6/11… EG, LS       2       1     1     4 <NA>  NA    NA    NA   
    ## 4 N29         1 6/11… LS           7       3     1    11 <NA>  NA    NA    NA   
    ## 5 N29         6 6/11… EG           7       5     6    18 <NA>  NA    NA    NA   
    ## 6 N30        21 6/11… LS           8       2     1    11 <NA>  NA    NA    NA   
    ## # … with 1 more variable: ...13 <lgl>, and abbreviated variable names
    ## #   ¹​Surveyors, ²​Inactive

An example of some petrel band return data from 2022 (which birds were
found or banded in which burrow and their morphometrics):

    ## New names:
    ## Rows: 130 Columns: 10
    ## ── Column specification
    ## ──────────────────────────────────────────────────────── Delimiter: "," chr
    ## (5): BurrowID, Bird, Band, Chick.band, Initial.notes dbl (4): ...1, Weight,
    ## Band.Year, Chord lgl (1): End.Season.Notes
    ## ℹ Use `spec()` to retrieve the full column specification for this data. ℹ
    ## Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## • `` -> `...1`

    ## # A tibble: 6 × 10
    ##    ...1 BurrowID Bird   Band       Weight Band.Y…¹ Chord Chick…² Initi…³ End.S…⁴
    ##   <dbl> <chr>    <chr>  <chr>       <dbl>    <dbl> <dbl> <chr>   <chr>   <lgl>  
    ## 1     1 E01      Bird 1 2941-47115     47     2022  16.5 <NA>    Egg     NA     
    ## 2     2 E01      Bird 2 2941-47134     47     2022  16.5 <NA>    Egg     NA     
    ## 3     3 E02      Bird 1 2661-34228     46     2021  15.9 3011-2… Egg     NA     
    ## 4     4 E02      Bird 2 2661-34220     52     2021  15.9 3011-2… Egg     NA     
    ## 5     5 E03      Bird 1 2661-34226     44     2021  16   <NA>    egg la… NA     
    ## 6     6 E03      Bird 2 2941-47114     40     2022  15.6 <NA>    egg la… NA     
    ## # … with abbreviated variable names ¹​Band.Year, ²​Chick.band, ³​Initial.notes,
    ## #   ⁴​End.Season.Notes

## 3. Data analysis plan

Much of our data analysis will involve mapping spatial data, so an early
part of our data analysis will include learning to work with this sort
of data. NOTE: Eleanor finish this paragraph

An interesting visualization of 2022 petrel survey data, where the
number of burrows per survey plot is mapped over longitude and latitude.
The bimodal distribution of burrows across latitude is very interesting
to us.

Plotting the latitude and longitudes of each subplot (so that each
subplot is a point) shows how well we covered the island with our
survey–it creates a clear map of Great Duck.

    ## Rows: 620 Columns: 12
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (5): Plot, Date, Surveyors, Notes, GISID
    ## dbl (7): Subplot, Active, Inactive, Maybe, Total, longitude, latitude
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    ## Warning: Removed 10 rows containing missing values (geom_point).

![](proposal_files/figure-gfm/petrel%20exploratory%20visualization-1.png)<!-- -->![](proposal_files/figure-gfm/petrel%20exploratory%20visualization-2.png)<!-- -->

Sample distribution of survey plot populations from the 2022 petrel
survey:
![](proposal_files/figure-gfm/petrel%20summary%20statistics-1.png)<!-- -->

An example of a visualization from 2022 gull data, looking at fledging
success by habitat:

    ## New names:
    ## Rows: 1087 Columns: 10
    ## ── Column specification
    ## ──────────────────────────────────────────────────────── Delimiter: "," chr
    ## (2): habitat, nest...6 dbl (8): ...1, clutch, hatch_seq, chick, nest...7, date,
    ## weight, chickage
    ## ℹ Use `spec()` to retrieve the full column specification for this data. ℹ
    ## Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## Rows: 53 Columns: 5
    ## ── Column specification
    ## ──────────────────────────────────────────────────────── Delimiter: "," chr
    ## (1): habitat dbl (4): nest_number, clutch, fledging_success, Percent Success
    ## ℹ Use `spec()` to retrieve the full column specification for this data. ℹ
    ## Specify the column types or set `show_col_types = FALSE` to quiet this message.
    ## • `` -> `...1`
    ## • `nest...4` -> `nest...6`
    ## • `nest...5` -> `nest...7`

![](proposal_files/figure-gfm/fledging%20success%20barplot%20in%20ggplot-1.png)<!-- -->![](proposal_files/figure-gfm/fledging%20success%20barplot%20in%20ggplot-2.png)<!-- -->

![](proposal_files/figure-gfm/gull%20exploratory%20visualization-1.png)<!-- -->
