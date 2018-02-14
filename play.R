library(sf)

# download points
u = "https://github.com/crstn/rtest/raw/master/p.geojson"
download.file(url = u, destfile = "/tmp/p.geojson")

# load and reproject to UTM
p <- st_read("/tmp/p.geojson")
p <- st_transform(p, 32618)

# download polygons (building outlines, hence 'b')
u = "https://github.com/crstn/rtest/raw/master/b.geojson"
download.file(url = u, destfile = "/tmp/b.geojson")

# load and reproject to UTM
b <- st_read("/tmp/b.geojson")
b <- st_transform(b, 32618)

# looki
plot(p)
plot(b, add=T)

# throws error
st_distance(p,b)

# according to the plot, this shouldn't find some points within the polygons, but it doesn't:
st_within(p, b)
