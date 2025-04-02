-- Using this dataset https://www.kaggle.com/datasets/rtatman/lego-database/data

--- Find the total parts by theme name
SELECT
  t.name,
  sum(s.num_parts) AS total_parts
FROM
  lego_sets s
  LEFT JOIN lego_themes t ON s.theme_id = t.id
GROUP BY
  t.name
HAVING
  SUM(s.num_parts) < 10000
ORDER BY
  total_parts DESC;

--- Find the total parts per color
SELECT
  c.name,
  COUNT(ip.part_num) AS parts_per_color
FROM
  lego_inventory_parts ip
  LEFT JOIN lego_colors c ON ip.color_id = c.id
GROUP BY
  c.name
ORDER BY
  parts_per_color DESC;
