# 1. Introduction
I am developing a Mobile Application for online shopping, this app will have 
a login and registration page form which users can make a new id or login to 
the application, after login/registration, user will be navigated to a new page 
where different categories will be present, user can select his/her desired 
category and, buy things and their order history will also be saved.
# 2. Objectives
 Send data to database
 Receive data from database
 Update record on database
 Delete record on database
 Maing an Efficient Application.
 
# 3. Project Description
This project will have different screens, like login, registration, cart, drawers,
logged in, selected, and buy now screens. From start user will have to login (if 
he/she already has an account otherwise user must create a new id), after login 
user will be navigated to logged in screen where use have different categories 
which user can select according to his/her desire. They will also be a drawer 
icon where user can change his/her password or username and user can also 
delete his/her profile, there will also be previous order button from where user 
can check his/her previous orders he/she has done in past. In categories there
will be different items which user can add to cart, cart icon will be present on 
logged in screen app bar, user can check what he/she has added to cart can 
he/she can also remove items from cart, there will also be a button to buy 
things after pressing the ‘BUY’ button use will be navigated to add 
credit/debit card information and user can but this from there.
# 4. Methodology
This app will be developed on FLUTTER, the frontend will be developed on 
flutter, for backend, REST API PHP will be used to send and receive data to 
and from SQL SERVER as JSON, for cart I will use object-oriented
programming to make an object of user and to store his/her items in a list, and 
to store data SQL SERVER will be used.
# 5. Detail
# Login / Signup Pages:
•	This app contains login and sign up, if a user   wants to sign up, he must provide a unique username and email to sign up, username and email will be checked in the database that they do not exist in database, if they already exist in the database then user will be asked to try with new username and email.
•	 For login same thing will happen, when user will enter email and password app will send that username and password to PHP file through REST API than PHP will authenticate that this username and password exist in the database or not.
![image](https://user-images.githubusercontent.com/91987110/193235666-74907622-6b6b-46cd-8831-a485e67acd24.png)
# Logged In page
•	After the login/sign up process if the username and password were existed in the database the App will navigate the user to logged in Screen.
•	In logged in screen user can select desired category form where he/she can buy different items.
•	User can also access cart and drawer buttons as they are available on logged in screen. 
![image](https://user-images.githubusercontent.com/91987110/193235877-f94d348f-2ea6-4db4-af02-72e37e79d60f.png)
# Drawers :
•	In customer side there are three drawers are available those are Delete account, change your account id and password, and show you previous order.
•	In Delete your account your id will be deleted.
•	In change your Account user will allowed to change his/her account information.
•	In Previous Order user will be able to see his/her previous order and able cancel and uncanceled the orders.
![image](https://user-images.githubusercontent.com/91987110/193236190-d33f704d-2471-40b9-9e4b-b6584341d567.png)
![image](https://user-images.githubusercontent.com/91987110/193236223-864c6e1b-f4ec-411e-b1a1-6852be41a7d3.png)

# Forget password, Cart and Payment:
•	All the things the user will buy will be added to cart, at backend I have used OOP to store the cart items after cart in closed, this will save the data in cart until the app is closed.
•	At cart user will have a button to buy his/her selected stuff and processed to payment method, here user have to add his/her credit/Debit card information.
•	  In case if user forget his/her password they have option to recover it by email, user must remember his/her email because OTP will only be sent to email saved in database and it also will be matched before sending OTP.
![image](https://user-images.githubusercontent.com/91987110/193236441-1e608158-e06c-49ef-a570-538c578feef8.png)
![image](https://user-images.githubusercontent.com/91987110/193236470-0d849b05-42df-482c-a797-bd235e6c455c.png)
![image](https://user-images.githubusercontent.com/91987110/193236481-0d75525d-043a-4c1a-98c8-4adeee2621a9.png)
# Insert Item Page
•	After the Shop Owner have logged in now User can upload items to data base by selecting Desired Category.
![image](https://user-images.githubusercontent.com/91987110/193236706-9c8a7597-3bf4-4f4f-819d-c303c9c49564.png)



# Break Down:
![image](https://user-images.githubusercontent.com/91987110/193236069-2d701059-a3b7-4da7-bc80-db9b39c037c4.png)

