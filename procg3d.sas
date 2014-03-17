/****************** Classification using SAS Graphics (proc g3d) ************/
goptions reset=all border;
 
title1 "Iris Species Classification";
title2 "Physical Measurement";
title3 "Source: Fisher (1936) Iris Data";
footnote1 j=l "Sepal Width not Shown";
 
  data iris;
  set sashelp.iris;
  length color shape $8.;
  if species="Setosa" then do; shape="club"; color="blue"; end;
  if species="Versicolor" then do; shape="diamond"; color="red"; end;
  if species="Virginica" then do; shape="spade"; color="green"; end;
run;
 
proc print data=iris (firstobs=1 obs=10);
run;

 proc g3d data=iris;
 note j=r "Species:" c=green "Virginica   "
         j=r         c=red   "Versicolor  "
         j=r         c=blue  "Setosa      ";
 scatter PetalLength*PetalWidth=SepalLength/
      color=color
      shape=shape
		noneedle;
run;
quit;
