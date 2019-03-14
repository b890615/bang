echo 10 0 | gmt psxy -R-100/100/-80/120 -JX10 -Ba20g10/a20g10 -Sc2 -P -K > 01_psxy.ps
echo -10 0 | gmt psxy -R-100/100/-80/120 -JX10 -Ba20g10/a20g10 -Sc2 -P -O -K >> 01_psxy.ps
echo 0 40 | gmt psxy -R-100/100/-80/120 -JX10 -Ba20g10/a20g10 -Sc2.2 -P -O -K >> 01_psxy.ps
echo 0 2 2 4 | gmt psxy -R-100/100/-80/120 -JX10 -Ba20g10/a20g10 -Sr -P -O -K >> 01_psxy.ps

