-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "email" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Password" (
    "hash" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    CONSTRAINT "Password_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Note" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "body" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "userId" TEXT NOT NULL,
    CONSTRAINT "Note_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "Contractor" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT NOT NULL, 
    "websiteURL" TEXT,
    "address" TEXT,
    "numberOfReviews" INTEGER
);

CREATE TABLE "Certification" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "contractor_id" TEXT NOT NULL,
    "certification_name" TEXT NOT NULL,
    UNIQUE (contractor_id, certification_name), 
    FOREIGN KEY ("contractor_id") REFERENCES "Contractor"("id")
);

CREATE TABLE "Service" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "contractor_id" TEXT NOT NULL,
    "service_name" TEXT NOT NULL,
    UNIQUE (contractor_id, service_name), 
    FOREIGN KEY ("contractor_id") REFERENCES "Contractor"("id")
);

CREATE TABLE "StatesServed" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "contractor_id" TEXT NOT NULL,
    "state" TEXT NOT NULL CHECK(state IN ('MD', 'VA', 'DC')),
    UNIQUE (contractor_id, state), 
    FOREIGN KEY ("contractor_id") REFERENCES "Contractor"("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Password_userId_key" ON "Password"("userId");
