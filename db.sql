CREATE TABLE `Account` (
	`address` varchar(255) NOT NULL,
	`balance` int(255) NOT NULL,
	PRIMARY KEY (`address`)
);

CREATE TABLE `Transaction` (
	`blockNumber` int NOT NULL,
	`timeStamp` int NOT NULL,
	`hash` varchar(255) NOT NULL,
	`nonce` int(255) NOT NULL,
	`blockHash` varchar(255) NOT NULL,
	`transactionIndex` varchar(255) NOT NULL,
	`from` varchar(255) NOT NULL,
	`to` varchar(255) NOT NULL,
	`value` bigint NOT NULL,
	`gas` int(255) NOT NULL,
	`gasPrice` bigint NOT NULL,
	`isError` varchar(255) NOT NULL,
	`txreceipt_status` varchar(255),
	`input` varchar(255) NOT NULL,
	`contractAddress` varchar(255),
	`cumulativeGasUsed` int(255) NOT NULL,
	`gasUsed` int(255) NOT NULL,
	`confirmations` int(255) NOT NULL,
	PRIMARY KEY (`hash`)
);

ALTER TABLE `Transaction` ADD CONSTRAINT `Transaction_fk0` FOREIGN KEY (`from`) REFERENCES `Account`(`address`);

CREATE UNIQUE INDEX idx_hash ON Transaction (`hash`);
CREATE INDEX idx_from ON Transaction (`from`);
CREATE INDEX idx_to ON Transaction (`to`);
CREATE UNIQUE INDEX idx_address ON Account (`address`);

INSERT INTO Account (address, balance)
VALUES ("0xddbd2b932c763ba5b1b7ae3b362eac3e8d40121a", 9000000);

INSERT INTO Transaction (blockNumber, timeStamp, hash, nonce, blockHash, transactionIndex, `from`, `to`, `value`, gas, gasPrice, isError, txreceipt_status, input, contractAddress, cumulativeGasUsed, gasUsed, confirmations )
VALUES (47884, 1438947953, "0xad1c27dd8d0329dbc400021d7477b34ac41e84365bd54b45a4019a15deb10c0d", 0, "0xf2988b9870e092f2898662ccdbc06e0e320a08139e9c6be98d0ce372f8611f22", "0", "0xddbd2b932c763ba5b1b7ae3b362eac3e8d40121a", "0x2910543af39aba0cd09dbb2d50200b3e800a63d2", 5000000000000000000, 23000, 400000000000, "0", "", "0x454e34354139455138", "", 21612, 21612, 13460105);

select * from Account;
select * from Transaction;
