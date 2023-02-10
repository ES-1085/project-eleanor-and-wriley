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
of data. We hope to give ourselves a primer in using the r packages
“leaflet” and “sf.” We have a continuous series of maps from 1999 - 2022
that show the locations of nearly every gull nest on GDI each year. We
hope to create an exploratory series of data visualizations showing the
changing distribution of gull nests that breed on the south end of Great
Duck. If we are able to, we would like create an animation demonstrating
the changes in distribution. The main variables of interest here in
these spatial visualizations are locations within the south end colony
and year. As an interesting supplement to this, we will also create a
bar graph demonstrating island wide shifts in distribution. Gulls have
nested at 4 different sub colonies. While the total number of gulls has
changed only slightly in the last 25 years, their distribution between
these four sub colonies has changed dramatically.

Another long term data set we have is from tower count observations.
Each morning, the Great Duck Team stands in the lighthouse at 0700 and
counts all birds in sight. This data set also goes back 20+ years. We
would like to create a series of graphs demonstrating the changes in the
abundance of birds that we have counted. The variables of interest here
are species, count, and year. This data requires additional tidying
before we can easily work with it, and getting it into a workable form
will be one of our first tasks.

We hope to create a series of visualizations looking at chick check
data. Chick check is where a team of students selects a sample of nests
that they visit each day to record weight and survival status. This
allows us to look at growth curves and survival rates of chicks. We have
a tidy version of this data from 2022 that we will definitely visualize.
There are many variables of interest in this 2022 data: habitat of nest,
clutch size, hatch sequence, growth rates and survival status are the
ones we will explore for this project. We also have data ranging back 20
or so years. These data are in disparate formats. If we have the time,
we will begin tidying these data so that we can compare them. There is a
lot of potential for comparing data from across the years, but there is
also a lot of work that would need to be done to do this. If we
succeeded, we could compare overall fledging success and average growth
curves across the years.

If we have time, we may also look at some Leach’s Storm-Petrel data from
the 2022 population survey. This is interesting spatial data, and we
hope that by considering it carefully we may be able to produce some
insights on how future counts of this type, which are extremely
time-intensive and done infrequently, could be designed for maximum
efficiency.

Here are two examples of exploratory visualizations that show some
interesting features of the 2022 petrel survey data. In the first, the
total number of burrows found in each survey subplot is shown mapped
over the latitude of the survey subplot. There is a clear bimodal
distribution–the center of the island, which is a wetland, is absent of
petrel burrows. However, why the peaks of the distributions are where
they are is unclear and could merit future consideration about the
habitats of those areas.

In the second, the latitude and longitude of each survey subplot are
places on the x and y axes, and the points are colored according to the
total number of burrows found in each subplot. The shape of GDI is
formed, indicating that we did a pretty good job covering the whole
island in our survey. This visualization begins to show hotspots of
petrel activity on the island.

    ## Rows: 620 Columns: 12
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (5): Plot, Date, Surveyors, Notes, GISID
    ## dbl (7): Subplot, Active, Inactive, Maybe, Total, longitude, latitude
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

    ## Warning: Removed 10 rows containing missing values (`geom_point()`).

![](proposal_files/figure-gfm/petrel%20exploratory%20visualization-1.png)<!-- -->![](proposal_files/figure-gfm/petrel%20exploratory%20visualization-2.png)<!-- -->

Our 2022 petrel survey involved breaking the entire island into 50x50
meter grid squares. We surveyed two 10x10m subplots in each grid square.
The sample distribution for the observed (actually counted) number of
burrows per 50 meter grid square looks like this:
![](proposal_files/figure-gfm/petrel%20summary%20statistics-1.png)<!-- -->
Finally, here are some summary statistics for the number of burrows per
survey plot:

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   0.000   0.000   0.000   2.516   2.000 145.000

On average, our subplots contained 2.54 petrel burrows. The median is
zero. This is clearly very strongly skewed data, which is one reason why
we chose to go with a bootstrapping approach when turning the survey
data into a population estimate.

Here’s an example of a visualization from 2022 gull data, looking at
fledging success by habitat:

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

It is very interesting to see the difference between mean and median
fledging success, and that’s something we would like to explore further.
This next visualization sheds some light on it:

![](proposal_files/figure-gfm/gull%20exploratory%20visualization-1.png)<!-- -->

And here are some summary stats that get at the same thing:

    ## # A tibble: 3 × 5
    ##   habitat          medfledge meanfledge medclutch meanclutch
    ##   <chr>                <dbl>      <dbl>     <dbl>      <dbl>
    ## 1 Berm                     1       1.44         3       2.89
    ## 2 Dense Vegetation         2       1.8          3       3   
    ## 3 Meadow                   2       1.8          3       2.85

It’s interesting to us that the berm has such a difference between its
median and mean fledging success, as well as the lowest overall fledging
success of the habitats. At a glance, clutch size doesn’t appear
different enough to help explain this difference. It merits further
investigation.
