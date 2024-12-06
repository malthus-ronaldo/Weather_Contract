// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {WeatherNFT} from "../src/Weather.sol";

contract WeatherTest is Test {
    WeatherNFT public weatherNFT;

    address public owner = address(0x123);
    address public user1 = address(0x456);

    function setUp() public {
        vm.prank(owner);
        weatherNFT = new WeatherNFT();
    }

    function testMintWeatherNFT() public {
        vm.prank(owner);
        weatherNFT.mintWeatherNFT(
            user1,
            25,
            80,
            10,
            "ipfs://sunny_image",
            "Sunny"
        );

        assertEq(
            weatherNFT.ownerOf(0),
            user1,
            "Owner of token 0 should be user1"
        );

        WeatherNFT.WeatherData memory weather = weatherNFT.getCurrentWeather(0);
        assertEq(weather.temperature, 25, "Temperature should be 25");
        assertEq(weather.humidity, 80, "Humidity should be 80");
        assertEq(weather.windSpeed, 10, "Wind speed should be 10");
        assertEq(weather.description, "Sunny", "Description should be Sunny");
    }

    function testUpdateWeatherData() public {
        vm.prank(owner);
        weatherNFT.mintWeatherNFT(
            user1,
            25,
            80,
            10,
            "ipfs://sunny_image",
            "Sunny"
        );

        vm.prank(owner);
        weatherNFT.updateWeatherData(
            0,
            20,
            70,
            15,
            "ipfs://cloudy_image",
            "Cloudy"
        );

        WeatherNFT.WeatherData memory weather = weatherNFT.getCurrentWeather(0);
        assertEq(weather.temperature, 20, "Temperature should be 20");
        assertEq(weather.humidity, 70, "Humidity should be 70");
        assertEq(weather.windSpeed, 15, "Wind speed should be 15");
        assertEq(weather.description, "Cloudy", "Description should be Cloudy");
    }

    function testGetWeatherHistory() public {
        vm.prank(owner);
        weatherNFT.mintWeatherNFT(
            user1,
            25,
            80,
            10,
            "ipfs://sunny_image",
            "Sunny"
        );

        vm.prank(owner);
        weatherNFT.updateWeatherData(
            0,
            20,
            70,
            15,
            "ipfs://cloudy_image",
            "Cloudy"
        );

        vm.prank(owner);
        weatherNFT.updateWeatherData(
            0,
            15,
            60,
            20,
            "ipfs://rainy_image",
            "Rainy"
        );

        WeatherNFT.WeatherData[] memory history = weatherNFT.getWeatherHistory(
            0,
            block.timestamp - 1 days,
            block.timestamp + 1 days
        );

        assertEq(history.length, 3, "History should contain 3 entries");

        assertEq(
            history[0].temperature,
            25,
            "First entry temperature should be 25"
        );
        assertEq(
            history[0].description,
            "Sunny",
            "First entry description should be Sunny"
        );

        assertEq(
            history[1].temperature,
            20,
            "Second entry temperature should be 20"
        );
        assertEq(
            history[1].description,
            "Cloudy",
            "Second entry description should be Cloudy"
        );

        assertEq(
            history[2].temperature,
            15,
            "Third entry temperature should be 15"
        );
        assertEq(
            history[2].description,
            "Rainy",
            "Third entry description should be Rainy"
        );
    }

    function testOnlyOwnerCanMint() public {
        vm.expectRevert("Ownable: caller is not the owner");
        weatherNFT.mintWeatherNFT(
            user1,
            25,
            80,
            10,
            "ipfs://sunny_image",
            "Sunny"
        );
    }

    function testOnlyOwnerCanUpdateWeatherData() public {
        vm.prank(owner);
        weatherNFT.mintWeatherNFT(
            user1,
            25,
            80,
            10,
            "ipfs://sunny_image",
            "Sunny"
        );

        vm.prank(user1);
        vm.expectRevert("Ownable: caller is not the owner");
        weatherNFT.updateWeatherData(
            0,
            20,
            70,
            15,
            "ipfs://cloudy_image",
            "Cloudy"
        );
    }
}
