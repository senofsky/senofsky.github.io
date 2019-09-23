I recently attempted to make a kernel module that would execute a piece of code anytime a USB was plugged into the computer.

This would require a kernel module to have the following USB driver struct:
```
static struct usb_driver usb_detector_driver = {
    .owner = THIS_MODULE,
    .name = "usb_detector",
    .id_table = usb_detector_id_table,
    .probe = usb_detector_probe,
    .disconnect = usb_detector_disconnect,};
```

Where probe is a function that gets call anytime a USB is connected and disconnect is a function that is called when the USB disconnects. The id_table contains data that the ?usb subsystem? uses to match against connected devices.
Typically, this is where a Vendor ID or Product ID can be set or a class of devices such as HID devices. I wanted to execute a command anytime a USB was connected, so I would want to match against all devices. According to the various pieces of documentation (linux device drives, usb hotplugging page, kernel source code), I should be able to achieve that with this:

According to Linux Device Drivers 3rd ed.:
```
const struct usb_device_id *id_table
Pointer to thestruct usb_device_idtable that contains a list of all of the differ-ent kinds of USB devices this driver can accept. If this variable is not set, the probe function callback in the USB driver is never called. If you want your driver always to be called for every USB device in the system, create a entry that sets only thedriver_info field:
static struct usb_device_id usb_ids[ ] = {
    {.driver_info = 42},
    { }
};
```

This seemed simple enough, however things did not go as expected.

I am testing this on Ubuntu 18.04 Linux kernel 4.15.0-64-generic.

In order to test, my probe function is:
```
```

Therefore, "USB DEVICE FOUND: " will be logged to `/var/log/kern.log`  anytime a USB is detected.
There are my results:

iPhone
Samsung Flash Drive
Keyboard

For some reason, `probe` is not being called on some of the connections. Therefore, I have a misunderstanding of what's going on under the hood, so I decided to investigate.

TODO: investigate wtf is going on in USB subsystem
