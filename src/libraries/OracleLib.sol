// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

/**
 * @title OracleLib
 * @author Sumit Mazumdar
 * @notice This library is used to check the Chainlink Oracle for stale data.
 * If a price is stale, the function will revert and render the DSCEngine unusuable - This is
 * by design
 *
 * We want DSCEngine to freeze if price become stale.
 *
 * So if the Chainlink network explodes and you have a lot of money locked in the protocol ....
 */
library OracleLib {
    error OracleLib__StalePrice();

    uint256 private constant TIME_OUT = 3 hours;

    function staleCheckLatestRounData(AggregatorV3Interface priceFeed)
        public
        view
        returns (uint80, int256, uint256, uint256, uint80)
    {
        (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound) =
            priceFeed.latestRoundData();

        uint256 secondsSince = block.timestamp - updatedAt;

        if (secondsSince > TIME_OUT) revert OracleLib__StalePrice();

        return (roundId, answer, startedAt, updatedAt, answeredInRound);
    }
}
