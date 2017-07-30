#!/usr/bin/env bash
lat=40.43997
lon=-79.91624

dltdeg=5
bcit(){ echo $@ $dltdeg | bc -l; }


minlat=$(bcit $lat -)
maxlat=$(bcit $lat +)
minlon=$(bcit $lon -)
maxlon=$(bcit $lon +)

curl "http://www.swimmingholes.org/sload.php?lat_min=$minlat&lat_max=$maxlat&lon_min=$minlon&lon_max=$maxlon&lat_center=$lat&lon_center=$lon&zoom=7&limit=100&sort=distance&sort_numeric=1&output_sort=holename&output_sort_numeric=0&gv_nocache=1501421601928"|egrep '<(lat|lng|anchorname)>' | perl -lne 'push @a, $1 if m/DATA\[(.*?)\]/;  if($.%3==0){print join("\t",@a);@a=()}' > locs.txt


