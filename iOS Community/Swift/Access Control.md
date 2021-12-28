> Access control **restricts access to parts of your code** from code in other **source files** and **modules**. This feature enables you to **hide the implementation details** of your code, and to **specify a preferred interface** through which that code can be accessed and used.

- modules 
	- jar or package
	- framework or .a file
- source files
	- swift file

Levels:
- **Open** access and **public** access enable entities to be used within any source file from their defining module, and also in a source file from another module that imports the defining module. You typically use open or public access when specifying the public interface to a framework. The difference between open and public access is described below.
-   _Internal access_ enables entities to be used within any source file from their defining module, but not in any source file outside of that module. You typically use internal access when defining an app’s or a framework’s internal structure.
-   _File-private access_ restricts the use of an entity to its own defining source file. Use file-private access to hide the implementation details of a specific piece of functionality when those details are used within an entire file.
-   _Private access_ restricts the use of an entity to the enclosing declaration, and to extensions of that declaration that are in the same file. Use private access to hide the implementation details of a specific piece of functionality when those details are used only within a single declaration