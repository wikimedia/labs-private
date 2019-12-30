// Dummy blocked_nets with the IP of example.org
acl blocked_nets {
  "93.184.216.34"/32;
}
// Dummy bot_blocked_nets with the IP of placeholder.org
acl bot_blocked_nets {
  "192.241.194.113"/32;
}
// Dummy aws_nets with a single public cloud network
acl cloud_nets {
  "18.208.0.0/13";
}
