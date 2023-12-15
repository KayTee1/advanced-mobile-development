import React from "react";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, View } from "react-native";
import { NavigationContainer } from "@react-navigation/native";
import { createStackNavigator } from "@react-navigation/stack";
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";

import CurrentWeatherScreen from "./screens/CurrentWeatherScreen";
import WeatherForecastScreen from "./screens/WeatherForecastScreen";

const Stack = createStackNavigator();
const Tab = createBottomTabNavigator();

export default function App() {
  return (
    <NavigationContainer>
      <Tab.Navigator>
        <Tab.Screen
          name="Current weather"
          component={CurrentWeatherScreen}
        ></Tab.Screen>
        <Tab.Screen
          name="Weather forecast"
          component={WeatherForecastScreen}
        ></Tab.Screen>
      </Tab.Navigator>
    </NavigationContainer>
  );
}
