CREATE TABLE "public.Users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "Users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" int NOT NULL,
	"mainPhoto" TEXT NOT NULL,
	"otherPhotos" TEXT NOT NULL,
	"sizeId" serial NOT NULL,
	"categoryId" serial NOT NULL,
	CONSTRAINT "Products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.UserBought" (
	"id" serial NOT NULL,
	"productId" serial NOT NULL,
	"userId" serial NOT NULL,
	"size" varchar(1) NOT NULL,
	"amount" int NOT NULL,
	"address" TEXT NOT NULL,
	"buyDate" TIMESTAMP NOT NULL,
	"state" varchar(9) NOT NULL,
	CONSTRAINT "UserBought_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Sizes" (
	"id" serial NOT NULL,
	"productId" int NOT NULL,
	"name" varchar(1) NOT NULL,
	"amount" int NOT NULL,
	CONSTRAINT "Sizes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Category" (
	"id" serial NOT NULL,
	"productId" int NOT NULL,
	"name" int NOT NULL,
	CONSTRAINT "Category_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Products" ADD CONSTRAINT "Products_fk0" FOREIGN KEY ("sizeId") REFERENCES "Sizes"("id");
ALTER TABLE "Products" ADD CONSTRAINT "Products_fk1" FOREIGN KEY ("categoryId") REFERENCES "Category"("id");

ALTER TABLE "UserBought" ADD CONSTRAINT "UserBought_fk0" FOREIGN KEY ("productId") REFERENCES "Products"("id");
ALTER TABLE "UserBought" ADD CONSTRAINT "UserBought_fk1" FOREIGN KEY ("userId") REFERENCES "Users"("id");

ALTER TABLE "Sizes" ADD CONSTRAINT "Sizes_fk0" FOREIGN KEY ("productId") REFERENCES "Products"("id");

ALTER TABLE "Category" ADD CONSTRAINT "Category_fk0" FOREIGN KEY ("productId") REFERENCES "Products"("id");





