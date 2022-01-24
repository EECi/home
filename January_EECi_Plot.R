## January_EECi_Plot.R
# 17/01/2022
#
# Hexmap of Energy Intensities by Buidling Type and Age
# Displays outputs from energy intensity estimation for each local authority.
# Based upon Tidy Tuesday Hexmap by rivasiker
# https://github.com/rivasiker/TidyTuesday/tree/main/2022/2022-01-11
# AP Neto-Bradley

# Load libraries
library(geogrid)
library(ggplot2)
library(sf)
library(tmap)
library(showtext)
library(tidyverse)
library(geojsonio)
library(broom)
library(rgeos)
font_add_google("Lato", family="Montserrat")
showtext_auto()

# First we need to create a hex spatial map of england LADs
input_file <- system.file("extdata", "london_LA.json", package = "geogrid")
original_shapes <- laddf_plot %>% st_set_crs(27700)
original_shapes$SNAME <- substr(original_shapes$LAD13NM, 1, 4)

rawplot <- tm_shape(filter(original_shapes,id %in% c("E08000016",
                                                     "E08000032",
                                                     "E08000033",
                                                     "E07000163",
                                                     "E08000017",
                                                     "E06000011",
                                                     "E07000164",
                                                     "E07000165",
                                                     "E06000010",
                                                     "E08000034",
                                                     "E08000035",
                                                     "E06000012",
                                                     "E06000013",
                                                     "E07000166",
                                                     "E08000018",
                                                     "E07000167",
                                                     "E07000168",
                                                     "E07000169",
                                                     "E08000019",
                                                     "E08000036",
                                                     "E06000014"
))) + 
  tm_polygons("E_REL", palette = "viridis") +
  tm_text("SNAME")
rawplot

par(mfrow = c(2, 3), mar = c(0, 0, 2, 0))
for (i in 1:6) {
  new_cells <- calculate_grid(shape = filter(original_shapes,id %in% c("E08000016",
                                                                       "E08000032",
                                                                       "E08000033",
                                                                       "E07000163",
                                                                       "E08000017",
                                                                       "E06000011",
                                                                       "E07000164",
                                                                       "E07000165",
                                                                       "E06000010",
                                                                       "E08000034",
                                                                       "E08000035",
                                                                       "E06000012",
                                                                       "E06000013",
                                                                       "E07000166",
                                                                       "E08000018",
                                                                       "E07000167",
                                                                       "E07000168",
                                                                       "E07000169",
                                                                       "E08000019",
                                                                       "E08000036",
                                                                       "E06000014"
  )), grid_type = "hexagonal", seed = i)
  plot(new_cells, main = paste("Seed", i, sep = " "))
}

new_cells_hex <- calculate_grid(shape = filter(original_shapes,id %in% c("E08000016",
                                                                         "E08000032",
                                                                         "E08000033",
                                                                         "E07000163",
                                                                         "E08000017",
                                                                         "E06000011",
                                                                         "E07000164",
                                                                         "E07000165",
                                                                         "E06000010",
                                                                         "E08000034",
                                                                         "E08000035",
                                                                         "E06000012",
                                                                         "E06000013",
                                                                         "E07000166",
                                                                         "E08000018",
                                                                         "E07000167",
                                                                         "E07000168",
                                                                         "E07000169",
                                                                         "E08000019",
                                                                         "E08000036",
                                                                         "E06000014"
)), grid_type = "hexagonal", seed = 3)
resulthex_nw <- assign_polygons(filter(original_shapes,id %in% c("E08000016",
                                                              "E08000032",
                                                              "E08000033",
                                                              "E07000163",
                                                              "E08000017",
                                                              "E06000011",
                                                              "E07000164",
                                                              "E07000165",
                                                              "E06000010",
                                                              "E08000034",
                                                              "E08000035",
                                                              "E06000012",
                                                              "E06000013",
                                                              "E07000166",
                                                              "E08000018",
                                                              "E07000167",
                                                              "E07000168",
                                                              "E07000169",
                                                              "E08000019",
                                                              "E08000036",
                                                              "E06000014"
)), new_cells_hex)

