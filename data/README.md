# data

Place data file(s) in this folder.

Then, include codebooks (variables, and their descriptions) for your data file(s)
using the following format.

## gulls2021
shapefile with locations of HERG, GBBG, and COEI nests mapped on the south end of GDI in 2021. 
- `Comment`: flag numbers for each nest
- `Feat_Name`: trimble-assigned point IDs
- `Point_ID`: trimble-assigned number reflecting the order in which nests were recorded by the GPS. 
- `geometry`: shapefile mapping information containing location of points

## islandestimatefinal.csv
CSV containing data collected for the 2022 Leach's Storm-Petrel population survey

- `Plot`: 50x50m grid square in which the subplot was located
- `Subplot`: 10x10 meter subplot surveyed, numbered 1-25 based on location inside the larger plot
- `Date`: Date that subplot was surveyed
- `Surveyors`: Initials of the people present when the plot was surveyed. EG is Eleanor Gnam, LS is Levi Sheridan, others were members of the crew who occasionally assisted
- `Active`: Number of burrows in the subplot estimated to be active, based on signs of fresh digging, unobstructed entryways, and fresh odor
- `Inactive`: Number of burrows in the subplot that did not appear to be active
- `Maybe` : Number of burrows in the subplot where activity could not be estimated
- `Total`: Sum total of burrows found in the subplot. Sum of Active, Inactive, and Maybe columns. 
- `Notes` : Notes on interesting subplot features, including the presence of petrel remains.  

## fidelitylong.csv
Information on birds associated with a set of mapped petrel burrows, studied for information on site and mate fidelity. Burrows are revistited yearly to record which birds and present and to band any new occupants. This sheet still needs some tidying to make it most useful.

- `BurrowID`: Unique identifier for study burrow. The letter before is the first initial of the person who "established" that burrow, useful for indicating which year the burrow was established. N is Nathan Dubrow, E is Eleanor Gnam, L is Levi Sheridan. These identifiers should probably be in a more useful format. The numbers after the initial have no meaning beyond serving as identifiers--they were assigned roughly in the order that the burrows were found and flagged.
- `Bird`: Relic from a less-tidy version of this datasheet. Each burrow typically contains two banded, breeding adults. 
- `Band`: USGS federal band number for each bird
- `Weight`: Weight of the bird in grams, measured using a 100-gram pesola.
- `Band.Year`: Year that the bird was originally banded.
- `Chord`: Wing chord of the bird in centimeters
- `Chick.band`: Band number associated with the bird's 2022 chick, where that chick was banded. 
- `Initial.notes`: Notes upon first recapture of the bird in the 2022 breeding season, indicating its breeding status or other information about the burrow. 
- `End.Season.Notes`: Notes about the burrow recorded in mid-August of 2022
