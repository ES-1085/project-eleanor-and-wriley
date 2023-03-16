#Data Dictionary for datafiles used for our presentation

##towerclean

`date` : Date of species observation in yyyy-mm-dd format
`species`: species or species group for observation. Including species are:
  - herg (Herring Gull)
  - gbbg (Great Black-backed Gull)
  - coei_ad (Common Eider (adult))
  - coei_ju (Common Eider (chick))
  - blgu (Black Guillemot)
  - puffin (Atlantic Puffin)
  - dcco (Double-crested Cormorant)
  - ternsp (arctic tern or common tern)
  - razo (razorbill)
  - lagu (laughing gull)
  - comu (Common Murre)
  - baea (Bald Eagle)
  - noga (Northern Gannet)
  - corvid (crow or raven (still has issues adding observations of both from the same day))
  - peepsp (species of sandpiper or other shorebird, often spotted sandpipers or willets)
  - seals (gray or harbor seals)
  - colo (Common Loon)
  - cago (Canada Goose)
  - porpoise (Harbor Porpoise)
  - raptor (non-eagle raptor, often peregrine falcon or turkey vulture)
  - gbhe (great blue heron)
  - scoter (Surf scoter or Black Scoter)
  - shearwater 
  - wisp (Wilson's Storm-Petrel)
  - lbbg (Little Black-backed gull)
  
  `count` : Number of individuals of that species seen on that day
  `notes`: notes preserved from that day's observations from the original data sheets
  `year` : year of observation in an easier format for faceting. 
  
##gull_pop_distribution_2022

Data on gull nest distributions across the island up until 2022.

`YEAR` : year of survey
`East` : number of nests on the east side of the south end colony
`West`: number of nests on the east side of the south end colony
`Extension`: Number of nests in the northwest extension of the south end colony
`Point` : number of nests in the point stretch of the north end colony
`Cabin` : number of nests in the cabin stretch of the north end colony
`Hell` : number of the nests in the "hell" stretch of the north end colony
`Borofsky`: Number of nests in the Borofsky (northeast) colony
`Little Point` : Number of nests in the little point colony
`Total North`:  Total nests on the northwest side of the island
`Cabin + Hell` : Total nests in the cabin and hell stretches combined
`COA Property` : Total nests on COA's property (south end + boathouse)

#gullshapefiles

Shape files of the nesting distribution of gulls from 1999 to 2022. This is used to create the maps showing nest locations. Ideally there would just be one file, expect we couldn't figure out how to write an sf file. The code chunk labeled 'read-in-shapefiles' reads all of these in, them binds them into one data frame called `gullshapecombined`. In this combined file, there are three columns:

`year` : year of the nest
`flag` : the unique flag of the nest
`geometry` : the latitude and longitude of the nest. This is what is used to create the actual map.

#outlinecolored

Shape file containing the outline of Great Duck.

#all.nest.count.csv

Data on the number of birds nesting on Great Duck Island from 1999 to 2022.

`flag` : the flag number associated with the nest. Each nest at the South End Subcolony gets its own unique flag. This can be useful for joining to shape files where the flag is generally held under the 'ID' column, or under 'flag' in the combined file called 'gullshapecombined'
`year` : year of count
`species` : the species. Either herg (Herring Gull), gbbg (Great Black-backed Gull), or coei (Common Eider)
`clutch` : the number of eggs in the nest

#density_habitat.csv

Data on the density of nesting birds and the habitat they are found in for all years of data (1999 - 2022). We are using distance to nearest neighbors as a proxy for density. For each nest, the distance to the three nearest neighbors is calculated.

`point_id` : the id of the nest that distance is being measured from. The id comes from the shape files. Each nest has it's own unique id.
`near_point_id` : the id of the nest that the distance to is being measured. There are three              near_point_id's for each point_id.
`distance` : distance from point_id to near_point id.
`distance_rank` : three possible values: 1, 2, and 3. ! represents the closest neighbor, 2 represents the second closest, and 3 represents the third closest.
`year` : the year in question
`habitat` : habitat the the nest is in. 2 possible values: berm and vegetation


  