spdf_hex <- as_Spatial(resulthex_nw)
#new_cells_reg <- calculate_grid(shape = original_shapes, grid_type = "regular", seed = 3)
#resultreg <- assign_polygons(original_shapes, new_cells_reg)

spdf_fortified <- tidy(spdf_hex, region = "LAD13CD") 
# Calculate the centroid of each hexagon to add the label:
centers <- cbind.data.frame(data.frame(gCentroid(spdf_hex, byid=TRUE), id=spdf_hex@data$LAD13NM))

# Now I can plot this shape easily as described before:
 ggplot() +
   geom_polygon(data = filter(spdf_fortified, id %in% c("E08000016",
                                                        "E08000032",
                                                        "E08000033",
                                                        "E07000163",
                                                        "E08000017",
                                                        "E06000011",
                                                        "E07000164",
                                                        "E07000165",
                                                        "E06000010",
                                                        "E08000034",
                                                        "E08000035",
                                                        "E06000012",
                                                        "E06000013",
                                                        "E07000166",
                                                        "E08000018",
                                                        "E07000167",
                                                        "E07000168",
                                                        "E07000169",
                                                        "E08000019",
                                                        "E08000036",
                                                        "E06000014"
   )), aes( x = long, y = lat, group = group), fill="skyblue", color="white") +
   geom_text(data=centers, aes(x=x, y=y, label=id)) +
   theme_void() +
   coord_map()

# Need to sumarise the posterior data by year and by type

haringey_post <- E_Post %>% filter(LA=="E07000167")
haringey_colony <- haringey_post %>% filter(group %in% c(5,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24))  %>% group_by(group) %>% summarise("Mean"=mean(E_POS))


# This function divides a hexagon into 24 triangles (borrowed from https://github.com/rivasiker/TidyTuesday/tree/main/2022/2022-01-11)
triangle <- function(x) {
  
  # this is for reordering the groups of the triangles
  lookup <- setNames(1:24, 
                     c(13, 1, 8, 2, 11, 3, 12, 4, 10, 7, 19, 22, 
                       16, 24, 15, 23, 14, 20, 17, 5, 9, 6, 18, 21)
  )
  lookup_2 <- setNames( c(21, 22, 3, 4, 8, 12, 16, 20, 19, 23, 24, 18, 17, 13, 
                          9, 5, 1, 2, 6, 7, 11, 15, 14, 10), 1:24
                        
  )
  
  # This is a (rather ugly) chunk for calculating the triangle boundaries
  dat <- rbind(
    x[1,1:2],
    tibble(
      long = x[[1,1]]-(x[[1,1]]-x[[2,1]])/2,
      lat = x[[1,2]]-(x[[1,2]]-x[[2,2]])/2,
    ),
    tibble(long = x[[1,1]], lat = x[[2,2]]),
    x[1,1:2]
  )
  dat_2 <- 
    rbind(
      mutate(dat, group = 1),
      mutate(dat, 
             long = long-(x[[1,1]]-x[[2,1]])/2,
             lat = lat-(x[[1,2]]- x[[2,2]])/2,
             group = 2),
      mutate(dat, 
             long = long-(x[[1,1]]-x[[2,1]])/2,
             lat = lat-(x[[1,2]]- x[[2,2]])*1.5,
             group = 3),
      mutate(dat, 
             long = long-(x[[1,1]]-x[[2,1]])/2,
             lat = lat-(x[[1,2]]- x[[2,2]])*2.5,
             group = 4),
      mutate(dat, 
             lat = lat-(x[[1,2]]- x[[2,2]]),
             group = 5),
      mutate(dat, 
             lat = lat-(x[[1,2]]- x[[2,2]])*2,
             group = 6),
      mutate(dat, 
             lat = lat-(x[[1,2]]- x[[2,2]])*3,
             group = 7),
      
      mutate(dat, 
             long = -long+(x[[1,1]])*2-
               (x[[1,1]]-x[[2,1]])/2,
             lat = lat-(x[[1,2]]- x[[2,2]])/2,
             group = 8),
      mutate(dat, 
             long = -long+(x[[1,1]])*2-
               (x[[1,1]]-x[[2,1]])/2,
             lat = lat-(x[[1,2]]- x[[2,2]])*1.5,
             group = 9),
      mutate(dat, 
             long = -long+(x[[1,1]])*2-
               (x[[1,1]]-x[[2,1]])/2,
             lat = lat-(x[[1,2]]- x[[2,2]])*2.5,
             group = 10),
      mutate(dat, 
             long = -long+(x[[1,1]])*2-
               (x[[1,1]]-x[[2,1]]),
             lat = lat-(x[[1,2]]- x[[2,2]]),
             group = 11),
      mutate(dat, 
             long = -long+(x[[1,1]])*2-
               (x[[1,1]]-x[[2,1]]),
             lat = lat-(x[[1,2]]- x[[2,2]])*2,
             group = 12)
    )
  dat_2 <- rbind(
    dat_2,
    mutate(
      dat_2,
      long = x[[1,1]]*2-long,
      group = group+12
    )
  ) %>% 
    mutate(
      lat = (lat-x[[1,2]])*0.02+lat,
      group = lookup[as.character(group)],
      group = lookup_2[as.character(group)]
    )
  dat_2
}

