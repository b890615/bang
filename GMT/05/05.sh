out_ps=bang.ps
input_list=bang.list
 
cpt=05.cpt
 
gmt set PS_MEDIA A4
 
gmt makecpt -T0/140/5 -Csubtle -Z > $cpt
 
# start gmt session
gmt psxy -R0/1/0/1 -JX1c -T -K -P > $out_ps
 
# Main map
gmt psbasemap -R119/123/21/26 -Jm3 -BwEsN -B1 -G0/250/250 -X-0.5 -Y5 -O -K >> $out_ps
gmt pscoast -R -J -B -W1 -G250/250/0 -Df -Ia -O -K >> $out_ps
echo "121.8 27.0 March Earthquakes" | gmt pstext -N -R -J -F+f30p,Helvetica-Bold,black -O -K >> $out_ps
awk '{if ($4>=4 && $4<5) print $1, $2, $3}' $input_list | gmt psxy -R -J -Sc0.25 -W0.01 -C$cpt -O -K >> $out_ps
awk '{if ($4>=5 && $4<6) print $1, $2, $3}' $input_list | gmt psxy -R -J -Sc0.3 -W0.01 -C$cpt -O -K >> $out_ps

 
# Bottom map
gmt psbasemap -R119/123/0/140 -Jx3/-0.01 -Bxa1f1 -Bya50f10 -X0 -Y-3 -O -K >> $out_ps
awk '{if ($4>=3 && $4<4) print $1, $3, $3}' $input_list | gmt psxy -R -J -Sc0.2 -C$cpt -O -K >> $out_ps
awk '{if ($4>=4 && $4<5) print $1, $3, $3}' $input_list | gmt psxy -R -J -Sc0.25 -W0.01 -C$cpt -O -K >> $out_ps
awk '{if ($4>=5 && $4<6) print $1, $3, $3}' $input_list | gmt psxy -R -J -Sc0.3 -W0.01 -C$cpt -O -K >> $out_ps

 
# Right map
gmt psbasemap -R0/140/21/26 -Jx0.01/3.25 -Bxa50f10 -Bya1f1 -X14 -Y3 -O -K >> $out_ps
awk '{if ($4>=3 && $4<4) print $3, $2, $3}' $input_list | gmt psxy -R -J -Sc0.2 -C$cpt -O -K >> $out_ps
awk '{if ($4>=4 && $4<5) print $3, $2, $3}' $input_list | gmt psxy -R -J -Sc0.25 -W0.01 -C$cpt -O -K >> $out_ps
awk '{if ($4>=5 && $4<6) print $3, $2, $3}' $input_list | gmt psxy -R -J -Sc0.3 -W0.01 -C$cpt -O -K >> $out_ps

gmt psscale -C05.cpt -Dx-5.5c/-5c+w12c/0.5c+jTC+h -Bx20+l"Depth (km)" -O -K >> $out_ps
# end gmt session 
gmt psxy -R -J -O -T >> $out_ps 
 
# convert to pdf 
gmt psconvert $out_ps -P -Tf 
# convert to png 
gmt psconvert $out_ps -P -Tg