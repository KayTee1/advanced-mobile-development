import React, { useState, useEffect, useCallback } from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View, Button, TextInput, Pressable } from "react-native";

export default function App() {
  const [text, onChangeText] = useState('tampere');
  const [location, onChangeLocation] = useState('');

  const [weatherData, setWeatherData] = useState({});

  const fetchData = useCallback(async (loc) => {
    try {
      const key = process.env.REACT_APP_API_KEY;
      const location = loc || text;
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

  const temperature = weatherData.main?.temp;
  const weatherStatus =
    weatherData.weather && weatherData.weather.length
      ? weatherData.weather[0].main
      : undefined;

  return (
    <View style={styles.container}>
      <Text>Weather Now</Text>
      <TextInput
        style={styles.input}
        onChangeText={onChangeLocation}
        value={location}
        placeholder="Enter Location"
      />
      <Text>
        Weather Description:{" "}
        {weatherStatus !== undefined ? weatherStatus : "Loading..."}
      </Text>
      <Text>
        Temperature: {temperature !== undefined ? temperature : "Loading..."}
      </Text>
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
  }
});
