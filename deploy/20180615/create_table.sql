CREATE TABLE `slice_stop_example` (
    `id`            BIGINT UNSIGNED NOT NULL PRIMARY KEY,
    `t`             TINYINT UNSIGNED NOT NULL,
    `side`          TINYINT UNSIGNED NOT NULL,
    `create_time`   DOUBLE NOT NULL,
    `update_time`   DOUBLE NOT NULL,
    `user_id`       INT UNSIGNED NOT NULL,
    `market`        VARCHAR(30) NOT NULL,
    `source`        VARCHAR(30) NOT NULL,
    `fee_asset`     VARCHAR(30) NOT NULL,
    `fee_discount`  DECIMAL(40,4) NOT NULL,
    `stop_price`    DECIMAL(40,8) NOT NULL,
    `price`         DECIMAL(40,8) NOT NULL,
    `amount`        DECIMAL(40,8) NOT NULL,
    `taker_fee`     DECIMAL(40,4) NOT NULL,
    `maker_fee`     DECIMAL(40,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stop_history_example` (
    `id`            BIGINT UNSIGNED NOT NULL PRIMARY KEY,
    `create_time`   DOUBLE NOT NULL,
    `finish_time`   DOUBLE NOT NULL,
    `user_id`       INT UNSIGNED NOT NULL,
    `market`        VARCHAR(30) NOT NULL,
    `source`        VARCHAR(30) NOT NULL,
    `fee_asset`     VARCHAR(30) NOT NULL,
    `fee_discount`  DECIMAL(40,4) NOT NULL,
    `t`             TINYINT UNSIGNED NOT NULL,
    `side`          TINYINT UNSIGNED NOT NULL,
    `stop_price`    DECIMAL(40,8) NOT NULL,
    `price`         DECIMAL(40,8) NOT NULL,
    `amount`        DECIMAL(40,8) NOT NULL,
    `taker_fee`     DECIMAL(40,4) NOT NULL,
    `maker_fee`     DECIMAL(40,4) NOT NULL,
    `status`        TINYINT UNSIGNED NOT NULL,
    INDEX `idx_user_time` (`user_id`, `create_time`),
    INDEX `idx_user_side_time` (`user_id`, `side`, `create_time`),
    INDEX `idx_user_market_time` (`user_id`, `market`, `create_time`),
    INDEX `idx_user_market_side_time` (`user_id`, `market`, `side`, `create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
