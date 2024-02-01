SELECT cats.id, cats.name, types.type, cats.age, cats.weight
FROM cats
         JOIN types ON cats.type_id = types.id
WHERE cats.id < 20;
