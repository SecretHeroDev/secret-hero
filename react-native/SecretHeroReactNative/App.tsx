import { useEffect } from 'react';
import { View, StyleSheet, Button } from 'react-native';
import SecretHero from 'secrethero-react-native';

export default function App() {

 

  return (
    <View style={styles.container}>
      <Button title="Init" onPress={() => {
            SecretHero.initialize(
              {
                token:
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjbGllbnRJRCI6Ijk5IiwiaWF0IjoxNzI4Mzg5MTQzfQ.DE8bd4F7iI967_4E_GFv8Q12bBa2vgnBq7MTwcKRgXo",
                userId: "99999999",
                displayName: "TestReactNativeUser",
                country: "tr",
                language: "tr",
                isLayoutLTR: true ,
                theme: {
                    primaryColor: "#191D21",
                    secondaryColor: "#FFFFFF",
                    highlightColor: "#7B61FF",
                    buttonColor: "#92FFD7",
                }
              },
              {
                onInitialize(){
                  console.log(`SecretHero: onInitialize`)
                },
                onInitializeFailed(event) {
                  console.log(`SecretHero: onInitializeFailed: ${JSON.stringify(event)}`)
                },
                onOpen() {
                  console.log(`SecretHero: onOpen`)
                },
                onClose() {
                  console.log(`SecretHero: onClose`)
                },
                onEvent(event) {
                  console.log(`SecretHero: onEvent: ${JSON.stringify(event)}`)
                },
              }
            )
      }} />
        <Button title="Release" onPress={() => {
        SecretHero.release();
      }} />
      <Button title="Open" onPress={() => {
        SecretHero.start();
      }} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
