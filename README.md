# ProfileParser

## Description:

The ProfileParser harmonizes XML files according to CIDOC-CRM entities mapping schema.

The ProfileParser provides the following harmonization schema:

* Person (E21_Person)
* Place (E53_Place)
* Group (E74_Group)
* BuiltWorks (E22_Man-Made_Obejct)
* Collection (E78_Collection)
* Digital Object (D1_Digital_Object)

## Prerequisites:

1. [Python3](https://www.python.org/download/releases/3.0/)
2. Virtual Environment

## How To Use:

* Clone the repository and go into the directory

```bash
# Clone the repository:
$ git clone https://github.com/gtadigital/ProfileParser.git
```
 A new folder ```ProfileParser```will be created

* Go into the new folder:

```bash
# Go into the repository
$ cd ProfileParser
```
* Install Virtual Environment

```bash
# Type the command
$ python3 -m venv .venv
```
* Activate the Virtual Environment

```bash
# Type the command
$ source .venv/bin/activate
```

* Install the dependencies

```bash
# Type the command
$ pip install -r requirements.txt
```

* Run the script with arguments:

```bash

# Help documentation
$ python3 Parser1.0.py --help

OR

# Run the script
$ python3 Parser1.0.py --sourcePath "your source path" --targetPath "your target path" --xslt "~/ProfileParser/Profiles/(Archival_Object, BuiltWorks, Digital_Object, Group, Person, Place)"
```

## Output

* Resulting XML files will be saved in the targetPath in folders of a maximum size of 8MB

## Credits:

Institute for the History and Theory of Architecture, gta digital, ETH Zurich


## License:

ProfileParser (c) by Institute for the History and Theory of Architecture, gta digital, ETH Zurich

ProfileParser is licensed under a
Creative Commons Attribution-ShareAlike 4.0 International License.

This file is subject to the terms and conditions defined in file 'LICENSE.txt', which is part of this source code package.

[![License: CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/4.0/80x15.png)](https://creativecommons.org/licenses/by-sa/4.0/) [![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)
