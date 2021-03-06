# Secure Text Transfer Using Diffie-Hellman Key Exchange Based On Cloud

Security on cloud has been a hot topic. Even the tech giants like google and amazon spend hefty capital to strengthen their security. We, here have implemented a secure text transfer using diffie-hellman key exchange algorithm.

## Diffie-Hellman Key Exchange

Diffie-Hellman key exchange (DH) is a method of securely exchanging cryptographic keys over a
public channel and was one of the first public-key protocols named after Whitfield Diffie and
Martin Hellman. DH is one of the earliest practical examples of public key exchange
implemented within the field of cryptography.</br>
In public key cryptosystem, enciphering and deciphering are governed by distinct keys, E and D,
such that computing D from E is computationally infeasible (e.g., requiring more than 10^100
instructions). The enciphering key E can thus be publicly disclosed without compromising the
deciphering key D. This was the main ideology behind Diffie-Hellman Key Exchange Protocol.
Each user of the network can, therefore, place his enciphering key in a public directory. This
enables any user of the system to send a message to any other user enciphered in such a way that
only the intended receiver can decipher it. As such, a public key cryptosystem is a multiple access
cipher. A private conversation can therefore be held between any two individuals regardless of
whether they have ever communicated before. Each one sends messages to the other enciphered in
the receiver public enciphering key and deciphers the messages he receives using his own secret
deciphering key.

### Working example of Diffie-Hellman 

*p* is a prime number </br>
*g* is a primitive root modulo of *p*

* Alice and Bob agree to use a modulus p = 23 and base g = 5
* Alice gets her private key (key which she should not share with anyone) generated as 4.
* Thus, public key generated for Alice shall be 5^4 %23 = 625%23 = 4
* Bob gets his private key (key which he should not share with anyone) generated as 3.
* Thus, public key generated for Bob shall be 5^3 %23 = 125%23 = 10
* Now, Alice gets the public key of Bob and generates a secret key. i.e.
(public key of Bob ^ Private Key of Alice) mod p
=> (10^4 ) % 23 => 10000 % 23 => 18
* On the other side, Bob also uses a similar method to generate a secret key i.e.
(public key of Alice ^ Private Key of Bob) mod p
=> (4^3 ) % 23 => 64 % 23 => 18

##### Dependencies and Tools
```
For GUI:
pip install secretsharing
pip install tkinter
pip install pycryptodome
pip install hashlib
pip install webbrowser

For Web Application:
pip install flask
```
## PROJECT

This implementation can be explained in two parts
* stand-alone-application
* web-application

### Standalone-application

![stand-alone-application](/web-app/static/gui.gif)

* This portion deals with encryption and decryption of file
* The file is encrypted using AES algorithm
* *Menu* option also helps to toggle the menu to upload and download files</br></br>

### Web-application
![web-application](/web-app/static/webapp.png)


Once file is encrypted it has to be uploaded on an online directory. Another directory is needed where public-key of all the users is stored. Thus, we built an online directory and hosted it on cloud. The unique thing about hosting is that dynamic files are being generated while adding a new user or uploading a text file. Thus, we needed a cloud service which could run the program and incorporate the dynamic files. 

### Hosting on AWS

* Fork this repository
* create an amazon EC2 instance.
* Select and create **Amazon Linux AMI 2018.03.0 (HVM), SSD Volume Type**
* While creating the machine, toggle to menu *Configure Security Group* menu.
* Here, enable port SSH, HTTP, RDP and in port, change *Source* to **Anywhere**
* Download and keep the **publicKeyPair.pem file**
* Install *putty* and *puttygen*
* Open puttygen, select the publicKeyPair.pem and generate a private key. Now, save it as **Save private key**
* Open the AWS machine dashboard ad copy the *IPv4 Public IP* of the instance created
* Open putty
* In putty, copy the IP in *Host Name(or IP address)*
* In putty, toggle the SSH>Auth and here, select the *private key* you generated.
* Click open and voila! The terminal of instance opens
-----------------------------------------------------
* Enter "login as:" ec2-user
* Enter following command
* $sudo bash
* $yum install python-pip
* $yum install git
* $pip install flask
* Now, clone the forked repository on local machine
* In src/web-application/app.py, comment on line 169 and uncomment line 168
* Update the github repository
* On the terminal of instance, clone the repository and enter command
* $python app.py

