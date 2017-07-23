# LIBRARY APP

### Some Login Credential:

Privilege|email|password
-------|-------|----------
Superadmin|Admin@example.com|pass
test user|users@example.com|pass

**CSC 517 - OODD**

**Program 1 - Ruby on Rails Application - Library Sys**

The application is currently hosted at: https://libappviv.herokuapp.com/

For accessing the project for the first time, 

There are two options:


**1) Sign up as a library member.**

=> The name, email, password, confirmation should be entered. 

=> We have currently set the minimum password length as 2. 

=> After creation, you will be auto logged in. Please log out once and re-login to enable all library member functions. 


**2) Log in as the superadmin.**

Superuser details:

	Username:  Admin

	Email:  Admin@example.com

	Password:  pass
	
=> The password of the superadmin as well as the other admins can be updated. 

=> The updation of the superadmin details can be done through the Update Profile Link in the menu.  

The Features supported as per the given rubric:

**1) Admin Functions:**

=> The **superadmin** can log in, log out, and update his/her profile. The details given above will work. In case they don't please inform one of the contributors, we will reset the db again.

**(A) To log in as superadmin:**

	Click on the Log In link on the home page.
	
**(B) To log out:**
	
	Click on the Log Out link on the portal page.
	
**(C) To update profile:**
	
	Click on the Update Profile link on the portal page.

**(D) Create new admins:**

**PLEASE NOTE: For creating new admins, we have provided the option to the superadmin to create a new admin.**

	Click on User Management (this link will be displayed only in admins and superadmin accounts).
	
	The superadmin or any other existing admins can assign/revoke the admin privilege for a user. 
	
	An admin cannot revoke superadmin privilege. 
	

Team Members: 
Vivek Bhat: vbhat@ncsu.edu,
Saloni Desai: sndesai@ncsu.edu,
Priyal Jain: pjain12@ncsu.edu

====

## Bug fixes:

* Fixed - Password is now hidden

* Fixed - Advanced Room booking feature is fixed 

* Fixed - Admins/members could delete themself from the MyProfile page.

* Fixed - Reservations and rooms and members should be linked. Deleting any one should have a cascading effect.

* Fixed - Members/Admins can change every thing except their email ids

*  Fixed - Super admin settings cannot be changed at all. This is to make sure no one changes super user details (makes it difficult for others to review).

=====

### Team Members: 

* Vivek Bhat: vbhat@ncsu.edu,
* Saloni Desai: sndesai@ncsu.edu,
* Priyal Jain: pjain12@ncsu.edu

