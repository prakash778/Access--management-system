User-Access-management system

description:

1.1 Purpose
The purpose of this document is to outline the requirements for a basic User Access
Management system. This system allows users to sign up, request access to software
applications, and enables managers to approve or reject these requests. The document aims to
provide a clear understanding of the system's functionalities, user roles, and how they interact
within the system.
1.2 Scope

The system will implement the following features:

● User Registration (Sign-Up)
● User Authentication (Login)
● Software Application Listing and Creation
● Access Request Submission
● Access Request Approval or Rejection
Technologies to be used:
● Java Servlets
● JavaServer Pages (JSP)
● mySQL Database


2. Overall Description


2.1 Product Perspective


The User Access Management System is a web-based application designed to streamline the
process of managing user access to various software applications within an organization. It is
an internal tool meant to enhance security and efficiency.


2.2 Product Functions

● User Registration: New users can sign up and create an account.
● User Authentication: Registered users can log in to the system.
● Software Management: Admins can add new software applications to the system.
● Access Request Submission: Employees can request access to software applications.
● Access Request Approval: Managers can approve or reject access requests.

2.3 User Classes and Characteristics

The system has three primary user roles:

1. Employee
   
○ Can sign up and create an account.
○ Can log in to the system.
○ Can request access to software applications.
○ Cannot approve or reject access requests.
○ Cannot create new software applications.

3. Manager
   
○ Can log in to the system.
○ Can view pending access requests.
○ Can approve or reject access requests.
○ Cannot request access to software applications.
○ Cannot create new software applications.

5. Admin

○ Can log in to the system.
○ Can create new software applications.
○ Can manage system settings.
![image](https://github.com/user-attachments/assets/78f26cdb-0c62-4bef-a268-a689b1631a99)





    status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (software_id) REFERENCES software(id)
);
