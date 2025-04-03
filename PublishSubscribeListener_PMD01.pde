// PublishSubscribeListener_PMD01
// 3 April 2025

//This example sketch connects to the public shiftr.io instance and sends a message on every keystroke.
// After starting the sketch you can find the client here: https://www.shiftr.io/try.
//
// Note: If you're running the sketch via the Android Mode you need to set the INTERNET permission
// in Android > Sketch Permissions.
//
// by Joël Gähwiler
// https://github.com/256dpi/processing-mqtt


//mac_to_NameDict.set("3C61053DF08C", "20240421_USA1");
// mac_to_NameDict.set("3C6105324EAC", "20240421_USA2");
// mac_to_NameDict.set("3C61053DF63C", "20240421_USA3");
// mac_to_NameDict.set("10061C686A14", "20240421_USA4");
// mac_to_NameDict.set("FCB467F4F74C", "20240421_USA5");
// mac_to_NameDict.set("CCDBA730098C", "20240421_LEB1");
// mac_to_NameDict.set("CCDBA730BFD4", "20240421_LEB2");
// mac_to_NameDict.set("CCDBA7300954", "20240421_LEB3");
// mac_to_NameDict.set("A0DD6C0EFD28", "20240421_LEB4");
// //  mac_to_NameDict.set("A0DD6C0EFD??", "20240421_LEB5");
// mac_to_NameDict.set("A0B765F51E28", "MockingKrake_LEB");
// mac_to_NameDict.set("3C61053DC954", "Not Homework2, Maryville TN");


import mqtt.*;

MQTTClient client;

class Adapter implements MQTTListener {
  void clientConnected() {
    println("client connected");

    //client.subscribe("/Topic");
    client.subscribe("CCDBA730098C_ACK"); // LB 1
    client.subscribe("CCDBA7300954_ACK"); // LB 3
    client.subscribe("3C61053DF08C_ACK"); // USA 1
  }

  void messageReceived(String topic, byte[] payload) {
    println("new message: " + topic + " - " + new String(payload));
  }

  void connectionLost() {
    println("connection lost");
  }
}

Adapter adapter;

void setup() {
  size(900, 360);
  adapter = new Adapter();
  client = new MQTTClient(this, adapter);
  //client.connect("protocol://PASSWORD:USERNAME@BROKER_URL", "ID");
  client.connect("mqtt://public:public@public.cloud.shiftr.io", "NAGHAMH");
}

void draw() {
}

void keyPressed() {
  client.publish("CCDBA730098C_ALM", "a3 Nagham wants chocolate");
  client.publish("CCDBA7300954_ALM", "a4 Lee wants chocolate too");
  client.publish("3C61053DF08C_ALM", "a2 small nectar-feeding tropical American bird wants sugar");
   
}
 
