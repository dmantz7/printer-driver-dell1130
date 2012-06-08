
1. Install the printer in CUPS:

Open Web Browser, go to http://localhost:631 and configure the printer

In my case, I plugged the printer via USB to my fritz.box, so I was
using the socket://fritz.box:9100 raw socket connection.

Select the manual PPD upload, use the dp1130.ppd inside this folder


2. Install the rastertosamsungspl file:

Depending on your architecture, you will need either the x86 or the x86_64 binary.

In your Terminal/Shell, do the following (this example uses the x86_64 variant):


cp x86_64-rastertosamsungspl /usr/lib/cups/filter/rastertosamsungspl
cd /usr/lib/cups/filter
sudo chown root:root rastertosamsungspl
sudo chmod 0755 rastertosamsungspl


3. That's it, you're done :)