#Let's apply the function to the northwest, first filtering for these local authorities.
nw_post <- E_Post %>% filter(LA %in% c("E08000016",
                                         "E08000032",
                                         "E08000033",
                                         "E07000163",
                                         "E08000017",
                                         "E06000011",
                                         "E07000164",
                                         "E07000165",
                                         "E06000010",
                                         "E08000034",
                                         "E08000035",
                                         "E06000012",
                                         "E06000013",
                                         "E07000166",
                                         "E08000018",
                                         "E07000167",
                                         "E07000168",
                                         "E07000169",
                                         "E08000019",
                                         "E08000036",
                                         "E06000014"
))
nw_colony <- nw_post %>% filter(group %in% c(5,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24))  %>% group_by(LA, group) %>% summarise("Mean"=mean(E_POS))


spdf_fortified_triangle <- spdf_fortified %>% 
  group_by(id) %>% 
  group_modify(~triangle(.x)) %>% 
  unite('group_2', c(id, group), remove = F) %>% 
  mutate(state = id)

# We can now merge the triangle coordinates with the energy intensity data
state_lookup <- setNames(laddf$LAD13NM, laddf$id)
full_dataset <- nw_colony %>% 
  group_by(id) %>% 
  mutate(group = c(16,12,8,4,15,11,7,3,14,10,6,2,13,9,5,1)) %>% 
  full_join(spdf_fortified_triangle, by = c('group', 'id')) %>% 
  mutate(abb = state_lookup[id])

# We will save some coordinates based on Ryedale for plotting the legend
Ryedale <- filter(spdf_fortified, id == 'E07000167') %>% 
  mutate(
    long = long+0.1,
    lat = lat-1
  )
Ryedale_boundaries <- tibble(
  x = range(Ryedale$long)[1]+seq(1, 8, 2)*(diff(range(Ryedale$long))/8),
  y = max(Ryedale$lat) + 0.1,
  yend = min(Ryedale$lat), 
  month = c('Semi-detached', 'Terraced','Flat', 'Detached')
)
Ryedale_boundaries_2 <- tibble(
  y = range(Ryedale$lat)[1]+seq(2, 5, 1)*(diff(range(Ryedale$lat))/8),
  x = max(Ryedale$long),
  xend = min(Ryedale$long) - c(0.3, 0.2, 0.3, 0.2),
  year = c("post-2000", "1973-1999","1931-1972","pre-1930s" )
)

# library(showtext)
# font_add_google("Montserrat", "Montserrat")
# showtext_auto()

