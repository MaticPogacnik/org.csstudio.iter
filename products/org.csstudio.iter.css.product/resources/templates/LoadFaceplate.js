/*
Copyright (c) : 2010-2015 ITER Organization,
CS 90 046
13067 St. Paul-lez-Durance Cedex
France
 
This product is part of ITER CODAC software.
For the terms and conditions of redistribution or use of this software
refer to the file ITER-LICENSE.TXT located in the top level directory
of the distribution package.
*/

importPackage(Packages.org.csstudio.opibuilder.scriptUtil);
importPackage(Packages.java.lang);

//Getting the legend faceplate
var opiFile = widget.getMacroValue("LEGEND");
if (opiFile == null) {
	//Setting the default faceplate to the legend provided in templates
	opiFile = "Legend.opi";
}

//Split the faceplate variable to extract opi name and macros
var inputString = PVUtil.getString(pvs[0]);
System.out.println("Local PV pvs[0]: " + inputString);

var words = inputString.split(" ");

//Analysis of each word
var i=0;
for (i in words) {

  if (words[i].search(".opi") > 0) {
     //OPI file
     opiFile = words[i];
    //Reload the OPI file in the linking container again 
    //by setting the property value with forcing fire option in true.
    widgetController.setPropertyValue("opi_file", opiFile, true);
  } else {

    var macro = words[i].split("=", 2);
    if (macro.length > 1) {
       //Create a new Macro Input
       var macroInput = DataUtil.createMacrosInput(true);

       //Put a macro in the new Macro Input - Remove whitespace from both sides
       macroInput.put(macro[0].trim(), macro[1].trim());

       //Set the macro input of the linking container to this new macro input.
       widgetController.setPropertyValue("macros", macroInput);
    }
  }
}

//Reload the OPI file in the linking container again 
//by setting the property value with forcing fire option in true.
widgetController.setPropertyValue("opi_file", opiFile, true);
