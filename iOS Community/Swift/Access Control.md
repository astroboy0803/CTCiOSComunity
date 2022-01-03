> Access control **restricts access to parts of your code** from code in other **source files** and **modules**. This feature enables you to **hide the implementation details** of your code, and to **specify a preferred interface** through which that code can be accessed and used.
> 
> Swift’s access control model is based on the concept of **modules** and **source files**.
> 
> A **module** is a single unit of code distribution—a **framework** or application that’s built and shipped as a single unit and that **can be imported by another module** with Swift’s **import** keyword.
> 
> A **source file** is a **single Swift source code file within a module** (in effect, a single file within an app or framework). Although it’s common to define individual types in separate source files, a **single source file can contain definitions for multiple types, functions, and so on**.

Levels:
> **Open** access and **public** access enable entities to be used within any source file from their defining module, and also in a source file from another module that imports the defining module. You typically use open or public access when specifying the public interface to a framework. The difference between open and public access is described below.
> **Internal** access enables entities to be used within any source file from their defining module, but not in any source file outside of that module. You typically use internal access when defining an app’s or a framework’s internal structure.
> **File-private** access restricts the use of an entity to its own defining source file. Use file-private access to hide the implementation details of a specific piece of functionality when those details are used within an entire file.
> **Private** access restricts the use of an entity to the enclosing declaration, and to extensions of that declaration that are in the same file. Use private access to hide the implementation details of a specific piece of functionality when those details are used only within a single declaration.
