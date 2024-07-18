roiManager("reset");

Stack.setChannel(5);
run("Find Edges", "slice");
Stack.setDisplayMode("composite");
setMinAndMax(0, 20);
Stack.setChannel(2);
run("Blue");
run("Gaussian Blur...", "sigma=1 slice");
setMinAndMax(210, 500);
Stack.setChannel(4);
run("Red");
setMinAndMax("0.06", "0.25");
run("Enhance Contrast", "saturated=0.35");
Stack.setChannel(3);
run("Green");
setMinAndMax("0.01", "0.1");
run("Enhance Contrast", "saturated=0.35");
run("In [+]");
run("In [+]");
Stack.setActiveChannels("01101");

waitForUser;
t=getTitle();
roiManager("Save", "S:/micro/jeg/tpo/smc/UBF_iFISH_HG02080_family/Karyos/"+substring(t, 0, lengthOf(t)-4)+".zip");
run("Close All");