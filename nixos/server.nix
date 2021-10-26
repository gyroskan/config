{ ... }:

{
  interfaces.eth0 = {
      ipv4.addresses = [ { address = "45.90.162.86"; prefixLength = 27; } ];
      ipv6.addresses = [ { address = "2a0c:b642:4001:7:78bc:92ff:fe88:ccda"; prefixLength = 64; } ];
  };
}
