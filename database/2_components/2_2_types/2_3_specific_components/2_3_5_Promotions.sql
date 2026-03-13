INSERT INTO
    promotions (
        name,
        discount_type,
        discount_value,
        start_date,
        end_date
    )
VALUES
    ('Spring-Sale', 'percentage', 20, '2026-04-01', '2026-04-30');


-- Template to set promotion for an individual component
SELECT
    c.name,
    c.net_price,
    p.discount_type,
    p.discount_value
FROM components c
LEFT JOIN promotion_components pc
    ON c.id = pc.component_id
LEFT JOIN promotions p
    ON pc.promotion_id = p.id
WHERE p.active = TRUE