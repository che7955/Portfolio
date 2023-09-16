CREATE DATABASE  IF NOT EXISTS `recipes` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recipes`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: recipes
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ingredientlist`
--

DROP TABLE IF EXISTS `ingredientlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientlist` (
  `recipeId` int NOT NULL DEFAULT '0',
  `IngredientId` int NOT NULL DEFAULT '0',
  `quantity` double DEFAULT NULL,
  PRIMARY KEY (`recipeId`,`IngredientId`),
  KEY `ingredientlist_ingredients_fk` (`IngredientId`),
  CONSTRAINT `ingredientlist_ingredients_fk` FOREIGN KEY (`IngredientId`) REFERENCES `ingredients` (`IngredientId`),
  CONSTRAINT `ingredientlist_recipe_fk` FOREIGN KEY (`recipeId`) REFERENCES `recipe` (`RecipeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientlist`
--

LOCK TABLES `ingredientlist` WRITE;
/*!40000 ALTER TABLE `ingredientlist` DISABLE KEYS */;
INSERT INTO `ingredientlist` VALUES (1,1,1.5),(1,2,1),(1,3,1),(1,4,1),(1,5,0.5),(1,6,0.125),(1,7,1),(1,8,0.5),(1,9,1),(1,10,1),(1,11,0.125),(2,6,0.125),(2,10,2),(2,18,1),(2,22,1),(2,23,0.5),(2,24,0.25),(2,25,0.25),(2,26,1),(2,27,1),(2,28,0.125),(2,29,0.25),(2,30,0.25),(2,31,1),(2,32,1),(3,13,4),(3,15,2.5),(3,16,0.75),(3,17,21),(3,18,1),(3,20,0.5),(3,21,1),(4,5,0.125),(4,9,0.25),(4,21,1),(4,33,1),(4,34,2),(4,35,1),(4,36,1),(4,37,1),(4,38,0.125),(4,39,0.25),(4,40,0.25),(5,10,1),(5,13,1),(5,20,2.5),(5,23,0.125),(5,31,0.125),(5,32,0.25),(5,41,3),(5,42,0.125),(5,43,0.5),(10,50,1),(11,50,3),(12,50,6);
/*!40000 ALTER TABLE `ingredientlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `IngredientId` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `cost` double DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IngredientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'beef cube steak',3,'beef'),(2,'onion, sliced into thin rings',0.5,'vegetable'),(3,'green bell pepper, sliced in rings',0.5,'vegetable'),(4,'Italian seasoned bread crumbs',0.1,'bread'),(5,'grated Parmesan cheese',5,'cheese'),(6,'olive oil',5,'oil'),(7,'spaghetti sauce',3,'sauce'),(8,'shredded mozzarella cheese',3,'cheese'),(9,'angel hair pasta',1,'pasta'),(10,'garlic',0.1,'vegetable'),(11,'butter',2,'oil'),(12,'whole egg',0.15,'egg'),(13,'egg yolk',0.15,'egg'),(14,'egg white',0.15,'egg'),(15,'milk',0.2,'dairy'),(16,'sugar',0.2,'sugar'),(17,'biscuit',0.2,'bread'),(18,'lemon zest',0.5,'fruit'),(19,'orange zest',0.5,'fruit'),(20,'flour',0.5,'bread'),(21,'heavy cream',1,'fat'),(22,'linguini ',1,'pasta'),(23,'Italian seasoning ',0.15,'herb'),(24,'dried thyme',0.15,'herb'),(25,'red pepper flakes',0.15,'herb'),(26,'crushed tomatoes',1,'vegetable'),(27,'black olives',1,'vegetable'),(28,'baby clams',3,'fish'),(29,'salad shrimp',10,'fish'),(30,'scallops',8,'fish'),(31,'salt',0.01,'herb'),(32,'black pepper',0.05,'herb'),(33,'fish fumet',10,'fish'),(34,'lobster',18,'fish'),(35,'bouillon',1,'sauce'),(36,'white wine',10,'wine'),(37,'chervil',10,'wine'),(38,'tarragon',5,'herb'),(39,'shallots',3,'vegetable'),(40,'mustard',2,'condiment'),(41,'whole chicken',1.75,'chicken'),(42,'paprika',5,'herb'),(43,'beer',1,'alcohol'),(50,'Some Meat',1,'beef');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutrition`
--

DROP TABLE IF EXISTS `nutrition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutrition` (
  `name` varchar(100) NOT NULL DEFAULT '',
  `quantity` double DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `recipeId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`recipeId`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutrition`
--

LOCK TABLES `nutrition` WRITE;
/*!40000 ALTER TABLE `nutrition` DISABLE KEYS */;
INSERT INTO `nutrition` VALUES ('calories',1167,'calories',1),('carbohydrates',45,'grams',1),('fat',23,'grams',1),('protein',32,'grams',1),('calories',532,'calories',2),('carbohydrates',59,'grams',2),('fat',12,'grams',2),('protein',29,'grams',2),('calories',612,'calories',3),('carbohydrates',45,'grams',3),('fat',49,'grams',3),('protein',4,'grams',3),('calories',1215,'calories',4),('carbohydrates',67,'grams',4),('fat',57,'grams',4),('protein',57,'grams',4),('calories',750,'calories',5),('carbohydrates',45,'grams',5),('fat',30,'grams',5),('protein',30,'grams',5),('calories',3000,'calories',10),('calories',3100,'calories',11),('calories',3500,'calories',12);
/*!40000 ALTER TABLE `nutrition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `RecipeId` int NOT NULL,
  `Source` varchar(60) DEFAULT NULL,
  `Comments` varchar(255) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `numServings` int DEFAULT NULL,
  PRIMARY KEY (`RecipeId`),
  CONSTRAINT `FK_recipe_nutrition_recipeID` FOREIGN KEY (`RecipeId`) REFERENCES `nutrition` (`recipeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,'julia Childs','','Beef Parmesan with Garlic Angel Hair Pasta',4),(2,'Mom','','Linguine Pescadoro',4),(3,'Mom','','Zuppa Inglese',4),(4,'Paul Prudhome','','Lobster Thermadore',4),(5,'Cooks.Com','','Crispy Fried Chicken',4),(10,'Jim Habermas','Best Meal','Aged Prime Rib',2),(11,'Jim Habermas','','Perfect Filet Mignon for Two',2),(12,'Jim Habermas','Very good','Crock Pot - Pot Roast',12);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `steps`
--

DROP TABLE IF EXISTS `steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `steps` (
  `StepNumber` int NOT NULL DEFAULT '0',
  `stepDescription` varchar(255) DEFAULT NULL,
  `recipeId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`recipeId`,`StepNumber`),
  CONSTRAINT `steps_recipe_FK` FOREIGN KEY (`recipeId`) REFERENCES `recipe` (`RecipeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `steps`
--

LOCK TABLES `steps` WRITE;
/*!40000 ALTER TABLE `steps` DISABLE KEYS */;
INSERT INTO `steps` VALUES (1,'Preheat oven to 350 degrees F (175 degrees C).',1),(2,'Cut cube steak into serving size pieces. Coat meat with the bread crumbs and parmesan cheese. Heat olive oil in a large frying pan, and saute 1 teaspoon of the garlic for 3 minutes.',1),(3,'Quick fry (brown quickly on both sides) meat. Place meat in a casserole baking dish, slightly overlapping edges. Place onion rings and peppers on top of meat, and pour marinara sauce over all',1),(4,'Bake at 350 degrees F (175 degrees C) for 30 to 45 minutes, depending on the thickness of the meat. Sprinkle mozzarella over meat and leave in the oven till bubbly.',1),(5,'Boil pasta al dente. Drain, and toss in butter and 1 teaspoon garlic. For a stronger garlic taste, season with garlic powder. Top with grated parmesan and parsley for color. Serve meat and sauce atop a mound of pasta!',1),(1,'In a heavy saucepan over medium heat saute garlic in olive oil until garlic softens.',2),(2,'Add Italian seasoning, thyme, crushed red pepper flakes, crushed tomatoes, black olives, and the juice from both cans of clams. Simmer for 15 minutes.',2),(3,'Mix in canned clams, shrimp, scallops, lemon zest, and salt and pepper to taste.',2),(4,'Simmer for an additional 15 minutes or until shrimp and clams are cooked.',2),(5,'In a large pot of boiling salted water cook linguini until al dente. Drain.',2),(6,'Toss cooked and drained linguine pasta over seafood sauce. Serve warm.',2),(1,'Warm up the milk in a nonstick sauce pan',3),(2,'In a large bowl beat the egg yolks with the sugar, add the flour and combine the ingredients until well mixed.',3),(4,'Put the mixture into the sauce pan and cook it on the stove at a medium low heat. Mix the cream continuously with a wooden spoon. When it starts to thicken remove it from the heat and pour it on a large plate to cool off.',3),(5,'Stir the cream now and then so that the top doesn\'t harden.',3),(6,'Dip quickly both sides of the lady fingers in the liquor. Layer them one at the time in a glass bowl large enough to contain 7 biscuits.',3),(7,'Spread 1/3 of the cream and repeat the layer with lady fingers. Finish with the cream.',3),(1,'Split the live lobsters in two, lengthwise. Crack the shell of the claws and remove the gills.',4),(2,'Season the lobster halves with salt and roast in the oven for 15-20 minutes. Remove and dice the flesh from the claws and tails.',4),(3,'Prepare the stock using equal portions of meat juices, fish fumet, and white wine flavored with chervil, tarragon and chopped shallots.',4),(4,'Boil it down to a concentrated consistency, then add heavy cream and English mustard.',4),(5,'Boil the sauce for a few minutes, then whisk in some fresh butter (cold cut into cubes and in 1/3 of the volume of the sauce).',4),(6,'Pour a little of this sauce in the shells of the lobsters. Fill the shells with the flesh of the lobsters.',4),(7,'Cover with the remainder of the sauce, sprinkle with a little Parmesan cheese and brown rapidly in a very hot oven.',4),(1,'Combine flour and seasonings in bowl.',5),(2,'Combine egg yolks and beer.',5),(3,'Add gradually to dry ingredients.',5),(4,'Heat oil in deep fryer to 365 degrees.',5),(5,'Moisten chicken pieces. Dip in seasoned flour, then batter, then back in seasoned flour.',5),(6,'Fry in hot oil 15 to 18 minutes until well browned. Drain on paper.',5);
/*!40000 ALTER TABLE `steps` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-12 19:00:16
