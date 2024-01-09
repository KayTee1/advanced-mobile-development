import React, { useState } from "react";
import { View, Text, Button } from "react-native";
import { Accelerometer } from "expo-sensors";

const LevelingScreen = () => {
  const [{ x, y, z }, setData] = useState({ x: 0, y: 0, z: 0 });
  const [subscription, setSubscription] = useState(null);

  const [location, setLocation] = useState({ lat: 0, lng: 0 });

  const startSensors = () => {
    Accelerometer.setUpdateInterval(200);
    setSubscription(Accelerometer.addListener(setData));
  };

  return (
    <View>
      <Text>X:{x}</Text>
      <Text>Y:{y}</Text>
      <Text>Z:{z}</Text>
      <Button title="Start Leveling" onPress={startSensors}></Button>
    </View>
  );
};

export default LevelingScreen;
