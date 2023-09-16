-- Eng, Chris 
-- PE# 08 
-- 11/7/2022 
-- ISTE230
-- Professor: Habermas, James

-- # PE#8 – Question 1 – 
SELECT name FROM recipe WHERE source = "mom";

-- # PE#8 – Question 2 – 
SELECT recipe.name FROM recipe JOIN nutrition USING(recipeId)
    WHERE nutrition.quantity < 800;

-- # PE#8 – Question 3 – 
SELECT ingredients.name, ingredientlist.quantity FROM recipe
    JOIN ingredientlist USING (recipeId)
    JOIN ingredients USING (IngredientId)
        WHERE recipe.name like "Beef Parmesan%";

-- # PE#8 – Question 4 – 
SELECT ingredientlist.recipeId FROM ingredientlist
    JOIN ingredients USING (IngredientId)
        WHERE LOWER(ingredients.type) IN ("beef", "chicken", "pork", "lamb");

-- # PE#8 – Question 5 – 
SELECT distinct recipe.name FROM recipe JOIN nutrition USING(recipeId)
    JOIN ingredientlist USING (recipeId)
    JOIN ingredients USING (IngredientId)
        WHERE nutrition.name = "calories"
        AND nutrition.quantity < 700
        AND ingredients.type = "fish";
