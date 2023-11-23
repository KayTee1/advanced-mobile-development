import React, { useState, useEffect, useCallback } from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View, Button, TextInput, Image } from "react-native";

export default function App() {
  const [text, onChangeText] = useState("tampere");
  const [location, onChangeLocation] = useState("");

  const [weatherData, setWeatherData] = useState({});

  const fetchData = useCallback(async () => {
    try {
      const key = process.env.REACT_APP_API_KEY;
      const location = text;
      const url = `https://api.openweathermap.org/data/2.5/weather?q=${location}&appid=${key}&units=metric`;
      const res = await fetch(url);
      const data = await res.json();

      setWeatherData(data);
    } catch (err) {
      console.error(err);
    }
  }, [text]);

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
      <Text>Weather Now</Text>
      <TextInput
        style={styles.input}
        onChangeText={onChangeLocation}
        value={location}
        placeholder="Enter Location"
      />
      <Text>{weatherLocation}</Text>
      <Text>{weatherStatus !== undefined ? weatherStatus : "Loading..."}</Text>
      <Image
        style={styles.image}
        source={{ uri: `https://openweathermap.org/img/wn/${weatherIcon}.png` }}
      />
      <Text>{temperature !== undefined ? temperature : "Loading..."}</Text>
      <Text>{windSpeed !== undefined ? windSpeed : "Loading..."}</Text>
      <Button title={"Update"} onPress={() => fetchData(location)}></Button>
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
  input: {
    height: 40,
    margin: 12,
    borderWidth: 1,
    padding: 10,
  },
  image: {
    width: 50,
    height: 50,
  },
});
