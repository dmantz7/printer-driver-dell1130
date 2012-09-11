
# License

Released under WTFPL - Do What The Fuck You Want To Public License.


# Install the rasterizer

Go to this root folder and execute the following command in your shell:

```bash
sudo ./install.sh
```


# Install the printer in CUPS

Open your Web Browser and navigate to [http://localhost:631/admin](http://localhost:631/admin).

* Click on **Add Printer**

* If you are using a remote printer that is, for example, plugged in
at your **fritz.box**, you have to select **AppSocket / HP JetDirect**.

* Click on **Continue** and enter the socket url, which will be similar
to **socket://fritz.box:9100** if you are using a remote printer.

* Enter the details of the printer, click on **Continue**.

* **Choose File** for a custom **PPD file** and use the file that is
located in this folder with the name **dp1130.ppd**.

