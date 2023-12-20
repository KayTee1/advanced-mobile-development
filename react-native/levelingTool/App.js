import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";
import LevelingScreen from "./components/LevelingScreen";
import LocationScreen from "./components/LocationScreen";

export default function App() {
  return (
    <View style={styles.container}>
      <Text>Leveling app</Text>
      <LevelingScreen />
      <LocationScreen />
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
