// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WeatherNFT is ERC721, Ownable {
    uint256 private _nextTokenId;

    struct WeatherData {
        uint256 timestamp;
        int256 temperature;
        uint256 humidity;
        uint256 windSpeed;
        string imageUri;
        string description;
    }

    mapping(uint256 => WeatherData[]) private _tokenWeatherHistory;

    constructor() ERC721("WeatherNFT", "WNFT") Ownable(msg.sender) {}

    // here i mint a new NFT with initial weather data
    function mintWeatherNFT(
        address to,
        int256 temperature,
        uint256 humidity,
        uint256 windSpeed,
        string memory imageUri,
        string memory description
    ) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);

        // Add initial weather data
        WeatherData memory initialData = WeatherData({
            timestamp: block.timestamp,
            temperature: temperature,
            humidity: humidity,
            windSpeed: windSpeed,
            imageUri: imageUri,
            description: description
        });

        _tokenWeatherHistory[tokenId].push(initialData);
    }

    // here ia can update weather data for an existing NFT
    function updateWeatherData(
        uint256 tokenId,
        int256 temperature,
        uint256 humidity,
        uint256 windSpeed,
        string memory imageUri,
        string memory description
    ) public onlyOwner {
        require(_exists(tokenId), "Token does not exist");

        WeatherData memory newData = WeatherData({
            timestamp: block.timestamp,
            temperature: temperature,
            humidity: humidity,
            windSpeed: windSpeed,
            imageUri: imageUri,
            description: description
        });

        _tokenWeatherHistory[tokenId].push(newData);
    }

    // this function help me to retrieve the current weather data for a token
    function getCurrentWeather(
        uint256 tokenId
    ) public view returns (WeatherData memory) {
        require(_exists(tokenId), "Token does not exist");
        uint256 length = _tokenWeatherHistory[tokenId].length;
        require(length > 0, "No weather data available");
        return _tokenWeatherHistory[tokenId][length - 1];
    }

    // this function help me to retrieve weather data for a specific period
    function getWeatherHistory(
        uint256 tokenId,
        uint256 startTimestamp,
        uint256 endTimestamp
    ) public view returns (WeatherData[] memory) {
        require(_exists(tokenId), "Token does not exist");

        uint256 historyLength = _tokenWeatherHistory[tokenId].length;
        uint256 count = 0;

        // i Count the relevant data points
        for (uint256 i = 0; i < historyLength; i++) {
            WeatherData memory data = _tokenWeatherHistory[tokenId][i];
            if (
                data.timestamp >= startTimestamp &&
                data.timestamp <= endTimestamp
            ) {
                count++;
            }
        }

        // Here for Collect the relevant data points
        WeatherData[] memory result = new WeatherData[](count);
        uint256 index = 0;

        for (uint256 i = 0; i < historyLength; i++) {
            WeatherData memory data = _tokenWeatherHistory[tokenId][i];
            if (
                data.timestamp >= startTimestamp &&
                data.timestamp <= endTimestamp
            ) {
                result[index++] = data;
            }
        }

        return result;
    }

    function _exists(uint256 tokenId) internal view returns (bool) {
        return _ownerOf(tokenId) != address(0);
    }
}
