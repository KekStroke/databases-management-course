DROP TABLE IF EXISTS ledger;
CREATE TABLE IF NOT EXISTS ledger (
   transactionId SERIAL PRIMARY KEY,
   fromId INT,
   toId INT,
   fee INT,
   amount INT,
   transactionDateTime TIMESTAMP
);