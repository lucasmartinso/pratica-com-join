CREATE DATABASE pratica

CREATE TABLE states ( 
	id SERIAL PRIMARY KEY, 
	name TEXT NOT NULL
); 

CREATE TABLE cities ( 
	id SERIAL PRIMARY KEY, 
	name TEXT NOT NULL,
	"stateId" INTEGER NOT NULL REFERENCES states(id)
); 

CREATE TABLE customers ( 
	id SERIAL PRIMARY KEY, 
	"fullName" TEXT NOT NULL, 
	cpf varchar(11) NOT NULL UNIQUE, 
	email TEXT NOT NULL UNIQUE, 
	password TEXT NOT NULL 
);

CREATE TABLE "customersAddresses" (
	id SERIAL PRIMARY KEY, 
	"customerId" INTEGER NOT NULL REFERENCES customers(id),
	street TEXT NOT NULL, 
	number INTEGER NOT NULL, 
	complement TEXT DEFAULT 'none', 
	"postalCode" INTEGER NOT NULL, 
	"cityId" INTEGER NOT NULL REFERENCES cities(id)
);

CREATE TABLE "customerPhones" ( 
	id SERIAL PRIMARY KEY, 
	"customerId" INTEGER NOT NULL REFERENCES customers(id), 
	number INTEGER NOT NULL, 
	type TEXT NOT NULL
);

CREATE TABLE "bankAccount" (
	id SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES customers(id), 
	"accountNumber" TEXT NOT NULL UNIQUE, 
	agency TEXT NOT NULL, 
	"openDate" TIMESTAMP NOT NULL, 
	"closeDate" TIMESTAMP NOT NULL
);

CREATE TABLE "creditCards" (
	id SERIAL PRIMARY KEY, 
	"bankAccountId" INTEGER REFERENCES "bankAccount"(id),
	name TEXT NOT NULL, 
	number INTEGER NOT NULL, 
	"securityCode" TEXT NOT NULL, 
	"expirationMonth" DATE NOT NULL,
	"expirationYear" DATE NOT NULL, 
	password TEXT NOT NULL,
	"limit" INTEGER NOT NULL DEFAULT 20000
);

CREATE TABELE transactions (
 id SERIAL PRIMARY KEY,
 	"bankAccountId" INTEGER REFERENCES "bankAccount"(id),
  amount INTEGER NOT NULL, 
  type TEXT NOT NULL DEFAULT 'mobile',
  time TIME NOT NULL,  
  description TEXT DEFAULT 'none',  
  cancelled BOOLEAN NOT NULL DEFAULT 'false'    
);

