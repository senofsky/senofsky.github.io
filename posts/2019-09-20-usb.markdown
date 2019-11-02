I recently attempted to create a kernel module on Ubuntu 18.04 Linux kernel 4.15.0-64-generic that would execute a function anytime a USB was plugged into the computer. The following post is about my experience with this as well as my thought process.

To accomplish this, I created the following USB Driver:
```
static struct usb_driver usb_detector_driver = {
    .owner = THIS_MODULE,
    .name = "usb_detector",
    .id_table = usb_detector_id_table,
    .probe = usb_detector_probe,
    .disconnect = usb_detector_disconnect,};
```

Where the id_table contains data that the ?usb subsystem? uses to match against connected devices and probe is a function that gets call anytime a match is found. The disconnect function is executed whenever the driver is removed (or unregistered?)
Typically, this is where a Vendor ID or Product ID can be set or a class of devices such as HID devices. As mentioned earlier, I wanted to execute a command anytime a USB was connected. Therefore, I would want to match against all devices. According to the various pieces of documentation (linux device drives, usb hotplugging page, kernel source code), I should be able to achieve this goal with this:

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

I needed to determine the chain of events that occurs when a USB is physically connected to the computer. I grepped the Linux kernel using `grep -nr linux -e MATCH ` which resulted in many hits, however, `core/driver.c` seemed to be a natural place to start.
I started at `usb_match_id`, and started to move my way up the call chain. usb_match_id -> usb_device_match, where usb_device_match is a .match function in usb_bus_type. The usb_bus_type is of type `struct bus_type` which is found in `include/linux/device.h` and states the .match field will be called anytime a new device or driver is added for the bus. The usb_bus_stype is stored in a usb_device_driver struct during a call to `usb_register_device_driver`. This leads me to discovering that usb_register_device_driver is called in core/hub.c within usb_init.

first call is `usb_register_device_driver` which registers a new `usb_device_driver` with `driver_register`

usb_match_id sates ```usb_match_id searches an array of usb_device_id's and returns
 * the first one matching the device or interface, or null.
so it is possible that that another device driver is found before mine.

structs encountered:
device_driver
usb_driver
