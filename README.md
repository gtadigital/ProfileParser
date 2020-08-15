# ProfileParser

## Description:

The goal of the ProfileParser is to transform the XML documents dumped from EasyDB platform into another XML documents compliant with the CIDOC-CRM entities structure. The resulting XML file can be used as input schema by X3M mapping tool to create the final RDF knowledge graph according to CIDOC-CRM ontologies. 

The ProfileParser provides three XSLT stylesheets:

* Person 
* Place 
* Group 


## Prerequisites:

1. XSLT version 1.0,
2. Java SE 13
3. IDE to run XsltTransformer.java

## Parser structure

1. The JavaFrameworkProgram folder contains the exec file **XsltTransformer.java**.
2. The Profiles folder contains three separate folders, Place, Person and Group.
	* In each folder are
		* The XSLT profile stylesheet
		* source_files folder where should be stored the dump(s) from EasyDB
		* target_files folder used to store the resulting XML files

## How To Use

To clone and run this application, you'll need [Git](https://git-scm.com) and [Java 13](https://www.oracle.com/java/technologies/javase-jdk13-downloads.html)  installed on your computer. From your command line:

1. Clone the repository and go into the directory

```bash
# Clone this repository
$ git clone https://github.com/gtadigital/ProfileParser.git

# Go into the repository
$ cd ProfileParser
```

2. Edit the **XsltTransformer.java**. According to the choosen profile modify as follows
 
   * Line nr.23 specify the source directory of the XML file(s).
   * Line nr.24 specify the target directory where to save the XML output(s).
   * Line nr.25 specify the XSL path.
   
3. Run the script
 * Run the **XsltTransformer.java** using an IDE

## Credits:

Institute for the History and Theory of Architecture, gta digital, ETH Zurich


## License:

ProfileParser (c) by Institute for the History and Theory of Architecture, gta digital, ETH Zurich

ProfileParser is licensed under a
Creative Commons Attribution-ShareAlike 4.0 International License.

This file is subject to the terms and conditions defined in file 'LICENSE.txt', which is part of this source code package.

[![License: CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/4.0/80x15.png)](https://creativecommons.org/licenses/by-sa/4.0/) [![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)
