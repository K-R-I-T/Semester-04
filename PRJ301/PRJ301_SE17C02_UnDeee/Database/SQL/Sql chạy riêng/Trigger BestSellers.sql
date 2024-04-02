-- Tạo hoặc thay đổi trigger cho INSERT
DELIMITER //

CREATE TRIGGER after_order_detail_insert
AFTER INSERT ON orderdetails
FOR EACH ROW
BEGIN
    -- Cập nhật hoặc chèn vào bảng bestseller
    INSERT INTO bestseller (product_id, count)
    VALUES (NEW.product_id, NEW.quantity)
    ON DUPLICATE KEY UPDATE count = count + NEW.quantity;
END;
//

DELIMITER ;


-- Tạo hoặc thay đổi trigger cho UPDATE
DELIMITER //

CREATE TRIGGER after_order_detail_update
AFTER UPDATE ON orderdetails
FOR EACH ROW
BEGIN
    -- Cập nhật bảng bestseller
    UPDATE bestseller
    SET count = count + (NEW.quantity - OLD.quantity)
    WHERE product_id = NEW.product_id;
END;
//

DELIMITER ;


-- Tạo hoặc thay đổi trigger cho DELETE
DELIMITER //

CREATE TRIGGER after_order_detail_delete
AFTER DELETE ON orderdetails
FOR EACH ROW
BEGIN
    -- Cập nhật bảng bestseller
    UPDATE bestseller
    SET count = count - OLD.quantity
    WHERE product_id = OLD.product_id;
END;
//

DELIMITER ;
