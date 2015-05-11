#Contributing
There are two parts to Dimensions, the *indirect implementation* and the *direct implementation*. The *indirect* is the open Java source code, while the *direct* is a group of Diff patches to NMS. Using this, we are able to completely open source Dimensions without open sourcing Minecraft.

##Requirements
* You're going to need gradle, You can download it at https://gradle.org/downloads/
* [Java 7](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html), this may change to 8 later.
* Be sure you follow the [coding style](https://github.com/Dimensions/Dimensions/blob/master/STYLE.md) rules.

##Cloning
* Run `git clone https://github.com/dimensions/dimensions Dimensions`
* You can go into that folder using `cd Dimensions`

##Workspace
###Setup
* Run `gradle setupNailed [idea OR eclipse]` from the root folder
* Wait 5-10 minutes
* Open it in your IDE

###Making Changes
####Indirect
* Make changes to 'Nailed'
* Commit from the root folder

###Building
* Run `gradle generatePatches`
* Commit & Push!
