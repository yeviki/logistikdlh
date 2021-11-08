statusdetail
detail_permintaan
BEFORE
UPDATE

BEGIN
IF old.qty_req = new.qty_acc THEN
SET new.status_det_req = 1;
ELSEIF old.qty_req > new.qty_acc THEN
SET new.status_det_req = 2;
END IF;

IF new.qty_acc = 0 THEN
SET new.status_det_req = 3;
END IF;
END