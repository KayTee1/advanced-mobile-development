import React, { useState, useEffect, useCallback } from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View, Button, TextInput, Image } from "react-native";
import Header from "./Header.js";
import WeatherInfo from "./WeatherInfo.js";
import LocationInput from "./LocationInput.js";

export default function App() {
  const [inputLocation, onChangeLocation] = useState("Tampere");
  const [weatherData, setWeatherData] = useState({});

  const fetchData = useCallback(
    async () => {
      console.log(inputLocation)
      try {
        const key = process.env.API_KEY;
        const location = inputLocation;
        const url = `https://api.openweathermap.org/data/2.5/weather?q=${location}&appid=${key}&units=metric`;
        const res = await fetch(url);
        const data = await res.json();

        setWeatherData(data);
      } catch (err) {
        console.error(err);
      }
    },
    [inputLocation]
  );

  useEffect(() => {
    fetchData();
  }, [fetchData]);

  const temperature = weatherData.main?.temp + " c";
  const windSpeed = weatherData.wind?.speed + " m/s";
  const weatherStatus =
    weatherData.weather && weatherData.weather.length
      ? weatherData.weather[0].main
      : undefined;
  const weatherIcon =
    weatherData.weather && weatherData.weather.length
      ? weatherData.weather[0].icon
      : undefined;

  const weatherLocation = weatherData.name;
  return (
    <View style={styles.container}>
      <Header location={weatherLocation} />
      <WeatherInfo
        weatherStatus={weatherStatus}
        weatherIcon={weatherIcon}
        temperature={temperature}
        windSpeed={windSpeed}
      />
      <LocationInput
        fetchData={() => fetchData()}
        location={inputLocation}
        onChangeLocation={onChangeLocation}
      />

      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});
