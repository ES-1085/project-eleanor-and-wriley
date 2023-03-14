#Data Dictionary: Cleaning Nest Counts and Mapping Data

#Density_habitat.csv

Data on the density of nesting birds and the habitat they are found in for all years of data (1999 - 2022). We are using distance to nearest neighbors as a proxy for density. For each nest, the distance to the three nearest neighbors is calculated.

`point_id` : the id of the nest that distance is being measured from. The id comes from the shape files. Each nest has it's own unique id.
`near_point_id` : the id of the nest that the distance to is being measured. There are three              near_point_id's for each point_id.
`distance` : distance from point_id to near_point id.
`distance_rank` : three possible values: 1, 2, and 3. ! represents the closest neighbor, 2 represents the second closest, and 3 represents the third closest.
`year` : the year in question
`habitat` : habitat the the nest is in. 2 possible values: berm and vegetation

#gull_density folder

This folder contains the data used to make the density_habitat file above. 

#gullshapefiles

Shape files of the nesting distribution of gulls from 1999 to 2022. This is used to create the maps showing nest locations. The code chunk labeled 'read-in-shapefiles' reads all of these in, them binds them into one data fram called `gullshapecombined`. In this combined file, there are three columns:

`year` : year of the nest
`flag` : the unique flag of the nest
`geometry` : the latitude and longitude of the nest. This is what is used to create the actual map.

#nest_count_clean folder

This folder contains all of the cleaned up nest counts. Each csv contains the following colunms:

`flag`: the unique flag of the nest
`clutch`: number of eggs in the nest
`year` : the year
`location`: where the nest is. This column is not as cleaned up as it count be
`species` : species of bird who made the nest

#all.nest.count.csv

This csv contains all of the cleaned up nest counts rbinded together. contains the following columns:

`flag`: the unique flag of the nest
`clutch`: number of eggs in the nest
`year` : the year
`species` : species of bird who made the nest

#nest_count_folder

This folder contains all of the excel sheets that were used to clean up the nest count data.

#outlinecolored

Shape file containing the outline of Great Duck.










