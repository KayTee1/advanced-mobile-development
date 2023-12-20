import React, { useState } from "react";
import { View, Text, Button } from "react-native";
import * as Location from "expo-location";

const LocationScreen = () => {
  const [location, setLocation] = useState({ lat: 0, lng: 0 });

  const getLocation = async () => {
    let { status } = await Location.requestForegroundPermissionsAsync();
    if (status !== "granted") {
      setErrorMsg("Permission to access location was denied");
      return;
    }

    let loc = await Location.getCurrentPositionAsync({});
    setLocation({
      lat: location.coords.latitude,
      lng: location.coords.longitude,
    });
  };
  return (
    <View>
      <Text>Lat:{location.lat}</Text>
      <Text>Lng:{location.lng}</Text>
      <Button title="Get Location" onPress={getLocation}></Button>
    </View>
  );
};

export default LocationScreen;
