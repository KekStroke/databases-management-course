DROP TABLE IF EXISTS accounts;
CREATE TABLE IF NOT EXISTS accounts (
   accoutId INT PRIMARY KEY,
   accountName VARCHAR(255),
   credit INT,
   currency VARCHAR(255) 
);

DROP TABLE IF EXISTS ledger;
CREATE TABLE IF NOT EXISTS ledger (
   transactionId SERIAL PRIMARY KEY,
   fromId INT,
   toId INT,
   fee INT,
   amount INT,
   transactionDateTime TIMESTAMP
);

INSERT INTO accounts VALUES (1, 'Account 1', 1000,'Rubles');
INSERT INTO accounts VALUES (2, 'Account 2', 1000,'Rubles');
INSERT INTO accounts VALUES (3, 'Account 3', 1000,'Rubles');

-- Transaction 1: Account 1 send 500 RUB to Account 3
START TRANSACTION;
SAVEPOINT T1;
UPDATE accounts SET credit = credit - 500 WHERE accoutId = 1;
UPDATE accounts SET credit = credit + 500 WHERE accoutId = 3;
INSERT INTO ledger (fromid, toid, fee, amount, transactiondatetime) VALUES (1, 3, 0, 1000, NOW());
COMMIT;

-- Transaction 2: Account 2 send 700 RUB to Account 1
START TRANSACTION;
SAVEPOINT T2;
UPDATE accounts SET credit = credit - 700 WHERE accoutId = 2;
UPDATE accounts SET credit = credit + 700 WHERE accoutId = 1;
INSERT INTO ledger (fromid, toid, fee, amount, transactiondatetime) VALUES (1, 3, 0, 700, NOW());

COMMIT;

-- Transaction 3: Account 2 send to 100 RUB to Account 3
START TRANSACTION;
SAVEPOINT T3;
UPDATE accounts SET credit = credit - 100 WHERE accoutId = 2;
UPDATE accounts SET credit = credit + 100 WHERE accoutId = 3;
INSERT INTO ledger (fromid, toid, fee, amount, transactiondatetime) VALUES (1, 3, 0, 100, NOW());
COMMIT;

SELECT * FROM accounts;