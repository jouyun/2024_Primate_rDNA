name=getArgument;
if (name=="")
{
    source_dir = getDirectory("Source Directory");
}
else
{
    source_dir=name;
}
setBatchMode(false);

raw_dir = source_dir+"/raw/";
rgb_dir = source_dir+"/rgb/";
acro_dir = source_dir+"/acrocentric_inferred/";
karyo_dir = source_dir+"/Karyos/";
karyos_dir = source_dir+"/Karyos_ordered/";
masks_dir = source_dir+"/rDNAMasks/";
source_list = getFileList(raw_dir);
File.makeDirectory(raw_dir);
File.makeDirectory(rgb_dir);
File.makeDirectory(acro_dir);
File.makeDirectory(karyo_dir);
File.makeDirectory(karyos_dir);
File.makeDirectory(masks_dir);
for (n=0; n<source_list.length; n++)
{
    fname=raw_dir+source_list[n];
    IJ.log(fname);
 	if (endsWith(fname, ".tif"))
    {
    	
 
        IJ.log(fname);
        run("Bio-Formats Importer", "open=["+fname+"] autoscale color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");

		run("8-bit");
        Property.set("CompositeProjection", "Sum");
		Stack.setDisplayMode("composite");
		Stack.setActiveChannels("1110");
		//run("Channels Tool...");
		Stack.setChannel(1);
		run("Blue");
		//run("Channels Tool...");
		Stack.setChannel(2);
		run("Green");
		//run("Channels Tool...");
		Stack.setChannel(3);
		run("Red");
		run("RGB Color");
        run("Save As Tiff", "save=["+rgb_dir+substring(source_list[n], 0, lengthOf(source_list[n])-4)+".tif]");

        run("Close All");
    }
    //close();
}