SELECT
    w.id,
    wp.age,
    w.coins_needed,
    w.power
FROM wands w
LEFT JOIN wands_property wp ON w.code = wp.code
WHERE wp.is_evil=0
ORDER BY w.power DESC, wp.age DESC;