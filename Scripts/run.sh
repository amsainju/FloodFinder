#!/bin/bash  
echo "clipping population block data"  
ogr2ogr -clipsrc ~/inundation/inundation.shp inundatedPopulationBlock.shp
echo "converting impacted population data to geojson"
ogr2ogr -f geoJSON ~/FloodImpact/Data/inundatedPopulationBlock.geojson inundatedPopulationBlock.shp

echo "clipping Address point data"
ogr2ogr -clipsrc ~/TexasAdressPoints/TexasAdressPoints.shp inundatedAddressPoints.shp
echo "converting impacted Address point to geojson"
ogr2ogr -f geoJSON ~/FloodImpact/Data/inundatedAddressPoints.geojson inundatedAddressPoints.shp

# Gather constant vars
CURRENTDIR=${PWD##*/}
GITHUBUSER=$(git config github.user)

git remote set-url origin git@github.com:amsainju/FloodImpact.git
git push --set-upstream origin master
