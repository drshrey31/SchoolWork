/*! \mainpage CSCI 3081 Delivery Simulation project
*
* # Instructions for Generating Documentation using Doxygen
*
* To generate documentation, first build the project with `make` in the `project` directory.
* Next, navigate to `project/docs` and run `doxygen Doxyfile`.
* Then open `project/docs/html/index.html` in your web browser to view the documentation.
*
*
* #Instructions for using Docker
*
* #Build docker image
*
* bin/build-env.sh
*
*
* #Run docker image
*
* bin/run-env.sh
*
* Build project web server (inside docker image) NOTE: You won't be able to cd here yet because the project directory does not exist. If you were able to launch the above commands you should now be inside the docker image. You can exit it with CTRL+D now.
* 
* ## Inside docker image
* cd /home/user/repo/project
* make
* Run web server (inside docker image)
* 
* ## MUST be within project/ directory inside docker image
* cd /home/user/repo/project
* ./bin/run.sh
* Open up Firefox and browse to http://127.0.0.1:8081/
* 
* Getting Started using SSH on CSE Lab machines
*
* # Run the ssh environment
* # Example: ./bin/ssh-env.sh <x500> <port> <computer num>
* ./bin/ssh-env.sh myx500 8081 05
* Build and run the simulation
*
* cd /path/to/project
* make -j
* ./bin/run.sh
* Open up Firefox and browse to http://127.0.0.1:8081/
*
* #Getting Started with VOLE-3D or VOLE
*
* Log on to VOLE-3D or VOLE (VOLE is slower for graphics, but is great for tests, etc...)
*
* Build project
*
* cd /path/to/cloned/repository
* cd project
* make
* Run project
* 
* # MUST be within project/ directory
* ./bin/run.sh
* Open up Firefox and browse to http://127.0.0.1:8081/
*
* 
*
*
*
*  # DISCUSSION OF THE COMPOSITE FACTORY DESIGN PATTERN
*
* PROS:
* The Composite Factory Design pattern allows us to use multiple different objects in a similar manner,
* and streamline the code needed to operate on multiple entities into one general 
* procedure that works for all. Due to this feature, the composite factory pattern is of great use in
* development environments where objects are added and updated frequently. If multiple objects are being 
* utilized in a similar manner, the composite factory pattern makes it very easy to call functions through
* one composite object type that can then be casted into other objects inheriting from the primary object, 
* making it easier to operate on multiple different objects. 
*
* CONS:
* The generality of a Composite Factory Design pattern makes it more difficult to  
* have a composite element with only certain components as there is no strict type 
* system to check such constraints and we have to rely on dynamic casting 
* and run-time checks to ensure type safety and type checking. If there isn't a need to constantly
* add new objects to the factory, then the composite factory pattern begins to lose its utility,
* as a concrete factory pattern could accomodate for such an implementation while also ensuring type safety and 
* a much more error-free implementation process than a composite factory pattern.
*
*
* # DISCUSSION OF THE COMPARISON BETWEEN COMPOSITE FACTORY, ABSTRACT FACTORY, AND CONCRETE FACTORY
* 
*The three factory patterns - concrete, composite, and abstract - are three different methods of implementing 
*objects in a systematic, hierarchical fashion. A concrete factory pattern revolves around the concept of 
*restriction. First of all, the number of objects to be included is limited. This pattern adds more 
*restrictions that prevent unwanted types to be added, and restricts the addition of components to the 
*overall hierarchy of the pattern. Therefore, this pattern should be implemented when the types of components 
*are known and unlikely to change. One drawback of using a concrete factory pattern is the difficulty of adding 
*new necessary components to the factory. The concrete factory pattern favors a safer, more error-free 
*implementation process where all the components must be known and added to the factory at the beginning of 
*implementation. In contrast, the composite factory pattern favors a more dynamic project implementation process, 
*as it removes the rigid restrictions placed in a concrete factory pattern and makes adding more components 
*easier by treating a group of objects as one composite object. While the concrete pattern puts more restrictions 
*on the number of components that can be included, the composite factory makes it very simple to add new components 
*to the factory. Additionally, the composite factory orders all components within a hierarchy. 
*Within the composite factory design, objects are added to a composite object, allowing the ability to 
*perform a set of similar operations on all the objects by calling the operations on the composite object. 
*However, the composite design makes it difficult to enforce restrictions on the types of components 
*being added, which can lead to incorrect implementation and attribution of objects and create runtime errors. 
*Finally, the abstract factory pattern should be used when it is beneficial to push the creation of objects to 
*subclasses rather than creating them directly from the object classes. The abstract factory pattern is useful 
*because it allows for inheritance and polymorphism, therefore allowing for code reusability and making the source files 
*more readable, efficient, and easier to modify. The composite factory pattern can be used with the abstract pattern 
*for a greater use of polymorphism by allowing for the development of sub-classes.
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
*
* 
*
*/