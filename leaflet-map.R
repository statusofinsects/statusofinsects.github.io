dat <- data.frame(readxl::read_xlsx("~/Documents/insect-monitoring-sites.xlsx"))
dat$Latitude <- unlist(lapply(dat$Coords, function(x){
  parzer::parse_lat(trimws(strsplit(x, ",")[[1]][1]))
}))

dat$Longitude <- unlist(lapply(dat$Coords, function(x){
  parzer::parse_lon(trimws(strsplit(x, ",")[[1]][2]))
}))

library(leaflet)
library(leaflet.extras)
#dat$URL <- paste("<a href=\"", dat$Website, "\">", dat$Website, "</a>")
dat$label <- paste(dat$Site.name, dat$URL, sep="<br>\n")

leaflet(dat) %>%
  addTiles(  urlTemplate = "//server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}") %>%
  addCircles(
    data = dat,
    lat = ~ Latitude,
    lng = ~ Longitude,
    weight = 20,
    radius = 0, 
    popup = ~ as.character(label),
   # label = ~ as.character(Organization),
    color = "#a00565",
    fillOpacity = 0.5
  )




dat <- data.frame(readxl::read_xlsx("~/Documents/entomology-socities.xlsx"))
dat$Latitude <- unlist(lapply(dat$Coords, function(x){
  parzer::parse_lat(trimws(strsplit(x, ",")[[1]][1]))
}))

dat$Longitude <- unlist(lapply(dat$Coords, function(x){
  parzer::parse_lon(trimws(strsplit(x, ",")[[1]][2]))
}))

library(leaflet)
library(leaflet.extras)
dat$URL <- paste("<a href=\"", dat$Website, "\">", dat$Website, "</a>")
dat$label <- paste(dat$Organization, dat$URL, sep="<br>\n")

leaflet(dat) %>%
  addTiles(  urlTemplate = "//server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}") %>%
  addCircles(
    data = dat,
    lat = ~ Latitude,
    lng = ~ Longitude,
    weight = 20,
    radius = 0, 
    popup = ~ as.character(label),
    label = ~ as.character(Organization),
    color = "#a00565",
    fillOpacity = 0.5
  )

