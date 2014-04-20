Mud
===

@M3talsmith made mention that he liked MUDs. Here's a mud I made.
It's got:

 - Sockets
 - Threads
 - ?????
 - 0 external runtime dependencies (pure Ruby, yo.)

Installation
---

 - `bundle install`
 - Run `ruby mud`
 - type `telnet localhost 4000` in a different terminal session.

Word of Caution
---

**Telnet is insecure by default**. All network traffic to the game is sent in the clear. Furthermore, no password hashing mechanism exists in the codebase. Don't use real passwords when running this codebase.