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

#### Git Commit Messages
When making commits, it is improtant to have a commit message that explains what is in the commit.

* Use the present tense ("add feature" not "added feature")
* Use the imperative mood ("move cursor to..." not "moves cursor to...")
* Limit the first line to 72 characters or less
* Reference issues and pull requests liberally
* Consider starting the commit message with an applicable emoji:
    * :white_check_mark: `:white_check_mark:` when fixing typos
    * :art: `:art:` when improving the format/structure of the code
    * :racehorse: `:racehorse:` when improving performance
    * :non-potable_water: `:non-potable_water:` when plugging memory leaks
    * :memo: `:memo:` when writing docs
    * :penguin: `:penguin:` when fixing something on Linux
    * :apple: `:apple:` when fixing something on Mac OS
    * :checkered_flag: `:checkered_flag:` when fixing something on Windows
    * :bug: `:bug:` when fixing a bug
    * :fire: `:fire:` when removing code or files
    * :green_heart: `:green_heart:` when fixing the CI build
    * :lock: `:lock:` when dealing with security
    * :arrow_up: `:arrow_up:` when upgrading/updating files
    * :arrow_down: `:arrow_down:` when downgrading/rollback files

####Indirect
* Make changes to 'Nailed'
* Commit from the root folder

###Building
* Run `gradle generatePatches`
* Commit & Push!
