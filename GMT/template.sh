# set file name
out_ps=template.ps
  
# reset output paper size to A4
gmt set PS_MEDIA A4
  
# start gmt session
gmt psxy -R0/1/0/1 -JX1 -T -K -P > $out_ps
  
echo 10 0 | gmt psxy -R-100/100/-80/120 -JX10 -Ba20g10/a20g10 -Sc2 -P -K -O >> $out_ps
echo -10 0 | gmt psxy -R-100/100/-80/120 -JX10 -Ba20g10/a20g10 -Sc2 -P -O -K >> $out_ps
echo 0 40 | gmt psxy -R-100/100/-80/120 -JX10 -Ba20g10/a20g10 -Sc2.2 -P -O -K >> $out_ps
echo 0 2 2 4 | gmt psxy -R-100/100/-80/120 -JX10 -Ba20g10/a20g10 -Sr -P -O -K >> $out_ps

  
# end gmt session
gmt psxy -R -J -O -T >> $out_ps
  
# convert to pdf
gmt psconvert $out_ps -P -Tf
# convert to png
gmt psconvert $out_ps -P -Tg