# Let's plot the data!
p<- full_dataset %>% 
  ggplot() +
  # Plotting the hexagon legend
  geom_text(aes(x = xend-0.1, y = y, label = year),
            hjust = 1, size = 4, family = 'Montserrat',
            data = Ryedale_boundaries_2) +
  geom_text(aes(x = x, y = y+0.05, label = month),
            hjust = 1, size = 4, angle = 90+180+40, 
            family = 'Montserrat',
            data = Ryedale_boundaries) +
   geom_polygon(aes(x = long+0.1+(0.5*0.3153901), y = lat-1-(0.75*0.3714647), 
                     group = group_2,
                     fill = ifelse(!is.na(Mean), 300, NA)),
                color = 'white',
                size = 0.2,
                data = filter(full_dataset, id == 'E07000167')) +
  geom_polygon(aes( x = long, y = lat, group = group), 
               fill="transparent", color="black",
               data = Ryedale) +
  geom_segment(aes(x = x, xend = x, y = y, yend = yend),
               size = 0.3,
               data = Ryedale_boundaries) +
  geom_segment(aes(x = x, xend = xend, y = y, yend = y),
               size = 0.3,
               data = Ryedale_boundaries_2) +
  
  # Plotting the hexbin map
  geom_polygon(aes( x = long, y = lat, 
                    group = group_2,
                    fill = (Mean)),
               color = 'white',
               size = 0.2) +
  geom_polygon(aes( x = long-(0.5*0.3153901), y = lat+(0.75*0.3714647), group = group),
               fill="transparent", color="black",
               data = spdf_fortified, size= 1) +
  
  # Plotting of the state name
  geom_text(aes(x=long+0.005, y=lat-0.01, label=gsub('(.{1,10})(\\s|$)', '\\1\n', state_lookup[state]) ),
            size = 3, angle = 33, hjust=1, vjust=1, lineheight = 0.7, color = 'black', family = 'Montserrat',
            data = summarize(group_by(full_dataset, state),
                             long = mean(long),
                             lat = max(lat))) +
  
  # Plotting the title and sub-title
  geom_text(aes(x=-1.4, y=55.45, label=label),
            size = 8, color = 'black', hjust = 0.5,
            family = 'Montserrat', fontface = "bold",
            data = tibble(label = 'How energy efficiency varies with age and type of house')) +
  geom_text(aes(x=-1.4, y=y, label=label),
            size = 4.5, color = 'black', hjust = 0.5, vjust = 1,
            family = 'Montserrat',
            data = tibble(
              label = c('Energy efficiency of a a home (measured here in terms of energy intensity or energy per unit floor area) can vary',
                        'considerably with the type of house (flat, detached, or terraced housing) as well as the age of the house.',
                        'In addition to these universal differences, energy intensity can vary depending on where you are, which in ',
                        'turn reflects the underlying socio-economic landscape'),
              y = c(55.4, 55.35, 55.3 ,55.25))) +
  
  # Plotting the credits
  # geom_text(aes(x=-3, y=55.0, label=label),
  #           size = 3, color = 'black', hjust = 0,
  #           family = 'Montserrat', fontface = "bold",
  #           data = tibble(label = 'Data modelled based on\nEPC and NEED datasets')) +
  # 
  # Fixing the coordinates for the map
  #coord_map()  +
  
  # Changing the color scale
  scale_fill_gradientn(colors=met.brewer("Hiroshige"),
    name = 'Energy Intensity\nacross houses\nof given type\nand age\n(kWh/m2/year)',
    na.value = 'white',
    trans = 'reverse') +
  
  # Adding additional theme options
  theme_void()  +
  theme(legend.position = c(0.1, 0.15),
        legend.title = element_text(size = 10, family = 'Montserrat'),
        legend.key.size = unit(15, 'pt'),
        legend.text = element_text(size = 10, family = 'Montserrat')) #+

  
  p + 
    labs(
      caption = "Visualization: Andre Neto-Bradley  .  Data: Modelled based on EPC and NEED datasets"
    )
